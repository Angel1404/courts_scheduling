import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/data.dart';
import '../ui.dart';
import 'utils.dart';

Future<SearchResult?> onSelectDateTime(BuildContext context) async {
  DateTime? date;

  if (Platform.isAndroid) {
    date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
  }
  if (Platform.isIOS) {
    date = await AppPickers.suggestedDateAndTime(context, mode: CupertinoDatePickerMode.date, title: "Selecciona la fecha");
  }

  if (date != null) {
    // if (Platform.isAndroid) {
    //   time = await showTimePicker(
    //     context: context,
    //     initialTime: TimeOfDay.now(),
    //   );
    // }
    // if (Platform.isIOS) {
    //   timeIos = await AppPickers.suggestedDateAndTime(context);
    // }
    // final timeFinal = Platform.isAndroid
    //     ? DateTime(date.year, date.month, date.day, time != null ? time.hour : 0, time != null ? time.minute : 0)
    //     : DateTime(date.year, date.month, date.day, timeIos != null ? timeIos.hour : 0, timeIos != null ? timeIos.minute : 0);
    final dateString = formatDate(date, format: "yMMMMd");
    // final timeString = formatDate(date, format: "HH:mm aa");
    // final dateTimeString = "$dateString a las $timeString";
    debugPrint(dateString);
    return SearchResult(value: dateString, value1: date.toString(), value2: "");
  }
  return null;
}
