// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

Future<String?> scanMessageForLink(String? messageText) async {
  // Scan a text widget for a URL link and output the link string if one is a valid URL
  if (messageText == null) {
    return null;
  }

  // Regular expression to match URLs
  RegExp urlRegex =
      RegExp(r"(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+");

  // Find the first match in the message text
  Match? match = urlRegex.firstMatch(messageText);

  if (match != null) {
    // Get the matched URL string
    String matchedUrl = messageText.substring(match.start, match.end);

    // Check if the matched URL is a valid URL
    if (await canLaunch(matchedUrl)) {
      return matchedUrl;
    }
  }

  // No valid URL found in the message text
  return null;
}
