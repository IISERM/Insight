import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:insight/features/auth/interface/login_page.dart';
import 'package:insight/features/homepage/interface/home_page.dart';
import 'package:insight/commons/widgets/error_handlers.dart';
import 'package:insight/commons/widgets/loading_handlers.dart';
import 'package:insight/features/auth/providers/auth_provider.dart';

import '../../../../commons/models/custom_errors.dart';

@RoutePage(name: "AuthCheckerRoute")
class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return authState.when(
      data: (data) => data == null ? const LoginPage() : const HomePage(),
      loading: () => const LoadingDialogue(),
      error: (e, stackTrace) =>
          ErrorDialogue(RiverpodError(e, stackTrace: stackTrace)),
      //TODO: Find out why I have to use Custom Error instead of error from dart:core
    );
  }
}
