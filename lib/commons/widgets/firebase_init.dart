import 'package:auto_route/annotations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:insight/config/firebase_options.dart';
import 'package:insight/features/auth/interface/widgets/auth_checker.dart';
import 'package:insight/commons/models/custom_errors.dart';
import 'error_handlers.dart';
import 'loading_handlers.dart';


final firebaseInitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp(
      name: 'Insight', options: DefaultFirebaseOptions.currentPlatform);
});

@RoutePage(name: "FirebaseInitRoute")
class FirebaseInit extends ConsumerWidget {
  const FirebaseInit({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<FirebaseApp> firebaseInit = ref.watch(firebaseInitializerProvider);
    return firebaseInit.when(
      data: (data) => const AuthChecker(),
      loading: () => const LoadingDialogue(),
      error: (e, stackTrace) =>
          ErrorDialogue(RiverpodError(e, stackTrace: stackTrace)),
    );
  }
}