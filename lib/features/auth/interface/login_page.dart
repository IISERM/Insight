import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:insight/commons/widgets/insight_logo_image.dart';
import 'package:insight/features/auth/interface/widgets/guest_login_button.dart';
import 'package:insight/features/auth/interface/widgets/institute_login_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool _isLoading = false;

  @override
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
          child: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: loginPageContainerDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InsightLogoImage(width: 200, height: 200),
              const SizedBox(height: 13.0),
              InstituteLoginButton(),
              const SizedBox(height: 13.0),
              GuestLoginButton(),
            ],
          ),
        ),
      )),
    );
  }

  BoxDecoration loginPageContainerDecoration = BoxDecoration(
      image: DecorationImage(
    image: Image.network(
            "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-i-s-e-r-m-test-app-gct9v1/assets/n5vs1zgakg2k/image_2023-07-12_061133339.png")
        .image,
    fit: BoxFit.cover,
  ));
}
// In flutter, the container takes up only the size of the biggest object inside it. You have to set the main container in the scafoold to occupy 100% of height and width manually
