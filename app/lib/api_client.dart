import 'package:supabase_flutter/supabase_flutter.dart';
import 'models.dart';

/// Thin wrapper around Supabase: auth (phone OTP) + Edge Functions + REST reads.
class ApiClient {
  final SupabaseClient _sb;
  ApiClient(this._sb);

  String get _uid => _sb.auth.currentUser?.id ?? '';

  // ---------- Auth ----------

  /// Sends the SMS OTP. In local dev (sms autoconfirm), a session may come back immediately.
  Future<void> sendOtp(String phone) => _sb.auth.signInWithOtp(phone: phone);

  bool get hasSession => _sb.auth.currentSession != null;

  Future<AuthResponse> verifyOtp(String phone, String code) =>
      _sb.auth.verifyOTP(type: OtpType.sms, phone: phone, token: code);

  /// Creates/updates the profile row for the current user (RLS: self only).
  Future<void> ensureProfile({
    required String phone,
    required String firstName,
    required String lastName,
  }) async {
    await _sb.from('profiles').upsert({
      'id': _uid,
      'phone': phone,
      'first_name': firstName,
      'last_name': lastName,
    });
  }

  // ---------- Edge Functions ----------

  Future<Event> createEvent({
    required String name,
    required DateTime date,
    required String location,
    int? maxIncrustesPerGuest, // null = unlimited, 0 = forbidden
  }) async {
    final res = await _sb.functions.invoke('create-event', body: {
      'name': name,
      'event_date': date.toUtc().toIso8601String(),
      'location': location,
      'max_incrustes_per_guest': maxIncrustesPerGuest,
    });
    return Event.fromJson(_data(res)['event'] as Map<String, dynamic>);
  }

  Future<Invitation> createInvitation({required String eventId, required String guestPhone}) async {
    final res = await _sb.functions.invoke('create-invitation', body: {
      'event_id': eventId,
      'guest_phone': guestPhone,
    });
    return Invitation.fromJson(_data(res)['invitation'] as Map<String, dynamic>);
  }

  Future<void> addScanner({required String eventId, required String scannerPhone}) async {
    await _sb.functions.invoke('add-scanner', body: {
      'event_id': eventId,
      'scanner_phone': scannerPhone,
    });
  }

  Future<IncrusteTicket> issueIncruste({
    required String invitationId,
    required String firstName,
    required String lastName,
  }) async {
    final res = await _sb.functions.invoke('issue-incruste', body: {
      'invitation_id': invitationId,
      'guest_first_name': firstName,
      'guest_name': lastName,
    });
    return IncrusteTicket.fromJson(_data(res)['incruste_ticket'] as Map<String, dynamic>);
  }

  Future<ScanResult> validateScan(String qr) async {
    final res = await _sb.functions.invoke('validate-scan', body: {'qr': qr});
    return ScanResult.fromJson(_data(res) as Map<String, dynamic>);
  }

  // ---------- REST reads (RLS-scoped) ----------

  Future<List<Event>> myHostedEvents() async {
    final rows = await _sb.from('events').select().eq('host_id', _uid).order('created_at');
    return rows.map((r) => Event.fromJson(r as Map<String, dynamic>)).toList();
  }

  Future<List<Invitation>> myInvitations() async {
    final rows = await _sb.from('invitations').select().eq('guest_id', _uid).order('created_at');
    return rows.map((r) => Invitation.fromJson(r as Map<String, dynamic>)).toList();
  }

  Future<List<Invitation>> invitationsOfEvent(String eventId) async {
    final rows = await _sb.from('invitations').select().eq('event_id', eventId).order('created_at');
    return rows.map((r) => Invitation.fromJson(r as Map<String, dynamic>)).toList();
  }

  Future<List<IncrusteTicket>> incrusteTicketsOfInvitation(String invitationId) async {
    final rows =
        await _sb.from('incruste_tickets').select().eq('parent_invitation_id', invitationId).order('created_at');
    return rows.map((r) => IncrusteTicket.fromJson(r as Map<String, dynamic>)).toList();
  }

  // ---------- helpers ----------

  Map<String, dynamic> _data(FunctionResponse res) {
    if (res.data == null) throw ApiException('Empty response from server');
    if (res.data is Map<String, dynamic> && res.data['error'] != null) {
      throw ApiException(res.data['error'].toString());
    }
    return res.data as Map<String, dynamic>;
  }
}
