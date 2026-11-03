import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../api_client.dart';
import '../models.dart';
import 'event_detail_screen.dart';
import 'guest_invitation_screen.dart';
import 'scanner_screen.dart';

class HomeScreen extends StatefulWidget {
  final ApiClient api;
  const HomeScreen({super.key, required this.api});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Event> _events = [];
  List<Invitation> _invitations = [];
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final events = await widget.api.myHostedEvents();
      final invitations = await widget.api.myInvitations();
      setState(() { _events = events; _invitations = invitations; });
    } catch (e) {
      setState(() => _error = e.toString());
    }
  }

  Future<void> _createEvent() async {
    final name = TextEditingController();
    final location = TextEditingController();
    final maxTxt = TextEditingController(text: '0');
    DateTime date = DateTime.now().add(const Duration(days: 7));

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(builder: (ctx, setDlg) {
        return AlertDialog(
          title: const Text('New event (Host)'),
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            TextField(controller: name, decoration: const InputDecoration(labelText: 'Name')),
            TextField(controller: location, decoration: const InputDecoration(labelText: 'Location')),
            TextField(controller: maxTxt, keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Max incruste/guest (0 = none, empty = unlimited)')),
            const SizedBox(height: 8),
            Text('Date: ${DateFormat.yMd().add_Hm().format(date)}'),
            TextButton(onPressed: () async {
              final picked = await showDatePicker(context: ctx, firstDate: DateTime.now(),
                  initialDate: date, lastDate: DateTime.now().add(const Duration(days: 730)));
              if (picked != null) setDlg(() => date = picked);
            }, child: const Text('Change date')),
          ]),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
            ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Create')),
          ],
        );
      }),
    );
    if (ok != true) return;
    try {
      final max = maxTxt.text.trim().isEmpty ? null : int.tryParse(maxTxt.text.trim());
      await widget.api.createEvent(name: name.text.trim(), date: date, location: location.text.trim(),
          maxIncrustesPerGuest: max);
      await _load();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StopIncrust'),
        actions: [
          IconButton(icon: const Icon(Icons.qr_code_scanner),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ScannerScreen(api: widget.api)))),
          IconButton(icon: const Icon(Icons.logout),
              onPressed: () => Supabase.instance.client.auth.signOut()),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _load,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (_error != null) Text(_error!, style: const TextStyle(color: Colors.red)),
            ElevatedButton.icon(onPressed: _createEvent, icon: const Icon(Icons.add), label: const Text('New event (Host)')),
            const SizedBox(height: 16),
            const Text('My events (as Host)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ..._events.map((e) => ListTile(
                  title: Text(e.name),
                  subtitle: Text('${e.location} — ${e.eventDate.substring(0, 10)}\n'
                      'Incrustes: ${e.maxIncrustesPerGuest == null ? 'unlimited' : e.maxIncrustesPerGuest == 0 ? 'forbidden' : e.maxIncrustesPerGuest}'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => EventDetailScreen(api: widget.api, event: e))),
                )),
            const SizedBox(height: 16),
            const Text('My invitations (as Guest)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ..._invitations.map((i) => ListTile(
                  title: Text('Invitation ${i.id.substring(0, 8)}'),
                  subtitle: Text('status: ${i.status}'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => GuestInvitationScreen(api: widget.api, invitation: i))),
                )),
          ],
        ),
      ),
    );
  }
}
