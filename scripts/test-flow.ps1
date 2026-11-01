param(
  [string]$BaseUrl = "http://127.0.0.1:54321",
  [Parameter(Mandatory = $true)][string]$AnonKey,
  [Parameter(Mandatory = $true)][string]$ServiceKey
)

$ErrorActionPreference = "Stop"
$results = @()
function Check($name, $condition) {
  $script:results += [pscustomobject]@{ Test = $name; Ok = [bool]$condition }
  if ($condition) { Write-Host "PASS  $name" -ForegroundColor Green } else { Write-Host "FAIL  $name" -ForegroundColor Red }
}

$anonHeaders = @{ apikey = $AnonKey; "Content-Type" = "application/json" }
$svcHeaders  = @{ apikey = $ServiceKey; Authorization = "Bearer $ServiceKey"; "Content-Type" = "application/json"; Prefer = "return=representation" }

function New-AppUser($email, $phone, $first, $last, $password) {
  $u = Invoke-RestMethod "$BaseUrl/auth/v1/admin/users" -Method POST -Headers $svcHeaders -Body (@{ email = $email; password = $password; email_confirm = $true } | ConvertTo-Json)
  Invoke-RestMethod "$BaseUrl/rest/v1/profiles" -Method POST -Headers $svcHeaders -Body (@{ id = $u.id; phone = $phone; first_name = $first; last_name = $last } | ConvertTo-Json) | Out-Null
  $t = Invoke-RestMethod "$BaseUrl/auth/v1/token?grant_type=password" -Method POST -Headers $anonHeaders -Body (@{ email = $email; password = $password } | ConvertTo-Json)
  return $t.access_token
}

function Call-Function($name, $token, $body) {
  $h = @{ Authorization = "Bearer $token"; apikey = $AnonKey; "Content-Type" = "application/json" }
  try { return Invoke-RestMethod "$BaseUrl/functions/v1/$name" -Method POST -Headers $h -Body ($body | ConvertTo-Json -Depth 5) }
  catch {
    $raw = $_.ErrorDetails.Message
    try { return $raw | ConvertFrom-Json } catch { return @{ error = "HTTP $($_.Exception.Response.StatusCode.value__) : $raw" } }
  }
}

$hostToken  = New-AppUser "host@test.local"  "+33600000001" "Hugo"  "Host"  "Test1234!"
$guestToken = New-AppUser "guest@test.local" "+33600000002" "Garance" "Guest" "Test1234!"
Write-Host "Users Host et Guest créés et connectés."

# 1. Host crée l'événement (2 incrustes max par invité)
$eventDate = (Get-Date).AddMonths(2).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
$event = Call-Function "create-event" $hostToken @{ name = "Soirée test"; event_date = $eventDate; location = "Paris"; max_incrustes_per_guest = 2 }
Check "create-event renvoie un id" ($event.event.id)
$eventId = $event.event.id

# 2. Host invite le Guest (lookup par téléphone)
$inv = Call-Function "create-invitation" $hostToken @{ event_id = $eventId; guest_phone = "+33600000002" }
Check "create-invitation renvoie un QR signé" ($inv.invitation.qr_payload -and $inv.invitation.qr_payload.Split(".").Count -eq 2)
$invQr = $inv.invitation.qr_payload
$invId = $inv.invitation.id

# 3. Le Guest émet un ticket d'incruste
$inc = Call-Function "issue-incruste" $guestToken @{ invitation_id = $invId; guest_name = "Dupont"; guest_first_name = "Incruste" }
Check "issue-incruste renvoie un QR signé" ($inc.incruste_ticket.qr_payload)
$incQr = $inc.incruste_ticket.qr_payload

# 4. Un user lambda tente d'émettre une incruste -> refusé
$strangerToken = New-AppUser "stranger@test.local" "+33600000003" "Sam" "Stranger" "Test1234!"
$denied = Call-Function "issue-incruste" $strangerToken @{ invitation_id = $invId; guest_name = "X"; guest_first_name = "Y" }
Check "incruste par un non-invité refusée (403)" ($denied.error)

# 5. Scan de l'invitation par le Host -> valide
$s1 = Call-Function "validate-scan" $hostToken @{ qr = $invQr }
Check "scan invitation valide" ($s1.valid -eq $true -and $s1.type -eq "invitation")

# 6. Scan de l'incruste par le Host -> valide
$s2 = Call-Function "validate-scan" $hostToken @{ qr = $incQr }
Check "scan incruste valide" ($s2.valid -eq $true -and $s2.type -eq "incruste")

# 7. Double scan de l'invitation -> refusé
$s3 = Call-Function "validate-scan" $hostToken @{ qr = $invQr }
Check "double scan refusé (already_scanned)" ($s3.valid -eq $false -and $s3.reason -eq "already_scanned")

# 8. QR forgé -> refusé
$s4 = Call-Function "validate-scan" $hostToken @{ qr = "eyJ2IjoxfQ.fauxsignature" }
Check "QR forgé refusé" ($s4.valid -eq $false)

# 9. Le Guest tente de scanner (non désigné scanner) -> 403
$s5 = Call-Function "validate-scan" $guestToken @{ qr = $incQr }
Check "scan par un non-scanner refusé (403)" ($s5.error)

Write-Host ""
$failed = @($results | Where-Object { -not $_.Ok }).Count
Write-Host "Résultat : $($results.Count - $failed)/$($results.Count) tests OK"
if ($failed -gt 0) { exit 1 }
