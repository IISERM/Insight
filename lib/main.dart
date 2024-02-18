import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:insight/commons/models/register_adapters.dart';
import 'package:insight/config/routes/router_config.dart';
import 'themes/catppuccin.dart';
import 'config/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await hiveSetup();
  runApp(const ProviderScope(child: Insight()));
}

final firebaseInitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
});

final _router = AppRouter();

class Insight extends ConsumerWidget {
  const Insight({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<FirebaseApp> firebaseInit =
        ref.watch(firebaseInitializerProvider);

    return MaterialApp.router(
      theme: CatppuccinTheme(Flavors.mocha, AccentColor.teal),
      debugShowCheckedModeBanner: true,
      routerConfig: _router.config(),
    );
  }
}

Future<void> hiveSetup() async {
  await Hive.initFlutter();
  registerTypeAdapters();
}
