// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool?> scanLanguage(String? textfieldText) async {
  // scan textfield to see if there are inappropriate language in the string data of the textfield
// Define a list of inappropriate words or phrases
  List<String> inappropriateWords = [
    "fuck",
    "shit",
    "dick",
    "vagina",
    "nigger",
    "nigga",
    "gay",
    "cock",
    "orgasm",
    "cunt",
    "fucker",
    "faggot",
    "bitch",
    "damn",
    "dammit",
    "damnit",
    "pussy",
    "penis",
    "ass",
    "sex",
    "anal",
    "bastard",
    "blowjob",
    "boob",
    "boobies",
    "tits",
    "titties",
    "breast",
    "butt",
    "cum",
    "drugs",
    "drug",
    "goddammit",
    "goddamit",
    "whore",
    "hoe",
    "slut",
    "horny",
  ];

  // Split the textfield text into individual words
  List<String> words = textfieldText!.split(" ");

  // Check if any of the words in the textfield match the inappropriate words list
  for (String word in words) {
    if (inappropriateWords.contains(word.toLowerCase())) {
      return true;
    }
  }

  // If no inappropriate words are found, return false
  return false;
}
