import 'dart:ui';

import 'package:flutter/services.dart';

import 'common/common_libs.dart';

void tryCatch({
  required VoidCallback methodToExecute,
  required String errorMessage,
}) {
  try {
    methodToExecute.call();
  } catch (error) {
    PrintManager.print(error, color: ConsoleColor.redBg);
  }
}

Future<Uint8List> getImageFromRawData(
    {required String imgPath, double? width, double? height}) async {
  ByteData imageByteData = await rootBundle.load(imgPath);

  Uint8List imageList = imageByteData.buffer.asUint8List();
  Codec imageCodec = await instantiateImageCodec(
    imageList,
    targetWidth: width?.round(),
    targetHeight: height?.round(),
  );

  FrameInfo imageFrameInfo = await imageCodec.getNextFrame();

  ByteData? finalImageByteData =
      await imageFrameInfo.image.toByteData(format: ImageByteFormat.png);
  Uint8List finalImageList = finalImageByteData!.buffer.asUint8List();

  return finalImageList;
}
