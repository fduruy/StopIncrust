param(
  [string]$BaseUrl = "http://127.0.0.1:54321",
  [Parameter(Mandatory = $true)][string]$AnonKey,
  [Parameter(Mandatory = $true)][string]$ServiceKey
)

$ErrorActionPreference = "Stop"
$results = @()
function Check($name, $condition, $detail = $null) {
  $script:results += [pscustomobject]@{ Test = $name; Ok = [bool]$condition }
  if ($condition) { Write-Host "PASS  $name" -ForegroundColor Green }
  else {
    Write-Host "FAIL  $name" -ForegroundColor Red
    if ($detail) { Write-Host "      -> $($detail | ConvertTo-Json -Compress -Depth 4)" -ForegroundColor Yellow }
  }
}

$anonHeaders = @{ apikey = $AnonKey; "Content-Type" = "application/json" }
$svcHeaders  = @{ apikey = $ServiceKey; Authorization = "Bearer $ServiceKey"; "Content-Type" = "application/json"; Prefer = "return=representation" }

function New-AppUser($email, $phone, $first, $last, $password) {
  try {
    $u = Invoke-RestMethod "$BaseUrl/auth/v1/admin/users" -Method POST -Headers $svcHeaders -Body (@{ email = $email; password = $password; email_confirm = $true } | ConvertTo-Json)
  } catch {
    $existing = Invoke-RestMethod "$BaseUrl/auth/v1/admin/users?page=1&per_page=1000" -Headers $svcHeaders
    $u = ($existing.users | Where-Object { $_.email -eq $email })[0]
    if (-not $u) { throw "user $email not found after creation error" }
  }
  try {
    Invoke-RestMethod "$BaseUrl/rest/v1/profiles" -Method POST -Headers $svcHeaders -Body (@{ id = $u.id; phone = $phone; first_name = $first; last_name = $last } | ConvertTo-Json) | Out-Null
  } catch {
    if ($_ -notmatch "duplicate") { throw }
  }
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

$hostToken  = New-AppUser "host@test.local"  "+33600000001" "Hugo"     "Host"     "Test1234!"
$guestToken = New-AppUser "guest@test.local" "+33600000002" "Garance"  "Guest"    "Test1234!"
Write-Host "Host and Guest users ready and logged in."

# 1. Host creates the event (max 2 incruste tickets per guest)
$eventDate = (Get-Date).AddMonths(2).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
$event = Call-Function "create-event" $hostToken @{ name = "Test party"; event_date = $eventDate; location = "Paris"; max_incrustes_per_guest = 2 }
Check "create-event returns an id" ($event.event.id)
$eventId = $event.event.id

# 2. Host invites the Guest (lookup by phone)
$inv = Call-Function "create-invitation" $hostToken @{ event_id = $eventId; guest_phone = "+33600000002" }
Check "create-invitation returns a signed QR" ($inv.invitation.qr_payload -and $inv.invitation.qr_payload.Split(".").Count -eq 2) $inv
$invQr = $inv.invitation.qr_payload
$invId = $inv.invitation.id

# 3. Guest issues an incruste ticket
$inc = Call-Function "issue-incruste" $guestToken @{ invitation_id = $invId; guest_name = "Dupont"; guest_first_name = "PlusOne" }
Check "issue-incruste returns a signed QR" ($inc.incruste_ticket.qr_payload) $inc
$incQr = $inc.incruste_ticket.qr_payload

# 4. A stranger tries to issue an incruste -> denied
$strangerToken = New-AppUser "stranger@test.local" "+33600000003" "Sam" "Stranger" "Test1234!"
$denied = Call-Function "issue-incruste" $strangerToken @{ invitation_id = $invId; guest_name = "X"; guest_first_name = "Y" }
Check "incruste by a non-invited user is denied (403)" ($denied.error)

# 5. Host scans the invitation -> valid
$s1 = Call-Function "validate-scan" $hostToken @{ qr = $invQr }
Check "invitation scan is valid" ($s1.valid -eq $true -and $s1.type -eq "invitation") $s1

# 6. Host scans the incruste ticket -> valid (parent invitation already scanned is fine)
$s2 = Call-Function "validate-scan" $hostToken @{ qr = $incQr }
Check "incruste scan is valid" ($s2.valid -eq $true -and $s2.type -eq "incruste") $s2

# 7. Double scan of the invitation -> rejected
$s3 = Call-Function "validate-scan" $hostToken @{ qr = $invQr }
Check "double scan is rejected (already_scanned)" ($s3.valid -eq $false -and $s3.reason -eq "already_scanned") $s3

# 8. Forged QR -> rejected
$s4 = Call-Function "validate-scan" $hostToken @{ qr = "eyJ2IjoxfQ.forgedsignature" }
Check "forged QR is rejected" ($s4.valid -eq $false) $s4

# 9. Guest tries to scan (not a designated scanner) -> 403
$s5 = Call-Function "validate-scan" $guestToken @{ qr = $incQr }
Check "scan by a non-scanner is denied (403)" ($s5.error)

Write-Host ""
$failed = @($results | Where-Object { -not $_.Ok }).Count
Write-Host "Result: $($results.Count - $failed)/$($results.Count) tests OK"
if ($failed -gt 0) { exit 1 }
