import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PersonalJournalsRecord extends FirestoreRecord {
  PersonalJournalsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "journalDate" field.
  DateTime? _journalDate;
  DateTime? get journalDate => _journalDate;
  bool hasJournalDate() => _journalDate != null;

  // "journalText" field.
  String? _journalText;
  String get journalText => _journalText ?? '';
  bool hasJournalText() => _journalText != null;

  // "journalResponseQuestion" field.
  String? _journalResponseQuestion;
  String get journalResponseQuestion => _journalResponseQuestion ?? '';
  bool hasJournalResponseQuestion() => _journalResponseQuestion != null;

  // "journalUser" field.
  DocumentReference? _journalUser;
  DocumentReference? get journalUser => _journalUser;
  bool hasJournalUser() => _journalUser != null;

  // "likedByUser" field.
  bool? _likedByUser;
  bool get likedByUser => _likedByUser ?? false;
  bool hasLikedByUser() => _likedByUser != null;

  // "publicLikes" field.
  int? _publicLikes;
  int get publicLikes => _publicLikes ?? 0;
  bool hasPublicLikes() => _publicLikes != null;

  // "journalOne" field.
  bool? _journalOne;
  bool get journalOne => _journalOne ?? false;
  bool hasJournalOne() => _journalOne != null;

  // "journalTwo" field.
  bool? _journalTwo;
  bool get journalTwo => _journalTwo ?? false;
  bool hasJournalTwo() => _journalTwo != null;

  // "journalThree" field.
  bool? _journalThree;
  bool get journalThree => _journalThree ?? false;
  bool hasJournalThree() => _journalThree != null;

  // "likedbyUsers" field.
  List<DocumentReference>? _likedbyUsers;
  List<DocumentReference> get likedbyUsers => _likedbyUsers ?? const [];
  bool hasLikedbyUsers() => _likedbyUsers != null;

  // "journalReplies" field.
  List<DocumentReference>? _journalReplies;
  List<DocumentReference> get journalReplies => _journalReplies ?? const [];
  bool hasJournalReplies() => _journalReplies != null;

  // "journalRepliesNum" field.
  int? _journalRepliesNum;
  int get journalRepliesNum => _journalRepliesNum ?? 0;
  bool hasJournalRepliesNum() => _journalRepliesNum != null;

  // "resourceJournal" field.
  bool? _resourceJournal;
  bool get resourceJournal => _resourceJournal ?? false;
  bool hasResourceJournal() => _resourceJournal != null;

  // "resourceJournalRef" field.
  DocumentReference? _resourceJournalRef;
  DocumentReference? get resourceJournalRef => _resourceJournalRef;
  bool hasResourceJournalRef() => _resourceJournalRef != null;

  // "videoURL" field.
  String? _videoURL;
  String get videoURL => _videoURL ?? '';
  bool hasVideoURL() => _videoURL != null;

  // "messageJournal" field.
  bool? _messageJournal;
  bool get messageJournal => _messageJournal ?? false;
  bool hasMessageJournal() => _messageJournal != null;

  // "dailyPractice" field.
  DocumentReference? _dailyPractice;
  DocumentReference? get dailyPractice => _dailyPractice;
  bool hasDailyPractice() => _dailyPractice != null;

  // "journalDayDate" field.
  DateTime? _journalDayDate;
  DateTime? get journalDayDate => _journalDayDate;
  bool hasJournalDayDate() => _journalDayDate != null;

  void _initializeFields() {
    _journalDate = snapshotData['journalDate'] as DateTime?;
    _journalText = snapshotData['journalText'] as String?;
    _journalResponseQuestion =
        snapshotData['journalResponseQuestion'] as String?;
    _journalUser = snapshotData['journalUser'] as DocumentReference?;
    _likedByUser = snapshotData['likedByUser'] as bool?;
    _publicLikes = castToType<int>(snapshotData['publicLikes']);
    _journalOne = snapshotData['journalOne'] as bool?;
    _journalTwo = snapshotData['journalTwo'] as bool?;
    _journalThree = snapshotData['journalThree'] as bool?;
    _likedbyUsers = getDataList(snapshotData['likedbyUsers']);
    _journalReplies = getDataList(snapshotData['journalReplies']);
    _journalRepliesNum = castToType<int>(snapshotData['journalRepliesNum']);
    _resourceJournal = snapshotData['resourceJournal'] as bool?;
    _resourceJournalRef =
        snapshotData['resourceJournalRef'] as DocumentReference?;
    _videoURL = snapshotData['videoURL'] as String?;
    _messageJournal = snapshotData['messageJournal'] as bool?;
    _dailyPractice = snapshotData['dailyPractice'] as DocumentReference?;
    _journalDayDate = snapshotData['journalDayDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('personalJournals');

  static Stream<PersonalJournalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PersonalJournalsRecord.fromSnapshot(s));

  static Future<PersonalJournalsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PersonalJournalsRecord.fromSnapshot(s));

  static PersonalJournalsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PersonalJournalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PersonalJournalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PersonalJournalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PersonalJournalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PersonalJournalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPersonalJournalsRecordData({
  DateTime? journalDate,
  String? journalText,
  String? journalResponseQuestion,
  DocumentReference? journalUser,
  bool? likedByUser,
  int? publicLikes,
  bool? journalOne,
  bool? journalTwo,
  bool? journalThree,
  int? journalRepliesNum,
  bool? resourceJournal,
  DocumentReference? resourceJournalRef,
  String? videoURL,
  bool? messageJournal,
  DocumentReference? dailyPractice,
  DateTime? journalDayDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'journalDate': journalDate,
      'journalText': journalText,
      'journalResponseQuestion': journalResponseQuestion,
      'journalUser': journalUser,
      'likedByUser': likedByUser,
      'publicLikes': publicLikes,
      'journalOne': journalOne,
      'journalTwo': journalTwo,
      'journalThree': journalThree,
      'journalRepliesNum': journalRepliesNum,
      'resourceJournal': resourceJournal,
      'resourceJournalRef': resourceJournalRef,
      'videoURL': videoURL,
      'messageJournal': messageJournal,
      'dailyPractice': dailyPractice,
      'journalDayDate': journalDayDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class PersonalJournalsRecordDocumentEquality
    implements Equality<PersonalJournalsRecord> {
  const PersonalJournalsRecordDocumentEquality();

  @override
  bool equals(PersonalJournalsRecord? e1, PersonalJournalsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.journalDate == e2?.journalDate &&
        e1?.journalText == e2?.journalText &&
        e1?.journalResponseQuestion == e2?.journalResponseQuestion &&
        e1?.journalUser == e2?.journalUser &&
        e1?.likedByUser == e2?.likedByUser &&
        e1?.publicLikes == e2?.publicLikes &&
        e1?.journalOne == e2?.journalOne &&
        e1?.journalTwo == e2?.journalTwo &&
        e1?.journalThree == e2?.journalThree &&
        listEquality.equals(e1?.likedbyUsers, e2?.likedbyUsers) &&
        listEquality.equals(e1?.journalReplies, e2?.journalReplies) &&
        e1?.journalRepliesNum == e2?.journalRepliesNum &&
        e1?.resourceJournal == e2?.resourceJournal &&
        e1?.resourceJournalRef == e2?.resourceJournalRef &&
        e1?.videoURL == e2?.videoURL &&
        e1?.messageJournal == e2?.messageJournal &&
        e1?.dailyPractice == e2?.dailyPractice &&
        e1?.journalDayDate == e2?.journalDayDate;
  }

  @override
  int hash(PersonalJournalsRecord? e) => const ListEquality().hash([
        e?.journalDate,
        e?.journalText,
        e?.journalResponseQuestion,
        e?.journalUser,
        e?.likedByUser,
        e?.publicLikes,
        e?.journalOne,
        e?.journalTwo,
        e?.journalThree,
        e?.likedbyUsers,
        e?.journalReplies,
        e?.journalRepliesNum,
        e?.resourceJournal,
        e?.resourceJournalRef,
        e?.videoURL,
        e?.messageJournal,
        e?.dailyPractice,
        e?.journalDayDate
      ]);

  @override
  bool isValidKey(Object? o) => o is PersonalJournalsRecord;
}
