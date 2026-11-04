import 'package:flutter/material.dart';
import '../api_client.dart';

class LoginScreen extends StatefulWidget {
  final ApiClient api;
  const LoginScreen({super.key, required this.api});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phone = TextEditingController();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _code = TextEditingController();
  bool _otpSent = false;
  bool _busy = false;
  String? _error;

  Future<void> _sendOtp() async {
    setState(() { _busy = true; _error = null; });
    try {
      await widget.api.sendOtp(_phone.text.trim());
      if (widget.api.hasSession) {
        // Local dev with sms autoconfirm: session returned immediately.
        await widget.api.ensureProfile(
          phone: _phone.text.trim(),
          firstName: _firstName.text.trim(),
          lastName: _lastName.text.trim(),
        );
      } else {
        setState(() => _otpSent = true);
      }
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      setState(() => _busy = false);
    }
  }

  Future<void> _verify() async {
    setState(() { _busy = true; _error = null; });
    try {
      await widget.api.verifyOtp(_phone.text.trim(), _code.text.trim());
      await widget.api.ensureProfile(
        phone: _phone.text.trim(),
        firstName: _firstName.text.trim(),
        lastName: _lastName.text.trim(),
      );
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('StopIncrust', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            TextField(controller: _phone, keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Phone (+336...)')),
            TextField(controller: _firstName, decoration: const InputDecoration(labelText: 'First name')),
            TextField(controller: _lastName, decoration: const InputDecoration(labelText: 'Last name')),
            const SizedBox(height: 16),
            if (_otpSent)
              TextField(controller: _code, keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'SMS code')),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _busy ? null : (_otpSent ? _verify : _sendOtp),
              child: Text(_otpSent ? 'Verify code' : 'Send OTP'),
            ),
            if (_error != null) ...[
              const SizedBox(height: 12),
              Text(_error!, style: const TextStyle(color: Colors.red)),
            ],
          ],
        ),
      ),
    );
  }
}
