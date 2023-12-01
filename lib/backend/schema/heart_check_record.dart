import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HeartCheckRecord extends FirestoreRecord {
  HeartCheckRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Q1" field.
  String? _q1;
  String get q1 => _q1 ?? '';
  bool hasQ1() => _q1 != null;

  // "Q2" field.
  String? _q2;
  String get q2 => _q2 ?? '';
  bool hasQ2() => _q2 != null;

  // "Q3" field.
  String? _q3;
  String get q3 => _q3 ?? '';
  bool hasQ3() => _q3 != null;

  // "Q4" field.
  String? _q4;
  String get q4 => _q4 ?? '';
  bool hasQ4() => _q4 != null;

  // "Q5" field.
  String? _q5;
  String get q5 => _q5 ?? '';
  bool hasQ5() => _q5 != null;

  // "Q6" field.
  String? _q6;
  String get q6 => _q6 ?? '';
  bool hasQ6() => _q6 != null;

  // "Q7" field.
  String? _q7;
  String get q7 => _q7 ?? '';
  bool hasQ7() => _q7 != null;

  // "Q8" field.
  String? _q8;
  String get q8 => _q8 ?? '';
  bool hasQ8() => _q8 != null;

  // "userSubmittedby" field.
  DocumentReference? _userSubmittedby;
  DocumentReference? get userSubmittedby => _userSubmittedby;
  bool hasUserSubmittedby() => _userSubmittedby != null;

  // "timeSubmitted" field.
  DateTime? _timeSubmitted;
  DateTime? get timeSubmitted => _timeSubmitted;
  bool hasTimeSubmitted() => _timeSubmitted != null;

  // "userSubmittedName" field.
  String? _userSubmittedName;
  String get userSubmittedName => _userSubmittedName ?? '';
  bool hasUserSubmittedName() => _userSubmittedName != null;

  // "time" field.
  double? _time;
  double get time => _time ?? 0.0;
  bool hasTime() => _time != null;

  // "talent" field.
  double? _talent;
  double get talent => _talent ?? 0.0;
  bool hasTalent() => _talent != null;

  // "treasure" field.
  double? _treasure;
  double get treasure => _treasure ?? 0.0;
  bool hasTreasure() => _treasure != null;

  void _initializeFields() {
    _q1 = snapshotData['Q1'] as String?;
    _q2 = snapshotData['Q2'] as String?;
    _q3 = snapshotData['Q3'] as String?;
    _q4 = snapshotData['Q4'] as String?;
    _q5 = snapshotData['Q5'] as String?;
    _q6 = snapshotData['Q6'] as String?;
    _q7 = snapshotData['Q7'] as String?;
    _q8 = snapshotData['Q8'] as String?;
    _userSubmittedby = snapshotData['userSubmittedby'] as DocumentReference?;
    _timeSubmitted = snapshotData['timeSubmitted'] as DateTime?;
    _userSubmittedName = snapshotData['userSubmittedName'] as String?;
    _time = castToType<double>(snapshotData['time']);
    _talent = castToType<double>(snapshotData['talent']);
    _treasure = castToType<double>(snapshotData['treasure']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('heartCheck');

  static Stream<HeartCheckRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HeartCheckRecord.fromSnapshot(s));

  static Future<HeartCheckRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HeartCheckRecord.fromSnapshot(s));

  static HeartCheckRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HeartCheckRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HeartCheckRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HeartCheckRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HeartCheckRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HeartCheckRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHeartCheckRecordData({
  String? q1,
  String? q2,
  String? q3,
  String? q4,
  String? q5,
  String? q6,
  String? q7,
  String? q8,
  DocumentReference? userSubmittedby,
  DateTime? timeSubmitted,
  String? userSubmittedName,
  double? time,
  double? talent,
  double? treasure,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Q1': q1,
      'Q2': q2,
      'Q3': q3,
      'Q4': q4,
      'Q5': q5,
      'Q6': q6,
      'Q7': q7,
      'Q8': q8,
      'userSubmittedby': userSubmittedby,
      'timeSubmitted': timeSubmitted,
      'userSubmittedName': userSubmittedName,
      'time': time,
      'talent': talent,
      'treasure': treasure,
    }.withoutNulls,
  );

  return firestoreData;
}

class HeartCheckRecordDocumentEquality implements Equality<HeartCheckRecord> {
  const HeartCheckRecordDocumentEquality();

  @override
  bool equals(HeartCheckRecord? e1, HeartCheckRecord? e2) {
    return e1?.q1 == e2?.q1 &&
        e1?.q2 == e2?.q2 &&
        e1?.q3 == e2?.q3 &&
        e1?.q4 == e2?.q4 &&
        e1?.q5 == e2?.q5 &&
        e1?.q6 == e2?.q6 &&
        e1?.q7 == e2?.q7 &&
        e1?.q8 == e2?.q8 &&
        e1?.userSubmittedby == e2?.userSubmittedby &&
        e1?.timeSubmitted == e2?.timeSubmitted &&
        e1?.userSubmittedName == e2?.userSubmittedName &&
        e1?.time == e2?.time &&
        e1?.talent == e2?.talent &&
        e1?.treasure == e2?.treasure;
  }

  @override
  int hash(HeartCheckRecord? e) => const ListEquality().hash([
        e?.q1,
        e?.q2,
        e?.q3,
        e?.q4,
        e?.q5,
        e?.q6,
        e?.q7,
        e?.q8,
        e?.userSubmittedby,
        e?.timeSubmitted,
        e?.userSubmittedName,
        e?.time,
        e?.talent,
        e?.treasure
      ]);

  @override
  bool isValidKey(Object? o) => o is HeartCheckRecord;
}
