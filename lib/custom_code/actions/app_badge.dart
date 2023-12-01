// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_app_badger/flutter_app_badger.dart';

Future<int?> appBadge(int? notificationCount) async {
  // changes notification badge to the launch icon to match given number
  if (notificationCount != null && notificationCount > 0) {
    await FlutterAppBadger.updateBadgeCount(notificationCount);
    return notificationCount;
  } else {
    await FlutterAppBadger.removeBadge();
    return notificationCount;
  }
}
