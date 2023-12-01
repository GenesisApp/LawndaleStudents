import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatPollRecord extends FirestoreRecord {
  ChatPollRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "pollName" field.
  String? _pollName;
  String get pollName => _pollName ?? '';
  bool hasPollName() => _pollName != null;

  // "pollDescription" field.
  String? _pollDescription;
  String get pollDescription => _pollDescription ?? '';
  bool hasPollDescription() => _pollDescription != null;

  // "pollOpen" field.
  DateTime? _pollOpen;
  DateTime? get pollOpen => _pollOpen;
  bool hasPollOpen() => _pollOpen != null;

  // "pollClose" field.
  DateTime? _pollClose;
  DateTime? get pollClose => _pollClose;
  bool hasPollClose() => _pollClose != null;

  // "optionA" field.
  String? _optionA;
  String get optionA => _optionA ?? '';
  bool hasOptionA() => _optionA != null;

  // "optionB" field.
  String? _optionB;
  String get optionB => _optionB ?? '';
  bool hasOptionB() => _optionB != null;

  // "optionC" field.
  String? _optionC;
  String get optionC => _optionC ?? '';
  bool hasOptionC() => _optionC != null;

  // "optionD" field.
  String? _optionD;
  String get optionD => _optionD ?? '';
  bool hasOptionD() => _optionD != null;

  // "optionE" field.
  String? _optionE;
  String get optionE => _optionE ?? '';
  bool hasOptionE() => _optionE != null;

  // "optionAusers" field.
  List<DocumentReference>? _optionAusers;
  List<DocumentReference> get optionAusers => _optionAusers ?? const [];
  bool hasOptionAusers() => _optionAusers != null;

  // "optionBusers" field.
  List<DocumentReference>? _optionBusers;
  List<DocumentReference> get optionBusers => _optionBusers ?? const [];
  bool hasOptionBusers() => _optionBusers != null;

  // "optionCusers" field.
  List<DocumentReference>? _optionCusers;
  List<DocumentReference> get optionCusers => _optionCusers ?? const [];
  bool hasOptionCusers() => _optionCusers != null;

  // "optionDusers" field.
  List<DocumentReference>? _optionDusers;
  List<DocumentReference> get optionDusers => _optionDusers ?? const [];
  bool hasOptionDusers() => _optionDusers != null;

  // "optionEusers" field.
  List<DocumentReference>? _optionEusers;
  List<DocumentReference> get optionEusers => _optionEusers ?? const [];
  bool hasOptionEusers() => _optionEusers != null;

  // "chatReference" field.
  DocumentReference? _chatReference;
  DocumentReference? get chatReference => _chatReference;
  bool hasChatReference() => _chatReference != null;

  // "answersPublic" field.
  bool? _answersPublic;
  bool get answersPublic => _answersPublic ?? false;
  bool hasAnswersPublic() => _answersPublic != null;

  // "usersVoted" field.
  List<DocumentReference>? _usersVoted;
  List<DocumentReference> get usersVoted => _usersVoted ?? const [];
  bool hasUsersVoted() => _usersVoted != null;

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "creatorName" field.
  String? _creatorName;
  String get creatorName => _creatorName ?? '';
  bool hasCreatorName() => _creatorName != null;

  // "timeCreated" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  void _initializeFields() {
    _pollName = snapshotData['pollName'] as String?;
    _pollDescription = snapshotData['pollDescription'] as String?;
    _pollOpen = snapshotData['pollOpen'] as DateTime?;
    _pollClose = snapshotData['pollClose'] as DateTime?;
    _optionA = snapshotData['optionA'] as String?;
    _optionB = snapshotData['optionB'] as String?;
    _optionC = snapshotData['optionC'] as String?;
    _optionD = snapshotData['optionD'] as String?;
    _optionE = snapshotData['optionE'] as String?;
    _optionAusers = getDataList(snapshotData['optionAusers']);
    _optionBusers = getDataList(snapshotData['optionBusers']);
    _optionCusers = getDataList(snapshotData['optionCusers']);
    _optionDusers = getDataList(snapshotData['optionDusers']);
    _optionEusers = getDataList(snapshotData['optionEusers']);
    _chatReference = snapshotData['chatReference'] as DocumentReference?;
    _answersPublic = snapshotData['answersPublic'] as bool?;
    _usersVoted = getDataList(snapshotData['usersVoted']);
    _creator = snapshotData['creator'] as DocumentReference?;
    _creatorName = snapshotData['creatorName'] as String?;
    _timeCreated = snapshotData['timeCreated'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chatPoll');

  static Stream<ChatPollRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatPollRecord.fromSnapshot(s));

  static Future<ChatPollRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatPollRecord.fromSnapshot(s));

  static ChatPollRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatPollRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatPollRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatPollRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatPollRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatPollRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatPollRecordData({
  String? pollName,
  String? pollDescription,
  DateTime? pollOpen,
  DateTime? pollClose,
  String? optionA,
  String? optionB,
  String? optionC,
  String? optionD,
  String? optionE,
  DocumentReference? chatReference,
  bool? answersPublic,
  DocumentReference? creator,
  String? creatorName,
  DateTime? timeCreated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pollName': pollName,
      'pollDescription': pollDescription,
      'pollOpen': pollOpen,
      'pollClose': pollClose,
      'optionA': optionA,
      'optionB': optionB,
      'optionC': optionC,
      'optionD': optionD,
      'optionE': optionE,
      'chatReference': chatReference,
      'answersPublic': answersPublic,
      'creator': creator,
      'creatorName': creatorName,
      'timeCreated': timeCreated,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatPollRecordDocumentEquality implements Equality<ChatPollRecord> {
  const ChatPollRecordDocumentEquality();

  @override
  bool equals(ChatPollRecord? e1, ChatPollRecord? e2) {
    const listEquality = ListEquality();
    return e1?.pollName == e2?.pollName &&
        e1?.pollDescription == e2?.pollDescription &&
        e1?.pollOpen == e2?.pollOpen &&
        e1?.pollClose == e2?.pollClose &&
        e1?.optionA == e2?.optionA &&
        e1?.optionB == e2?.optionB &&
        e1?.optionC == e2?.optionC &&
        e1?.optionD == e2?.optionD &&
        e1?.optionE == e2?.optionE &&
        listEquality.equals(e1?.optionAusers, e2?.optionAusers) &&
        listEquality.equals(e1?.optionBusers, e2?.optionBusers) &&
        listEquality.equals(e1?.optionCusers, e2?.optionCusers) &&
        listEquality.equals(e1?.optionDusers, e2?.optionDusers) &&
        listEquality.equals(e1?.optionEusers, e2?.optionEusers) &&
        e1?.chatReference == e2?.chatReference &&
        e1?.answersPublic == e2?.answersPublic &&
        listEquality.equals(e1?.usersVoted, e2?.usersVoted) &&
        e1?.creator == e2?.creator &&
        e1?.creatorName == e2?.creatorName &&
        e1?.timeCreated == e2?.timeCreated;
  }

  @override
  int hash(ChatPollRecord? e) => const ListEquality().hash([
        e?.pollName,
        e?.pollDescription,
        e?.pollOpen,
        e?.pollClose,
        e?.optionA,
        e?.optionB,
        e?.optionC,
        e?.optionD,
        e?.optionE,
        e?.optionAusers,
        e?.optionBusers,
        e?.optionCusers,
        e?.optionDusers,
        e?.optionEusers,
        e?.chatReference,
        e?.answersPublic,
        e?.usersVoted,
        e?.creator,
        e?.creatorName,
        e?.timeCreated
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatPollRecord;
}
