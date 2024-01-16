import 'package:flutter/material.dart';

class LoadingDialogue extends AlertDialog {
  final Widget? header;
  final Image? catLoading;
  final Widget? footer;

const LoadingDialogue({super.key, this.header, this.catLoading, this.footer});

    @override
    Widget build(BuildContext context) {
      return AlertDialog(
        title: const Text("Loading..."),
        content: Column(
          children: [
            header ?? const Text("Please wait :D"),
            catLoading ?? const CircularProgressIndicator(),
            footer ?? Container(),
      ],
        ),
      );
    }
}