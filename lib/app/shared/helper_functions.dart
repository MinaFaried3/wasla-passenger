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

String formatDateTimeForServer(DateTime dateTime) {
  final DateFormat formatter = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'");
  PrintManager.print(formatter.format(dateTime.toUtc()));
  return formatter.format(dateTime.toUtc());
}

String formatDateTimeForUx(DateTime? dateTime) {
  if (dateTime == null) return '';
  final DateFormat dateFormatter = DateFormat.yMMMMd().add_jm();

  return dateFormatter.format(dateTime);
}

String formatDate(String dateTimeString) {
  // Parse the input date time string
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Define the date format
  DateFormat formatter = DateFormat.yMMMMd().add_jm();

  // Format the date time
  String formattedDate = formatter.format(dateTime);

  return formattedDate;
}

String getFormattedDateFromString(String dateTimeString) {
  // Parse the input date time string
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Define the date format (e.g., 'Nov 12, Wednesday')
  DateFormat dateFormatter = DateFormat('MMM d, EEEE');

  // Format the date
  String formattedDate = dateFormatter.format(dateTime);

  return formattedDate;
}

String getFormattedTimeFromString(String dateTimeString) {
  // Parse the input date time string
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Define the time format (e.g., '10:00 am')
  DateFormat timeFormatter = DateFormat.jm();

  // Format the time
  String formattedTime = timeFormatter.format(dateTime);

  return formattedTime;
}

String formatBirthdateForUi(String birthdate) {
  final date = DateTime.parse(birthdate);
  return DateFormat('dd, MMM yyyy').format(date);
}

String timeAgo(String datetimeString) {
  // Parse the datetime string to a DateTime object
  DateTime past = DateTime.parse(datetimeString);
  DateTime now = DateTime.now();

  Duration difference = now.difference(past);

  if (difference.inSeconds < 60) {
    return 'Just now';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
  } else if (difference.inDays < 30) {
    return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
  } else if (difference.inDays < 365) {
    int months = (difference.inDays / 30).floor();
    return '$months month${months > 1 ? 's' : ''} ago';
  } else {
    int years = (difference.inDays / 365).floor();
    return '$years year${years > 1 ? 's' : ''} ago';
  }
}
