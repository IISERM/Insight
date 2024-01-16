import 'package:flutter/material.dart';

class GuestLoginButton extends TextButton {

   GuestLoginButton({Key? key})
      : super(
          style: guestLoginButtonStyle,
          child: const Text("Guest Login", style: guestLoginButtonTextStyle),
          onPressed: null
        );

}

  ButtonStyle guestLoginButtonStyle = ButtonStyle(
  alignment: Alignment.center,
  backgroundColor: MaterialStateProperty.all(Colors.transparent),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
side:  const BorderSide(color: Colors.white, width:2.0)
      )
    ),
);

const TextStyle guestLoginButtonTextStyle = TextStyle(color: Colors.white);
