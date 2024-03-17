import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:insight/features/auth/providers/auth_provider.dart';

class InstituteLoginButton extends ConsumerWidget {
  const InstituteLoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authenticationProvider);
    return TextButton(
        onPressed: () => auth.signInWithGoogle(context),
        style: loginButtonStyle,
        child: const Text("Institute Login", style: loginButtonTextStyle));
}

}
const TextStyle loginButtonTextStyle = TextStyle(color: Colors.white);
 ButtonStyle loginButtonStyle = ButtonStyle(alignment: Alignment.center,
  backgroundColor: MaterialStateProperty.all(Colors.cyan),
  shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side:  const BorderSide(color: Colors.transparent, width:2.0)
      )
  ),
 );
