import Foundation

struct Event: Codable, Identifiable {
    let id: String
    let name: String
    let event_date: String
    let location: String
    let max_incrustes_per_guest: Int?
}

struct Invitation: Codable, Identifiable {
    let id: String
    let event_id: String
    let status: String
    var qr_payload: String?
}

struct IncrusteTicket: Codable, Identifiable {
    let id: String
    let parent_invitation_id: String
    let guest_name: String
    let guest_first_name: String
    let status: String
    var qr_payload: String?
}

struct ScanResult: Codable {
    let valid: Bool
    let reason: String?
    let type: String?
    let guest: GuestName?

    struct GuestName: Codable {
        let first_name: String?
        let last_name: String?
    }
}

struct ApiError: Codable {
    let error: String
}
