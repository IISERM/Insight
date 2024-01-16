import 'package:flutter/material.dart';

class InstituteLoginButton extends TextButton {

   InstituteLoginButton({super.key})
      : super(
          child: const Text("Institute Login", style: loginButtonTextStyle),
          style: loginButtonStyle,
          onPressed: null,
  );

}
const TextStyle loginButtonTextStyle = TextStyle(color: Colors.white);
 ButtonStyle loginButtonStyle = ButtonStyle(alignment: Alignment.center,
  backgroundColor: MaterialStateProperty.all(Colors.cyan),
  shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side:  const BorderSide(color: Colors.white, width:2.0)
      )
  ),
 );