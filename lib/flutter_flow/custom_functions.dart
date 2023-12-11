import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

int? showMinutes(int? timeinMin) {
  // a function that takes miliseconds and converts it to minutes
  if (timeinMin != null) {
    return timeinMin ~/ 60000;
  }
  return null;
}

DateTime? getDayDate() {
  // get ymmd format of the current date
  var now = DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');
  String formatted = formatter.format(now);
  return DateTime.parse(formatted);
}

DateTime? getMonthDate() {
  // get yMMMM format of the current date
// get yMMMM format of the current date
  var now = DateTime.now();
  var formatter = new DateFormat('yMMMM');
  String formatted = formatter.format(now);
  return DateTime.parse(formatted);
}

bool? checkTodayDate(DateTime? datetoCheck) {
  //  check a date in the YMMMD format to see if it is todays date.
  if (datetoCheck == null) {
    return null;
  }
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final formatter = DateFormat.yMMMd();
  final date = formatter.format(datetoCheck);
  final todayDate = formatter.format(today);
  return date == todayDate;
}

int? percentagefromListCopy(
  List<int>? ratingNumber,
  List<DocumentReference>? grouplRef,
  List<GroupRatingsRecord>? groupDoc,
) {
  // get the sum of a list of numbers where the highest number is 5
  if (ratingNumber == null || ratingNumber.isEmpty) {
    return null;
  }

  final maxRating = 5;
  final sum = ratingNumber.reduce((a, b) => math.min(b, maxRating) + a);

  return ((sum / (maxRating * ratingNumber.length)) * 100).round();
}

int? percentagefromList(
  List<int>? ratingNumber,
  List<DocumentReference>? globalRef,
  List<GlobalGroupRatingsRecord>? globalDoc,
) {
  // get the sum of a list of numbers where the highest number is 5
  if (ratingNumber == null || globalRef == null || globalDoc == null) {
    return null;
  }

  int sum = 0;
  int count = 0;

  for (int i = 0; i < ratingNumber.length; i++) {
    if (ratingNumber[i] <= 5) {
      sum += ratingNumber[i];
      count++;
    }
  }

  if (count == 0) {
    return null;
  }

  double average = sum / count;
  return (average / 5 * 100).round();
}

int? avgMembers(List<int>? numberofMembers) {
  // get the sum of given numbers
  if (numberofMembers == null || numberofMembers.isEmpty) {
    return null;
  }
  int sum = 0;
  for (int num in numberofMembers) {
    sum += num;
  }
  return sum ~/ numberofMembers.length;
}

bool? ageCheck(
  DateTime? datetoCheck,
  DocumentReference? personwithDate,
) {
  // checks a birthday in the xx/xx/xxxx format to see if the user is 13 years or younger
  if (datetoCheck == null || personwithDate == null) {
    return null;
  }

  final now = DateTime.now();
  final age = now.year - datetoCheck.year;

  if (age < 13) {
    return true;
  } else if (age == 13) {
    if (now.month < datetoCheck.month) {
      return true;
    } else if (now.month == datetoCheck.month) {
      if (now.day < datetoCheck.day) {
        return true;
      }
    }
  }

  return false;
}

bool? checkYesterdayDate(DateTime? datetoCheck) {
  // check a date in the YMMMD format to see if it was yesterdays date.
  if (datetoCheck == null) {
    return null;
  }
  final now = DateTime.now();
  final yesterday = now.subtract(Duration(days: 1));
  final formatter = DateFormat.yMMMd();
  final formattedDate = formatter.format(datetoCheck);
  final formattedYesterday = formatter.format(yesterday);
  return formattedDate == formattedYesterday;
}

DateTime? getYesterdayDate() {
  // get yesterday's date in the YMMMD format
  final yesterday = DateTime.now().subtract(Duration(days: 1));
  final formatter = DateFormat.yMMMd();
  final formattedDate = formatter.format(yesterday);
  return DateTime.parse(formattedDate);
}

String? checkVersionString() {
  // check the current version of the app
  String version = '1.0.0';
  return 'Current version: $version';
}

double? returnDistanceBetweenTwoPoints(
  LatLng? positionOne,
  LatLng? positionTwo,
) {
  // calculate the distance between two points on a spheroid and return distance as double
  var p = 0.017453292519943295;
  var a = 0.5 -
      math.cos((positionTwo!.latitude - positionOne!.latitude) * p) / 2 +
      math.cos(positionOne.latitude * p) *
          math.cos(positionTwo.latitude * p) *
          (1 - math.cos((positionTwo.longitude - positionOne.longitude) * p)) /
          2;
  double result = 12742 * math.asin(math.sqrt(a));
  // uncomment the line below if you want the result to be rounded
  // double finalResult = result.roundToDouble();
  // if you uncommented the line above, you have to replace result in the line below with finalResult
  return result;
}

DateTime? dateFromThirtyDaysAgo() {
  // get the ymmd of the day that is 30 days ago from the current global time
  final now = DateTime.now().toUtc();
  final thirtyDaysAgo = now.subtract(Duration(days: 30));
  final ymmd =
      DateTime(thirtyDaysAgo.year, thirtyDaysAgo.month, thirtyDaysAgo.day);
  return ymmd;
}

int? sumOfNumbers(List<int>? numberGiven) {
  // get the total sum from a list of numbers
  if (numberGiven == null || numberGiven.isEmpty) {
    return null;
  }
  int sum = 0;
  for (int number in numberGiven) {
    sum += number;
  }
  return sum;
}

String? checkIfMorning() {
  // check to see if the current time is morning, midday, afternoon, evening, or nighttime.
  final now = DateTime.now();
  if (now.hour >= 5 && now.hour < 10) {
    return 'morning';
  } else if (now.hour >= 10 && now.hour < 14) {
    return 'midday';
  } else if (now.hour >= 14 && now.hour < 16) {
    return 'afternoon';
  } else if (now.hour >= 16 && now.hour < 20) {
    return 'evening';
  } else {
    return 'nighttime';
  }
}
