import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:insight/features/auth/models/auth_model.dart';
import 'package:insight/features/auth/providers/auth_provider.dart';


class InstituteLoginButton extends ConsumerWidget {
  const InstituteLoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authenticationProvider);
    return TextButton(
        onPressed: () => auth.signInWithGoogle(context),
        style: loginButtonStyle,
        child: const Text("Institute Login", style: loginButtonTextStyle),
  );
}
  Future<void> _googleSignIn(Authentication auth, BuildContext context) async {
    await auth.signInWithGoogle(context);
  }

}
const TextStyle loginButtonTextStyle = TextStyle();
const ButtonStyle loginButtonStyle = ButtonStyle();
