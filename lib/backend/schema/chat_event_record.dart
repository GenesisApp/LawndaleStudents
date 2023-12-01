import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatEventRecord extends FirestoreRecord {
  ChatEventRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "peopleGoing" field.
  List<DocumentReference>? _peopleGoing;
  List<DocumentReference> get peopleGoing => _peopleGoing ?? const [];
  bool hasPeopleGoing() => _peopleGoing != null;

  // "peopleNotGoing" field.
  List<DocumentReference>? _peopleNotGoing;
  List<DocumentReference> get peopleNotGoing => _peopleNotGoing ?? const [];
  bool hasPeopleNotGoing() => _peopleNotGoing != null;

  // "peopleMaybe" field.
  List<DocumentReference>? _peopleMaybe;
  List<DocumentReference> get peopleMaybe => _peopleMaybe ?? const [];
  bool hasPeopleMaybe() => _peopleMaybe != null;

  // "eventStart" field.
  DateTime? _eventStart;
  DateTime? get eventStart => _eventStart;
  bool hasEventStart() => _eventStart != null;

  // "eventStop" field.
  DateTime? _eventStop;
  DateTime? get eventStop => _eventStop;
  bool hasEventStop() => _eventStop != null;

  // "eventDescription" field.
  String? _eventDescription;
  String get eventDescription => _eventDescription ?? '';
  bool hasEventDescription() => _eventDescription != null;

  // "eventName" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "chatReference" field.
  DocumentReference? _chatReference;
  DocumentReference? get chatReference => _chatReference;
  bool hasChatReference() => _chatReference != null;

  // "eventCreator" field.
  String? _eventCreator;
  String get eventCreator => _eventCreator ?? '';
  bool hasEventCreator() => _eventCreator != null;

  // "timeCreated" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "eventThumbnail" field.
  String? _eventThumbnail;
  String get eventThumbnail => _eventThumbnail ?? '';
  bool hasEventThumbnail() => _eventThumbnail != null;

  // "registrationLink" field.
  String? _registrationLink;
  String get registrationLink => _registrationLink ?? '';
  bool hasRegistrationLink() => _registrationLink != null;

  // "peopleVoted" field.
  List<DocumentReference>? _peopleVoted;
  List<DocumentReference> get peopleVoted => _peopleVoted ?? const [];
  bool hasPeopleVoted() => _peopleVoted != null;

  void _initializeFields() {
    _peopleGoing = getDataList(snapshotData['peopleGoing']);
    _peopleNotGoing = getDataList(snapshotData['peopleNotGoing']);
    _peopleMaybe = getDataList(snapshotData['peopleMaybe']);
    _eventStart = snapshotData['eventStart'] as DateTime?;
    _eventStop = snapshotData['eventStop'] as DateTime?;
    _eventDescription = snapshotData['eventDescription'] as String?;
    _eventName = snapshotData['eventName'] as String?;
    _chatReference = snapshotData['chatReference'] as DocumentReference?;
    _eventCreator = snapshotData['eventCreator'] as String?;
    _timeCreated = snapshotData['timeCreated'] as DateTime?;
    _eventThumbnail = snapshotData['eventThumbnail'] as String?;
    _registrationLink = snapshotData['registrationLink'] as String?;
    _peopleVoted = getDataList(snapshotData['peopleVoted']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chatEvent');

  static Stream<ChatEventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatEventRecord.fromSnapshot(s));

  static Future<ChatEventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatEventRecord.fromSnapshot(s));

  static ChatEventRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatEventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatEventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatEventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatEventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatEventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatEventRecordData({
  DateTime? eventStart,
  DateTime? eventStop,
  String? eventDescription,
  String? eventName,
  DocumentReference? chatReference,
  String? eventCreator,
  DateTime? timeCreated,
  String? eventThumbnail,
  String? registrationLink,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'eventStart': eventStart,
      'eventStop': eventStop,
      'eventDescription': eventDescription,
      'eventName': eventName,
      'chatReference': chatReference,
      'eventCreator': eventCreator,
      'timeCreated': timeCreated,
      'eventThumbnail': eventThumbnail,
      'registrationLink': registrationLink,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatEventRecordDocumentEquality implements Equality<ChatEventRecord> {
  const ChatEventRecordDocumentEquality();

  @override
  bool equals(ChatEventRecord? e1, ChatEventRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.peopleGoing, e2?.peopleGoing) &&
        listEquality.equals(e1?.peopleNotGoing, e2?.peopleNotGoing) &&
        listEquality.equals(e1?.peopleMaybe, e2?.peopleMaybe) &&
        e1?.eventStart == e2?.eventStart &&
        e1?.eventStop == e2?.eventStop &&
        e1?.eventDescription == e2?.eventDescription &&
        e1?.eventName == e2?.eventName &&
        e1?.chatReference == e2?.chatReference &&
        e1?.eventCreator == e2?.eventCreator &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.eventThumbnail == e2?.eventThumbnail &&
        e1?.registrationLink == e2?.registrationLink &&
        listEquality.equals(e1?.peopleVoted, e2?.peopleVoted);
  }

  @override
  int hash(ChatEventRecord? e) => const ListEquality().hash([
        e?.peopleGoing,
        e?.peopleNotGoing,
        e?.peopleMaybe,
        e?.eventStart,
        e?.eventStop,
        e?.eventDescription,
        e?.eventName,
        e?.chatReference,
        e?.eventCreator,
        e?.timeCreated,
        e?.eventThumbnail,
        e?.registrationLink,
        e?.peopleVoted
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatEventRecord;
}
