import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CatechismRecord extends FirestoreRecord {
  CatechismRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  bool hasAnswer() => _answer != null;

  // "verseReference" field.
  String? _verseReference;
  String get verseReference => _verseReference ?? '';
  bool hasVerseReference() => _verseReference != null;

  // "verse" field.
  String? _verse;
  String get verse => _verse ?? '';
  bool hasVerse() => _verse != null;

  // "questionTitle" field.
  String? _questionTitle;
  String get questionTitle => _questionTitle ?? '';
  bool hasQuestionTitle() => _questionTitle != null;

  // "questionNumber" field.
  int? _questionNumber;
  int get questionNumber => _questionNumber ?? 0;
  bool hasQuestionNumber() => _questionNumber != null;

  // "part1" field.
  bool? _part1;
  bool get part1 => _part1 ?? false;
  bool hasPart1() => _part1 != null;

  // "part2" field.
  bool? _part2;
  bool get part2 => _part2 ?? false;
  bool hasPart2() => _part2 != null;

  // "part3" field.
  bool? _part3;
  bool get part3 => _part3 ?? false;
  bool hasPart3() => _part3 != null;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _answer = snapshotData['answer'] as String?;
    _verseReference = snapshotData['verseReference'] as String?;
    _verse = snapshotData['verse'] as String?;
    _questionTitle = snapshotData['questionTitle'] as String?;
    _questionNumber = castToType<int>(snapshotData['questionNumber']);
    _part1 = snapshotData['part1'] as bool?;
    _part2 = snapshotData['part2'] as bool?;
    _part3 = snapshotData['part3'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Catechism');

  static Stream<CatechismRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CatechismRecord.fromSnapshot(s));

  static Future<CatechismRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CatechismRecord.fromSnapshot(s));

  static CatechismRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CatechismRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CatechismRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CatechismRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CatechismRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CatechismRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCatechismRecordData({
  String? question,
  String? answer,
  String? verseReference,
  String? verse,
  String? questionTitle,
  int? questionNumber,
  bool? part1,
  bool? part2,
  bool? part3,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'answer': answer,
      'verseReference': verseReference,
      'verse': verse,
      'questionTitle': questionTitle,
      'questionNumber': questionNumber,
      'part1': part1,
      'part2': part2,
      'part3': part3,
    }.withoutNulls,
  );

  return firestoreData;
}

class CatechismRecordDocumentEquality implements Equality<CatechismRecord> {
  const CatechismRecordDocumentEquality();

  @override
  bool equals(CatechismRecord? e1, CatechismRecord? e2) {
    return e1?.question == e2?.question &&
        e1?.answer == e2?.answer &&
        e1?.verseReference == e2?.verseReference &&
        e1?.verse == e2?.verse &&
        e1?.questionTitle == e2?.questionTitle &&
        e1?.questionNumber == e2?.questionNumber &&
        e1?.part1 == e2?.part1 &&
        e1?.part2 == e2?.part2 &&
        e1?.part3 == e2?.part3;
  }

  @override
  int hash(CatechismRecord? e) => const ListEquality().hash([
        e?.question,
        e?.answer,
        e?.verseReference,
        e?.verse,
        e?.questionTitle,
        e?.questionNumber,
        e?.part1,
        e?.part2,
        e?.part3
      ]);

  @override
  bool isValidKey(Object? o) => o is CatechismRecord;
}
