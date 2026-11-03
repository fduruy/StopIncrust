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

  Future<void> _onDetect(BarcodeCapture capture) async {
    if (_handling) return;
    final qr = capture.barcodes.firstOrNull?.rawValue;
    if (qr == null || qr.isEmpty) return;
    setState(() => _handling = true);
    try {
      final ScanResult result = await widget.api.validateScan(qr);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan invitations')),
      body: MobileScanner(onDetect: _onDetect),
    );
  }
}
