import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../api_client.dart';
import '../models.dart';

/// Guest view of one invitation: own QR + incruste tickets (if allowed by Host).
class GuestInvitationScreen extends StatefulWidget {
  final ApiClient api;
  final Invitation invitation;
  const GuestInvitationScreen({super.key, required this.api, required this.invitation});

  @override
  State<GuestInvitationScreen> createState() => _GuestInvitationScreenState();
}

class _GuestInvitationScreenState extends State<GuestInvitationScreen> {
  List<IncrusteTicket> _tickets = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final list = await widget.api.incrusteTicketsOfInvitation(widget.invitation.id);
      if (!mounted) return;
      setState(() => _tickets = list);
    } catch (_) {}
  }

  Future<void> _issueIncruste() async {
    final first = TextEditingController();
    final last = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('New incruste ticket'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(controller: first, decoration: const InputDecoration(labelText: 'First name')),
          TextField(controller: last, decoration: const InputDecoration(labelText: 'Last name')),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Issue')),
        ],
      ),
    );
    if (ok != true) return;
    try {
      await widget.api.issueIncruste(
          invitationId: widget.invitation.id, firstName: first.text.trim(), lastName: last.text.trim());
      await _load();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    final inv = widget.invitation;
    return Scaffold(
      appBar: AppBar(title: const Text('My invitation')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Your invitation QR', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          if (inv.qrPayload != null)
            Center(child: QrImageView(data: inv.qrPayload!, size: 220))
          else
            const Text('No QR yet'),
          Text('status: ${inv.status}'),
          const Divider(height: 32),
          Row(children: [
            const Expanded(child: Text('Incruste tickets', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            ElevatedButton.icon(onPressed: _issueIncruste, icon: const Icon(Icons.add), label: const Text('Issue')),
          ]),
          ..._tickets.map((t) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(children: [
                    if (t.qrPayload != null) QrImageView(data: t.qrPayload!, size: 100),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('${t.guestFirstName} ${t.guestName}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('status: ${t.status} — cannot invite further'),
                    ])),
                  ]),
                ),
              )),
        ],
      ),
    );
  }
}
