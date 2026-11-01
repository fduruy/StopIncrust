package com.stopincrust.app

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody

object ApiClient {
    // Local dev: values from `supabase status` (Project URL + Publishable key).
    private const val BASE_URL = "http://10.0.2.2:54321" // 10.0.2.2 = host machine from Android emulator
    private const val ANON_KEY = "sb_publishable_REPLACE_ME"

    private val http = OkHttpClient()
    private val json = Json { ignoreUnknownKeys = true }
    private var accessToken: String? = null

    fun setSession(token: String?) { accessToken = token }

    suspend fun sendOtp(phone: String) = post("/auth/v1/otp", mapOf("phone" to phone, "type" to "sms"), auth = false)

    suspend fun verifyOtp(phone: String, token: String): String {
        val resp = post("/auth/v1/verify", mapOf("phone" to phone, "token" to token, "type" to "sms"), auth = false)
        val session = json.decodeFromString<AuthSession>(resp)
        accessToken = session.access_token
        return session.access_token
    }

    suspend fun createEvent(name: String, eventDateIso: String, location: String, maxIncrustes: Int?): Event {
        val body = buildMap {
            put("name", name); put("event_date", eventDateIso); put("location", location)
            if (maxIncrustes != null) put("max_incrustes_per_guest", maxIncrustes)
            else put("max_incrustes_per_guest", null as Int?)
        }
        return json.decodeFromString<CreateEventResponse>(callFunction("create-event", body)).event
    }

    suspend fun createInvitation(eventId: String, guestPhone: String): Invitation =
        json.decodeFromString<InvitationResponse>(callFunction("create-invitation", mapOf("event_id" to eventId, "guest_phone" to guestPhone))).invitation

    suspend fun addScanner(eventId: String, scannerPhone: String) {
        callFunction("add-scanner", mapOf("event_id" to eventId, "scanner_phone" to scannerPhone))
    }

    suspend fun issueIncruste(invitationId: String, firstName: String, lastName: String): IncrusteTicket =
        json.decodeFromString<IncrusteResponse>(callFunction("issue-incruste", mapOf(
            "invitation_id" to invitationId, "guest_first_name" to firstName, "guest_name" to lastName))).incruste_ticket

    suspend fun validateScan(qr: String): ScanResult =
        json.decodeFromString(callFunction("validate-scan", mapOf("qr" to qr)))

    private suspend fun callFunction(name: String, body: Map<String, Any?>): String =
        post("/functions/v1/$name", body, auth = true)

    private suspend fun post(path: String, body: Map<String, Any?>, auth: Boolean): String = withContext(Dispatchers.IO) {
        val reqBody = json.encodeToString(body).toRequestBody("application/json".toMediaType())
        val builder = Request.Builder()
            .url(BASE_URL + path)
            .post(reqBody)
            .addHeader("apikey", ANON_KEY)
            .addHeader("Content-Type", "application/json")
        if (auth) builder.addHeader("Authorization", "Bearer ${accessToken ?: throw ApiException("Not authenticated")}")
        val resp = http.newCall(builder.build()).execute()
        val text = resp.body?.string() ?: throw ApiException("Empty response")
        if (!resp.isSuccessful) {
            val msg = runCatching { json.decodeFromString<ApiError>(text).error }.getOrDefault(text)
            throw ApiException(msg)
        }
        text
    }
}

class ApiException(message: String) : Exception(message)

@Serializable private data class AuthSession(val access_token: String)
@Serializable private data class ApiError(val error: String)
@Serializable private data class CreateEventResponse(val event: Event)
@Serializable private data class InvitationResponse(val invitation: Invitation)
@Serializable private data class IncrusteResponse(val incruste_ticket: IncrusteTicket)

@Serializable
data class Event(
    val id: String,
    val name: String,
    val event_date: String,
    val location: String,
    val max_incrustes_per_guest: Int? = null,
)

@Serializable
data class Invitation(
    val id: String,
    val event_id: String,
    val status: String,
    val qr_payload: String? = null,
)

@Serializable
data class IncrusteTicket(
    val id: String,
    val parent_invitation_id: String,
    val guest_name: String,
    val guest_first_name: String,
    val status: String,
    val qr_payload: String? = null,
)

@Serializable
data class ScanResult(
    val valid: Boolean,
    val reason: String? = null,
    val type: String? = null,
    val guest: GuestName? = null,
) {
    @Serializable
    data class GuestName(val first_name: String? = null, val last_name: String? = null)
}
