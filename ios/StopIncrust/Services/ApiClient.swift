import Foundation

final class ApiClient {
    static let shared = ApiClient()

    private let base = SupabaseConfig.url
    private let anonKey = SupabaseConfig.anonKey
    private var accessToken: String?

    private init() {}

    func setSession(accessToken: String?) { self.accessToken = accessToken }

    // MARK: - Auth (OTP by phone)

    func sendOtp(phone: String) async throws {
        var req = URLRequest(url: base.appendingPathComponent("auth/v1/otp"))
        req.httpMethod = "POST"
        req.setValue(anonKey, forHTTPHeaderField: "apikey")
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.httpBody = try JSONSerialization.data(withJSONObject: ["phone": phone, "type": "sms"])
        _ = try await URLSession.shared.data(for: req)
    }

    func verifyOtp(phone: String, token: String) async throws -> String {
        var req = URLRequest(url: base.appendingPathComponent("auth/v1/verify"))
        req.httpMethod = "POST"
        req.setValue(anonKey, forHTTPHeaderField: "apikey")
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.httpBody = try JSONSerialization.data(withJSONObject: ["phone": phone, "token": token, "type": "sms"])
        let (data, _) = try await URLSession.shared.data(for: req)
        let session = try JSONDecoder().decode(AuthSession.self, from: data)
        accessToken = session.access_token
        return session.access_token
    }

    // MARK: - Edge Functions

    func createEvent(name: String, date: Date, location: String, maxIncrustes: Int?) async throws -> Event {
        let body: [String: Any?] = [
            "name": name,
            "event_date": ISO8601DateFormatter().string(from: date),
            "location": location,
            "max_incrustes_per_guest": maxIncrustes,
        ]
        let resp: EventEnvelope = try await call("create-event", body: body)
        return resp.event
    }

    func createInvitation(eventId: String, guestPhone: String) async throws -> Invitation {
        let resp: InvitationEnvelope = try await call("create-invitation", body: ["event_id": eventId, "guest_phone": guestPhone])
        return resp.invitation
    }

    func addScanner(eventId: String, scannerPhone: String) async throws {
        _ = try await call("add-scanner", body: ["event_id": eventId, "scanner_phone": scannerPhone]) as ScannerEnvelope
    }

    func issueIncruste(invitationId: String, firstName: String, lastName: String) async throws -> IncrusteTicket {
        let resp: IncrusteEnvelope = try await call("issue-incruste", body: [
            "invitation_id": invitationId,
            "guest_first_name": firstName,
            "guest_name": lastName,
        ])
        return resp.incruste_ticket
    }

    func validateScan(qr: String) async throws -> ScanResult {
        try await call("validate-scan", body: ["qr": qr])
    }

    // MARK: - Private

    private func call<T: Decodable>(_ function: String, body: [String: Any?]) async throws -> T {
        guard let token = accessToken else { throw ApiClientError.notAuthenticated }
        var req = URLRequest(url: base.appendingPathComponent("functions/v1/\(function)"))
        req.httpMethod = "POST"
        req.setValue(anonKey, forHTTPHeaderField: "apikey")
        req.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.httpBody = try JSONSerialization.data(withJSONObject: body.compactMapValues { $0 })
        let (data, response) = try await URLSession.shared.data(for: req)
        if let http = response as? HTTPURLResponse, http.statusCode >= 400 {
            if let apiError = try? JSONDecoder().decode(ApiError.self, from: data) {
                throw ApiClientError.server(apiError.error)
            }
            throw ApiClientError.server("HTTP \(http.statusCode)")
        }
        return try JSONDecoder().decode(T.self, from: data)
    }

    private struct AuthSession: Decodable { let access_token: String }
    private struct EventEnvelope: Decodable { let event: Event }
    private struct InvitationEnvelope: Decodable { let invitation: Invitation }
    private struct IncrusteEnvelope: Decodable { let incruste_ticket: IncrusteTicket }
    private struct ScannerEnvelope: Decodable { let event_id: String }
}

enum ApiClientError: LocalizedError {
    case notAuthenticated
    case server(String)

    var errorDescription: String? {
        switch self {
        case .notAuthenticated: return "Not authenticated"
        case .server(let message): return message
        }
    }
}
