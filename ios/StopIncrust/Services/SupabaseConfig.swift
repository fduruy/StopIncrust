import Foundation

enum SupabaseConfig {
    // Local dev: values from `supabase status` (Project URL + Publishable key).
    // For production, replace with the hosted project values (never the secret key).
    static let url = URL(string: "http://127.0.0.1:54321")!
    static let anonKey = "sb_publishable_REPLACE_ME"
}
