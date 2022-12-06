import 'package:flutter/material.dart';

const kCardMargin = 8.0;
const kFixedButtonPadding =
EdgeInsets.only(left: 10.0, right: 10.0, bottom: 15.0);
const kTitleStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 25.0,
);
Color greyColor = Colors.black.withOpacity(0.6);
const kHeadingStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);
const kEnabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  borderSide: const BorderSide(
    color: Colors.grey,
  ),
);
const kFocusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  borderSide: BorderSide(color: Colors.blue),
);
const kErrorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  borderSide: BorderSide(color: Colors.red),
);
const kInputSpacing = 16.0;

