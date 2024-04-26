/// ***
/// This class consists of the DateWidget that is used in the ListView.builder
///
/// Author: Vivek Kaushik <me@vivekkasuhik.com>
/// github: https://github.com/iamvivekkaushik/
/// ***

import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GregorianDateWidget extends StatelessWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final DateSelectionCallback? onDateSelected;
  final String? locale;

  const GregorianDateWidget({
    super.key,
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    this.width,
    this.onDateSelected,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Container(
        width: width,
        margin: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: selectionColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FittedBox(
                child:
                    Text(DateFormat("MMM", locale).format(date).toUpperCase(),
                        // Month
                        style: monthTextStyle),
              ),
              FittedBox(
                child: Text(date.day.toString(), // Date
                    style: dateTextStyle),
              ),
              FittedBox(
                child: Text(DateFormat("E", locale).format(date).toUpperCase(),
                    // WeekDay
                    style: dayTextStyle),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        onDateSelected?.call(date);
      },
    );
  }
}
