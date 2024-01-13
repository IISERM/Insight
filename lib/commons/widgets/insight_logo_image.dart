import 'package:flutter/material.dart';

class InsightLogoImage extends Image {
  const InsightLogoImage({super.key})
      : super(
          image: const NetworkImage(
              "https://static.vecteezy.com/system/resources/previews/016/833/872/original/github-logo-git-hub-icon-on-white-background-free-vector.jpg"
          ),
    height: 50,
    width: 50
        );
}