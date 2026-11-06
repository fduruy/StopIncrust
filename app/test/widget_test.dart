// Basic smoke tests for StopIncrust models (no Supabase init needed).

import 'package:flutter_test/flutter_test.dart';
import 'package:stopincrust/models.dart';

void main() {
  test('Event.fromJson parses max_incrustes_per_guest (0 / N / null)', () {
    final e0 = Event.fromJson({
      'id': 'e1', 'name': 'A', 'event_date': '2026-12-24T20:00:00Z', 'location': 'Paris', 'max_incrustes_per_guest': 0,
    });
    final eNull = Event.fromJson({
      'id': 'e2', 'name': 'B', 'event_date': '2026-12-24T20:00:00Z', 'location': 'Paris', 'max_incrustes_per_guest': null,
    });
    expect(e0.maxIncrustesPerGuest, 0);
    expect(eNull.maxIncrustesPerGuest, isNull);
  });

  test('ScanResult.fromJson handles invalid payload', () {
    final r = ScanResult.fromJson({'valid': false, 'reason': 'already_scanned'});
    expect(r.valid, isFalse);
    expect(r.reason, 'already_scanned');
  });
}
