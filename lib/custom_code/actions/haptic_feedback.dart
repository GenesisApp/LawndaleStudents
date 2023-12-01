// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';

Future hapticFeedback(int? type) async {
  // Add your function code here!
  if (type == 0) {
    HapticFeedback.lightImpact();
  } else if (type == 1) {
    HapticFeedback.mediumImpact();
  } else if (type == 2) {
    HapticFeedback.heavyImpact();
  } else if (type == 3) {
    HapticFeedback.selectionClick();
  }
}
