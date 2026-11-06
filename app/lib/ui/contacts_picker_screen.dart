import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

/// Multi-select contact picker. Returns the normalized (E.164-ish) phone numbers.
class ContactsPickerScreen extends StatefulWidget {
  const ContactsPickerScreen({super.key});

  @override
  State<ContactsPickerScreen> createState() => _ContactsPickerScreenState();

  /// Normalize a raw phone number to E.164-ish format (French default for local numbers).
  static String? normalizePhone(String raw) {
    var n = raw.replaceAll(RegExp(r'[^\d+]'), '');
    if (n.startsWith('00')) n = '+${n.substring(2)}';
    if (n.startsWith('+')) return n.length > 4 ? n : null;
    if (n.startsWith('0')) return '+33${n.substring(1)}'; // France par défaut
    if (n.startsWith('33')) return '+$n';
    return n.length >= 8 ? n : null;
  }
}

class _ContactsPickerScreenState extends State<ContactsPickerScreen> {
  List<Contact> _contacts = [];
  final Set<String> _selectedPhones = {};
  bool _loading = true;
  String? _error;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      if (!await FlutterContacts.requestPermission()) {
        if (mounted) setState(() { _error = 'Permission contacts refusée'; _loading = false; });
        return;
      }
      final contacts = await FlutterContacts.getContacts(withProperties: true, withPhoto: false);
      final withPhone = contacts
          .where((c) => c.phones.isNotEmpty && ContactsPickerScreen.normalizePhone(c.phones.first.number) != null)
          .toList()
        ..sort((a, b) => a.displayName.compareTo(b.displayName));
      if (mounted) setState(() { _contacts = withPhone; _loading = false; });
    } catch (e) {
      if (mounted) setState(() { _error = e.toString(); _loading = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _query.isEmpty
        ? _contacts
        : _contacts.where((c) => c.displayName.toLowerCase().contains(_query.toLowerCase())).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choisir des contacts'),
        actions: [
          TextButton(
            onPressed: _selectedPhones.isEmpty
                ? null
                : () => Navigator.pop(context, _selectedPhones.toList()),
            child: Text('Inviter ${_selectedPhones.length}'),
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!, style: const TextStyle(color: Colors.red)))
              : Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      decoration: const InputDecoration(labelText: 'Rechercher', isDense: true),
                      onChanged: (v) => setState(() => _query = v),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filtered.length,
                      itemBuilder: (ctx, i) {
                        final c = filtered[i];
                        final phone = ContactsPickerScreen.normalizePhone(c.phones.first.number)!;
                        final checked = _selectedPhones.contains(phone);
                        return CheckboxListTile(
                          value: checked,
                          title: Text(c.displayName),
                          subtitle: Text(phone),
                          onChanged: (v) => setState(() {
                            if (v == true) { _selectedPhones.add(phone); } else { _selectedPhones.remove(phone); }
                          }),
                        );
                      },
                    ),
                  ),
                ]),
    );
  }
}
