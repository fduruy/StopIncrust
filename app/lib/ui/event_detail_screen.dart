import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../api_client.dart';
import '../models.dart';
import 'contacts_picker_screen.dart';

/// Host view of an event: invitations (with QR), add scanner, add guest.
class EventDetailScreen extends StatefulWidget {
  final ApiClient api;
  final Event event;
  const EventDetailScreen({super.key, required this.api, required this.event});

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  List<Invitation> _invitations = [];
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final list = await widget.api.invitationsOfEvent(widget.event.id);
      if (!mounted) return;
      setState(() => _invitations = list);
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = e.toString());
    }
  }

  Future<void> _addGuest() async {
    final phone = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Invite a Guest'),
        content: TextField(controller: phone, keyboardType: TextInputType.phone,
            decoration: const InputDecoration(labelText: 'Guest phone (+336...)')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Invite')),
        ],
      ),
    );
    if (ok != true) return;
    try {
      await widget.api.createInvitation(eventId: widget.event.id, guestPhone: phone.text.trim());
      await _load();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  /// Pick several phone contacts and create one invitation per contact (registered users only).
  Future<void> _pickContacts() async {
    final picked = await Navigator.push<List<PickedContact>>(
      context, MaterialPageRoute(builder: (_) => const ContactsPickerScreen()));
    if (picked == null || picked.isEmpty) return;
    int ok = 0;
    final errors = <String>[];
    for (final c in picked) {
      try {
        await widget.api.createInvitation(eventId: widget.event.id, guestPhone: c.phone);
        ok++;
      } catch (e) {
        errors.add('${c.displayName} (${c.phone}) → $e');
      }
    }
    await _load();
    if (!mounted) return;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('$ok invitation(s) créée(s) sur ${picked.length}'),
        content: errors.isEmpty
            ? null
            : SingleChildScrollView(child: Text(errors.join('\n'), style: const TextStyle(color: Colors.red, fontSize: 12))),
        actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('OK'))],
      ),
    );
  }

  Future<void> _addScanner() async {
    final phone = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Designate a scanner'),
        content: TextField(controller: phone, keyboardType: TextInputType.phone,
            decoration: const InputDecoration(labelText: 'Scanner phone (+336...)')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Add')),
        ],
      ),
    );
    if (ok != true) return;
    try {
      await widget.api.addScanner(eventId: widget.event.id, scannerPhone: phone.text.trim());
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Scanner added')));
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.event.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('${widget.event.location} — ${widget.event.eventDate.substring(0, 16)}'),
          Text('Incrustes per guest: ${widget.event.maxIncrustesPerGuest == null ? 'unlimited' : widget.event.maxIncrustesPerGuest == 0 ? 'forbidden' : widget.event.maxIncrustesPerGuest}'),
          const SizedBox(height: 12),
          Wrap(spacing: 8, children: [
            ElevatedButton.icon(onPressed: _addGuest, icon: const Icon(Icons.person_add), label: const Text('Invite guest')),
            ElevatedButton.icon(onPressed: _pickContacts, icon: const Icon(Icons.contacts), label: const Text('From contacts')),
            OutlinedButton.icon(onPressed: _addScanner, icon: const Icon(Icons.qr_code_scanner), label: const Text('Add scanner')),
          ]),
          const Divider(height: 32),
          if (_error != null) Text(_error!, style: const TextStyle(color: Colors.red)),
          const Text('Invitations', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ..._invitations.map((inv) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(children: [
                    if (inv.qrPayload != null)
                      QrImageView(data: inv.qrPayload!, size: 120)
                    else
                      const SizedBox(width: 120, height: 120, child: Center(child: Text('no QR'))),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Guest: ${inv.id.substring(0, 8)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('status: ${inv.status}'),
                    ])),
                  ]),
                ),
              )),
        ],
      ),
    );
  }
}
