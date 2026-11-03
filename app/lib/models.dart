class Event {
  final String id;
  final String name;
  final String eventDate;
  final String location;
  final int? maxIncrustesPerGuest; // 0 = forbidden, null = unlimited, N = limit

  Event({
    required this.id,
    required this.name,
    required this.eventDate,
    required this.location,
    required this.maxIncrustesPerGuest,
  });

  factory Event.fromJson(Map<String, dynamic> j) => Event(
        id: j['id'] as String,
        name: j['name'] as String,
        eventDate: j['event_date'] as String,
        location: j['location'] as String,
        maxIncrustesPerGuest: j['max_incrustes_per_guest'] as int?,
      );
}

class Invitation {
  final String id;
  final String eventId;
  final String status;
  final String? qrPayload;

  Invitation({
    required this.id,
    required this.eventId,
    required this.status,
    this.qrPayload,
  });

  factory Invitation.fromJson(Map<String, dynamic> j) => Invitation(
        id: j['id'] as String,
        eventId: j['event_id'] as String,
        status: j['status'] as String,
        qrPayload: j['qr_payload'] as String?,
      );
}

class IncrusteTicket {
  final String id;
  final String parentInvitationId;
  final String guestName;
  final String guestFirstName;
  final String status;
  final String? qrPayload;

  IncrusteTicket({
    required this.id,
    required this.parentInvitationId,
    required this.guestName,
    required this.guestFirstName,
    required this.status,
    this.qrPayload,
  });

  factory IncrusteTicket.fromJson(Map<String, dynamic> j) => IncrusteTicket(
        id: j['id'] as String,
        parentInvitationId: j['parent_invitation_id'] as String,
        guestName: j['guest_name'] as String,
        guestFirstName: j['guest_first_name'] as String,
        status: j['status'] as String,
        qrPayload: j['qr_payload'] as String?,
      );
}

class ScanResult {
  final bool valid;
  final String? reason;
  final String? type;
  final String? guestFirstName;
  final String? guestLastName;

  ScanResult({
    required this.valid,
    this.reason,
    this.type,
    this.guestFirstName,
    this.guestLastName,
  });

  factory ScanResult.fromJson(Map<String, dynamic> j) => ScanResult(
        valid: j['valid'] as bool? ?? false,
        reason: j['reason'] as String?,
        type: j['type'] as String?,
        guestFirstName: j['guest']?['first_name'] as String?,
        guestLastName: j['guest']?['last_name'] as String?,
      );
}

class ApiException implements Exception {
  final String message;
  ApiException(this.message);
  @override
  String toString() => message;
}
