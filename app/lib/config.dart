/// Supabase connection settings.
///
/// Local dev values come from `supabase status` (Project URL + Publishable key).
/// - Android emulator: http://10.0.2.2:54321 (10.0.2.2 = the host PC)
/// - iOS simulator:    http://127.0.0.1:54321
/// - Real phone:       http://<your-PC-LAN-IP>:54321  (e.g. http://192.168.1.42:54321)
///
/// NEVER put the Secret (service_role) key here — only the Publishable key.
class SupabaseConfig {
  static const String url = 'http://10.0.2.2:54321';
  static const String anonKey = 'sb_publishable_REPLACE_ME';
}
