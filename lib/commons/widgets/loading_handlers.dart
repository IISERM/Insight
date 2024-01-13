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
            testColumn()
          ],
        ),
      );
    }

}

Widget testColumn() {
  return const Column(
    children: [
      Text("Please wait :D"),
      CircularProgressIndicator(),
    ],
  );
}