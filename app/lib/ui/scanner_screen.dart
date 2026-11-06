import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../api_client.dart';
import '../models.dart';

/// Scanner mode for Host / designated Guest scanners on event day.
class ScannerScreen extends StatefulWidget {
  final ApiClient api;
  const ScannerScreen({super.key, required this.api});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  bool _handling = false;
  final _manualController = TextEditingController();

  Future<void> _validate(String qr) async {
    if (_handling || qr.trim().isEmpty) return;
    setState(() => _handling = true);
    try {
      final ScanResult result = await widget.api.validateScan(qr.trim());
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(result.valid ? 'VALID' : 'INVALID', style: TextStyle(color: result.valid ? Colors.green : Colors.red)),
          content: Text(result.valid
              ? 'Type: ${result.type}\n${result.guestFirstName ?? ''} ${result.guestLastName ?? ''}'
              : 'Reason: ${result.reason}'),
          actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('OK'))],
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    } finally {
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) setState(() => _handling = false);
    }
  }

  Future<void> _onDetect(BarcodeCapture capture) async {
    final qr = capture.barcodes.firstOrNull?.rawValue;
    if (qr == null) return;
    await _validate(qr);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan invitations')),
      body: Column(children: [
        Expanded(child: MobileScanner(onDetect: _onDetect)),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(children: [
            Expanded(
              child: TextField(
                controller: _manualController,
                decoration: const InputDecoration(labelText: '…or paste QR payload', isDense: true),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(onPressed: () => _validate(_manualController.text), child: const Text('Check')),
          ]),
        ),
      ]),
    );
  }
}
