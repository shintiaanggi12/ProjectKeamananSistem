import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kBackgorund = Color(0xFFD8F8E4);
const kRed = Color(0xFFEC0000);
const kCreame = Color(0xFFF7E9DE);
const kBlue = Color(0xFF58D5DB);
const kText = Color(0xFF476C75);

final myText = const TextStyle(
  fontSize: 15,
  color: kText,
);
final myBoldText =
    const TextStyle(color: kText, fontSize: 22, fontWeight: FontWeight.bold);

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: kBackgorund,
    inputDecorationTheme: inputDecorationTheme(),
    timePickerTheme: TimePickerThemeData(
      hourMinuteColor: kBlue,
      dayPeriodTextColor: kBlue,
      hourMinuteTextColor: kText,
      dialTextColor: kText,
      dialHandColor: kBlue,
      entryModeIconColor: kText,
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: kBackgorund),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    focusColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}
