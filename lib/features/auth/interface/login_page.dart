import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:insight/commons/widgets/insight_logo_image.dart';
import 'package:insight/commons/widgets/loading_handlers.dart';
import 'package:insight/features/auth/interface/widgets/guest_login_button.dart';
import 'package:insight/features/auth/interface/widgets/institute_login_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool _isLoading = false;

  void initState() {
    super.initState();
  }

  void _switchLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        decoration: loginPageContainerDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InsightLogoImage(),
            InstituteLoginButton(),
            GuestLoginButton(),
          ],
        ),
      )),
    );
  }

  BoxDecoration loginPageContainerDecoration = BoxDecoration(
      image: DecorationImage(
          image: NetworkImage(
              "https://png.pngtree.com/png-vector/20190330/ourlarge/pngtree-continuous-line-drawing-of-minimalist-cat-animals-png-image_895421.jpg")));
}
