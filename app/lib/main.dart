import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'api_client.dart';
import 'config.dart';
import 'ui/login_screen.dart';
import 'ui/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: SupabaseConfig.url, publishableKey: SupabaseConfig.anonKey);
  runApp(const StopIncrustApp());
}

class StopIncrustApp extends StatelessWidget {
  const StopIncrustApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StopIncrust',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.deepPurple, useMaterial3: true),
      home: StreamBuilder<AuthState>(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot) {
          final api = ApiClient(Supabase.instance.client);
          final session = Supabase.instance.client.auth.currentSession;
          if (session != null) return HomeScreen(api: api);
          return LoginScreen(api: api);
        },
      ),
    );
  }
}
