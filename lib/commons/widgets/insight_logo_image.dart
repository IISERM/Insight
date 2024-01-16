import 'package:flutter/material.dart';

class InsightLogoImage extends Image {
  @override
  final double? width;
  @override
  final double? height;
  InsightLogoImage({super.key, this.width, this.height})
      : super(
          image: Image.network(
                  "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-i-s-e-r-m-test-app-gct9v1/assets/e2pqw840b3he/image_2023-07-12_061206504.png")
              .image,
          width: width ?? 100.0,
          height: height ?? 100.0,
        );
}
