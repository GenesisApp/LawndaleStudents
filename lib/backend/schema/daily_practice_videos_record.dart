import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DailyPracticeVideosRecord extends FirestoreRecord {
  DailyPracticeVideosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dailyPracticeVideoURL" field.
  String? _dailyPracticeVideoURL;
  String get dailyPracticeVideoURL => _dailyPracticeVideoURL ?? '';
  bool hasDailyPracticeVideoURL() => _dailyPracticeVideoURL != null;

  // "practiceName" field.
  String? _practiceName;
  String get practiceName => _practiceName ?? '';
  bool hasPracticeName() => _practiceName != null;

  // "practiceDescription" field.
  String? _practiceDescription;
  String get practiceDescription => _practiceDescription ?? '';
  bool hasPracticeDescription() => _practiceDescription != null;

  // "worshipPractice" field.
  bool? _worshipPractice;
  bool get worshipPractice => _worshipPractice ?? false;
  bool hasWorshipPractice() => _worshipPractice != null;

  // "scripturePractice" field.
  bool? _scripturePractice;
  bool get scripturePractice => _scripturePractice ?? false;
  bool hasScripturePractice() => _scripturePractice != null;

  // "prayerPractice" field.
  bool? _prayerPractice;
  bool get prayerPractice => _prayerPractice ?? false;
  bool hasPrayerPractice() => _prayerPractice != null;

  // "practiceResponse" field.
  String? _practiceResponse;
  String get practiceResponse => _practiceResponse ?? '';
  bool hasPracticeResponse() => _practiceResponse != null;

  // "practiceLength" field.
  String? _practiceLength;
  String get practiceLength => _practiceLength ?? '';
  bool hasPracticeLength() => _practiceLength != null;

  // "timeToLaunch" field.
  DateTime? _timeToLaunch;
  DateTime? get timeToLaunch => _timeToLaunch;
  bool hasTimeToLaunch() => _timeToLaunch != null;

  // "timeEdited" field.
  DateTime? _timeEdited;
  DateTime? get timeEdited => _timeEdited;
  bool hasTimeEdited() => _timeEdited != null;

  // "pdfResource" field.
  String? _pdfResource;
  String get pdfResource => _pdfResource ?? '';
  bool hasPdfResource() => _pdfResource != null;

  // "scriptureReference" field.
  String? _scriptureReference;
  String get scriptureReference => _scriptureReference ?? '';
  bool hasScriptureReference() => _scriptureReference != null;

  // "scripturePassage" field.
  String? _scripturePassage;
  String get scripturePassage => _scripturePassage ?? '';
  bool hasScripturePassage() => _scripturePassage != null;

  // "personalJournalRef" field.
  List<DocumentReference>? _personalJournalRef;
  List<DocumentReference> get personalJournalRef =>
      _personalJournalRef ?? const [];
  bool hasPersonalJournalRef() => _personalJournalRef != null;

  // "personalJournalCount" field.
  int? _personalJournalCount;
  int get personalJournalCount => _personalJournalCount ?? 0;
  bool hasPersonalJournalCount() => _personalJournalCount != null;

  // "dailyPracticeVideoString" field.
  String? _dailyPracticeVideoString;
  String get dailyPracticeVideoString => _dailyPracticeVideoString ?? '';
  bool hasDailyPracticeVideoString() => _dailyPracticeVideoString != null;

  void _initializeFields() {
    _dailyPracticeVideoURL = snapshotData['dailyPracticeVideoURL'] as String?;
    _practiceName = snapshotData['practiceName'] as String?;
    _practiceDescription = snapshotData['practiceDescription'] as String?;
    _worshipPractice = snapshotData['worshipPractice'] as bool?;
    _scripturePractice = snapshotData['scripturePractice'] as bool?;
    _prayerPractice = snapshotData['prayerPractice'] as bool?;
    _practiceResponse = snapshotData['practiceResponse'] as String?;
    _practiceLength = snapshotData['practiceLength'] as String?;
    _timeToLaunch = snapshotData['timeToLaunch'] as DateTime?;
    _timeEdited = snapshotData['timeEdited'] as DateTime?;
    _pdfResource = snapshotData['pdfResource'] as String?;
    _scriptureReference = snapshotData['scriptureReference'] as String?;
    _scripturePassage = snapshotData['scripturePassage'] as String?;
    _personalJournalRef = getDataList(snapshotData['personalJournalRef']);
    _personalJournalCount =
        castToType<int>(snapshotData['personalJournalCount']);
    _dailyPracticeVideoString =
        snapshotData['dailyPracticeVideoString'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dailyPracticeVideos');

  static Stream<DailyPracticeVideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DailyPracticeVideosRecord.fromSnapshot(s));

  static Future<DailyPracticeVideosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DailyPracticeVideosRecord.fromSnapshot(s));

  static DailyPracticeVideosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DailyPracticeVideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DailyPracticeVideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DailyPracticeVideosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DailyPracticeVideosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DailyPracticeVideosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDailyPracticeVideosRecordData({
  String? dailyPracticeVideoURL,
  String? practiceName,
  String? practiceDescription,
  bool? worshipPractice,
  bool? scripturePractice,
  bool? prayerPractice,
  String? practiceResponse,
  String? practiceLength,
  DateTime? timeToLaunch,
  DateTime? timeEdited,
  String? pdfResource,
  String? scriptureReference,
  String? scripturePassage,
  int? personalJournalCount,
  String? dailyPracticeVideoString,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dailyPracticeVideoURL': dailyPracticeVideoURL,
      'practiceName': practiceName,
      'practiceDescription': practiceDescription,
      'worshipPractice': worshipPractice,
      'scripturePractice': scripturePractice,
      'prayerPractice': prayerPractice,
      'practiceResponse': practiceResponse,
      'practiceLength': practiceLength,
      'timeToLaunch': timeToLaunch,
      'timeEdited': timeEdited,
      'pdfResource': pdfResource,
      'scriptureReference': scriptureReference,
      'scripturePassage': scripturePassage,
      'personalJournalCount': personalJournalCount,
      'dailyPracticeVideoString': dailyPracticeVideoString,
    }.withoutNulls,
  );

  return firestoreData;
}

class DailyPracticeVideosRecordDocumentEquality
    implements Equality<DailyPracticeVideosRecord> {
  const DailyPracticeVideosRecordDocumentEquality();

  @override
  bool equals(DailyPracticeVideosRecord? e1, DailyPracticeVideosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.dailyPracticeVideoURL == e2?.dailyPracticeVideoURL &&
        e1?.practiceName == e2?.practiceName &&
        e1?.practiceDescription == e2?.practiceDescription &&
        e1?.worshipPractice == e2?.worshipPractice &&
        e1?.scripturePractice == e2?.scripturePractice &&
        e1?.prayerPractice == e2?.prayerPractice &&
        e1?.practiceResponse == e2?.practiceResponse &&
        e1?.practiceLength == e2?.practiceLength &&
        e1?.timeToLaunch == e2?.timeToLaunch &&
        e1?.timeEdited == e2?.timeEdited &&
        e1?.pdfResource == e2?.pdfResource &&
        e1?.scriptureReference == e2?.scriptureReference &&
        e1?.scripturePassage == e2?.scripturePassage &&
        listEquality.equals(e1?.personalJournalRef, e2?.personalJournalRef) &&
        e1?.personalJournalCount == e2?.personalJournalCount &&
        e1?.dailyPracticeVideoString == e2?.dailyPracticeVideoString;
  }

  @override
  int hash(DailyPracticeVideosRecord? e) => const ListEquality().hash([
        e?.dailyPracticeVideoURL,
        e?.practiceName,
        e?.practiceDescription,
        e?.worshipPractice,
        e?.scripturePractice,
        e?.prayerPractice,
        e?.practiceResponse,
        e?.practiceLength,
        e?.timeToLaunch,
        e?.timeEdited,
        e?.pdfResource,
        e?.scriptureReference,
        e?.scripturePassage,
        e?.personalJournalRef,
        e?.personalJournalCount,
        e?.dailyPracticeVideoString
      ]);

  @override
  bool isValidKey(Object? o) => o is DailyPracticeVideosRecord;
}
