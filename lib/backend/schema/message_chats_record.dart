import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageChatsRecord extends FirestoreRecord {
  MessageChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "lastMessage" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "lastMessageTime" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  // "lastMessageSentBy" field.
  DocumentReference? _lastMessageSentBy;
  DocumentReference? get lastMessageSentBy => _lastMessageSentBy;
  bool hasLastMessageSentBy() => _lastMessageSentBy != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "groupBackground" field.
  String? _groupBackground;
  String get groupBackground => _groupBackground ?? '';
  bool hasGroupBackground() => _groupBackground != null;

  // "groupName" field.
  String? _groupName;
  String get groupName => _groupName ?? '';
  bool hasGroupName() => _groupName != null;

  // "messageOrder" field.
  int? _messageOrder;
  int get messageOrder => _messageOrder ?? 0;
  bool hasMessageOrder() => _messageOrder != null;

  // "authenticatedUser" field.
  DocumentReference? _authenticatedUser;
  DocumentReference? get authenticatedUser => _authenticatedUser;
  bool hasAuthenticatedUser() => _authenticatedUser != null;

  // "otherUser" field.
  DocumentReference? _otherUser;
  DocumentReference? get otherUser => _otherUser;
  bool hasOtherUser() => _otherUser != null;

  // "pdfviewerVisible" field.
  bool? _pdfviewerVisible;
  bool get pdfviewerVisible => _pdfviewerVisible ?? false;
  bool hasPdfviewerVisible() => _pdfviewerVisible != null;

  // "textImagePreview" field.
  String? _textImagePreview;
  String get textImagePreview => _textImagePreview ?? '';
  bool hasTextImagePreview() => _textImagePreview != null;

  // "pdfFilePreview" field.
  String? _pdfFilePreview;
  String get pdfFilePreview => _pdfFilePreview ?? '';
  bool hasPdfFilePreview() => _pdfFilePreview != null;

  // "pastoralRequest" field.
  bool? _pastoralRequest;
  bool get pastoralRequest => _pastoralRequest ?? false;
  bool hasPastoralRequest() => _pastoralRequest != null;

  // "userswithNotificationsOn" field.
  List<DocumentReference>? _userswithNotificationsOn;
  List<DocumentReference> get userswithNotificationsOn =>
      _userswithNotificationsOn ?? const [];
  bool hasUserswithNotificationsOn() => _userswithNotificationsOn != null;

  // "archived" field.
  bool? _archived;
  bool get archived => _archived ?? false;
  bool hasArchived() => _archived != null;

  // "indicatorVisible" field.
  bool? _indicatorVisible;
  bool get indicatorVisible => _indicatorVisible ?? false;
  bool hasIndicatorVisible() => _indicatorVisible != null;

  // "userswithIndicator" field.
  List<DocumentReference>? _userswithIndicator;
  List<DocumentReference> get userswithIndicator =>
      _userswithIndicator ?? const [];
  bool hasUserswithIndicator() => _userswithIndicator != null;

  // "lastMessageSentByName" field.
  String? _lastMessageSentByName;
  String get lastMessageSentByName => _lastMessageSentByName ?? '';
  bool hasLastMessageSentByName() => _lastMessageSentByName != null;

  // "resetDate" field.
  bool? _resetDate;
  bool get resetDate => _resetDate ?? false;
  bool hasResetDate() => _resetDate != null;

  // "currentPoll" field.
  DocumentReference? _currentPoll;
  DocumentReference? get currentPoll => _currentPoll;
  bool hasCurrentPoll() => _currentPoll != null;

  // "nextEvent" field.
  DocumentReference? _nextEvent;
  DocumentReference? get nextEvent => _nextEvent;
  bool hasNextEvent() => _nextEvent != null;

  // "pollLive" field.
  bool? _pollLive;
  bool get pollLive => _pollLive ?? false;
  bool hasPollLive() => _pollLive != null;

  // "sgChatRef" field.
  DocumentReference? _sgChatRef;
  DocumentReference? get sgChatRef => _sgChatRef;
  bool hasSgChatRef() => _sgChatRef != null;

  void _initializeFields() {
    _lastMessage = snapshotData['lastMessage'] as String?;
    _lastMessageTime = snapshotData['lastMessageTime'] as DateTime?;
    _lastMessageSentBy =
        snapshotData['lastMessageSentBy'] as DocumentReference?;
    _users = getDataList(snapshotData['users']);
    _groupBackground = snapshotData['groupBackground'] as String?;
    _groupName = snapshotData['groupName'] as String?;
    _messageOrder = castToType<int>(snapshotData['messageOrder']);
    _authenticatedUser =
        snapshotData['authenticatedUser'] as DocumentReference?;
    _otherUser = snapshotData['otherUser'] as DocumentReference?;
    _pdfviewerVisible = snapshotData['pdfviewerVisible'] as bool?;
    _textImagePreview = snapshotData['textImagePreview'] as String?;
    _pdfFilePreview = snapshotData['pdfFilePreview'] as String?;
    _pastoralRequest = snapshotData['pastoralRequest'] as bool?;
    _userswithNotificationsOn =
        getDataList(snapshotData['userswithNotificationsOn']);
    _archived = snapshotData['archived'] as bool?;
    _indicatorVisible = snapshotData['indicatorVisible'] as bool?;
    _userswithIndicator = getDataList(snapshotData['userswithIndicator']);
    _lastMessageSentByName = snapshotData['lastMessageSentByName'] as String?;
    _resetDate = snapshotData['resetDate'] as bool?;
    _currentPoll = snapshotData['currentPoll'] as DocumentReference?;
    _nextEvent = snapshotData['nextEvent'] as DocumentReference?;
    _pollLive = snapshotData['pollLive'] as bool?;
    _sgChatRef = snapshotData['sgChatRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('messageChats');

  static Stream<MessageChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessageChatsRecord.fromSnapshot(s));

  static Future<MessageChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessageChatsRecord.fromSnapshot(s));

  static MessageChatsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessageChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessageChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessageChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessageChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessageChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessageChatsRecordData({
  String? lastMessage,
  DateTime? lastMessageTime,
  DocumentReference? lastMessageSentBy,
  String? groupBackground,
  String? groupName,
  int? messageOrder,
  DocumentReference? authenticatedUser,
  DocumentReference? otherUser,
  bool? pdfviewerVisible,
  String? textImagePreview,
  String? pdfFilePreview,
  bool? pastoralRequest,
  bool? archived,
  bool? indicatorVisible,
  String? lastMessageSentByName,
  bool? resetDate,
  DocumentReference? currentPoll,
  DocumentReference? nextEvent,
  bool? pollLive,
  DocumentReference? sgChatRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime,
      'lastMessageSentBy': lastMessageSentBy,
      'groupBackground': groupBackground,
      'groupName': groupName,
      'messageOrder': messageOrder,
      'authenticatedUser': authenticatedUser,
      'otherUser': otherUser,
      'pdfviewerVisible': pdfviewerVisible,
      'textImagePreview': textImagePreview,
      'pdfFilePreview': pdfFilePreview,
      'pastoralRequest': pastoralRequest,
      'archived': archived,
      'indicatorVisible': indicatorVisible,
      'lastMessageSentByName': lastMessageSentByName,
      'resetDate': resetDate,
      'currentPoll': currentPoll,
      'nextEvent': nextEvent,
      'pollLive': pollLive,
      'sgChatRef': sgChatRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessageChatsRecordDocumentEquality
    implements Equality<MessageChatsRecord> {
  const MessageChatsRecordDocumentEquality();

  @override
  bool equals(MessageChatsRecord? e1, MessageChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageTime == e2?.lastMessageTime &&
        e1?.lastMessageSentBy == e2?.lastMessageSentBy &&
        listEquality.equals(e1?.users, e2?.users) &&
        e1?.groupBackground == e2?.groupBackground &&
        e1?.groupName == e2?.groupName &&
        e1?.messageOrder == e2?.messageOrder &&
        e1?.authenticatedUser == e2?.authenticatedUser &&
        e1?.otherUser == e2?.otherUser &&
        e1?.pdfviewerVisible == e2?.pdfviewerVisible &&
        e1?.textImagePreview == e2?.textImagePreview &&
        e1?.pdfFilePreview == e2?.pdfFilePreview &&
        e1?.pastoralRequest == e2?.pastoralRequest &&
        listEquality.equals(
            e1?.userswithNotificationsOn, e2?.userswithNotificationsOn) &&
        e1?.archived == e2?.archived &&
        e1?.indicatorVisible == e2?.indicatorVisible &&
        listEquality.equals(e1?.userswithIndicator, e2?.userswithIndicator) &&
        e1?.lastMessageSentByName == e2?.lastMessageSentByName &&
        e1?.resetDate == e2?.resetDate &&
        e1?.currentPoll == e2?.currentPoll &&
        e1?.nextEvent == e2?.nextEvent &&
        e1?.pollLive == e2?.pollLive &&
        e1?.sgChatRef == e2?.sgChatRef;
  }

  @override
  int hash(MessageChatsRecord? e) => const ListEquality().hash([
        e?.lastMessage,
        e?.lastMessageTime,
        e?.lastMessageSentBy,
        e?.users,
        e?.groupBackground,
        e?.groupName,
        e?.messageOrder,
        e?.authenticatedUser,
        e?.otherUser,
        e?.pdfviewerVisible,
        e?.textImagePreview,
        e?.pdfFilePreview,
        e?.pastoralRequest,
        e?.userswithNotificationsOn,
        e?.archived,
        e?.indicatorVisible,
        e?.userswithIndicator,
        e?.lastMessageSentByName,
        e?.resetDate,
        e?.currentPoll,
        e?.nextEvent,
        e?.pollLive,
        e?.sgChatRef
      ]);

  @override
  bool isValidKey(Object? o) => o is MessageChatsRecord;
}
