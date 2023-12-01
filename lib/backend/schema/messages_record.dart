import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "messageText" field.
  String? _messageText;
  String get messageText => _messageText ?? '';
  bool hasMessageText() => _messageText != null;

  // "timeSent" field.
  DateTime? _timeSent;
  DateTime? get timeSent => _timeSent;
  bool hasTimeSent() => _timeSent != null;

  // "read" field.
  bool? _read;
  bool get read => _read ?? false;
  bool hasRead() => _read != null;

  // "reactionsVisible" field.
  bool? _reactionsVisible;
  bool get reactionsVisible => _reactionsVisible ?? false;
  bool hasReactionsVisible() => _reactionsVisible != null;

  // "textImage" field.
  String? _textImage;
  String get textImage => _textImage ?? '';
  bool hasTextImage() => _textImage != null;

  // "chatReference" field.
  DocumentReference? _chatReference;
  DocumentReference? get chatReference => _chatReference;
  bool hasChatReference() => _chatReference != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "messageLiked" field.
  bool? _messageLiked;
  bool get messageLiked => _messageLiked ?? false;
  bool hasMessageLiked() => _messageLiked != null;

  // "messageOrder" field.
  int? _messageOrder;
  int get messageOrder => _messageOrder ?? 0;
  bool hasMessageOrder() => _messageOrder != null;

  // "messageLaughedBy" field.
  List<DocumentReference>? _messageLaughedBy;
  List<DocumentReference> get messageLaughedBy => _messageLaughedBy ?? const [];
  bool hasMessageLaughedBy() => _messageLaughedBy != null;

  // "messageCriedBy" field.
  List<DocumentReference>? _messageCriedBy;
  List<DocumentReference> get messageCriedBy => _messageCriedBy ?? const [];
  bool hasMessageCriedBy() => _messageCriedBy != null;

  // "messageLikedBy" field.
  List<DocumentReference>? _messageLikedBy;
  List<DocumentReference> get messageLikedBy => _messageLikedBy ?? const [];
  bool hasMessageLikedBy() => _messageLikedBy != null;

  // "lastmessageSentby" field.
  DocumentReference? _lastmessageSentby;
  DocumentReference? get lastmessageSentby => _lastmessageSentby;
  bool hasLastmessageSentby() => _lastmessageSentby != null;

  // "pdfImage" field.
  String? _pdfImage;
  String get pdfImage => _pdfImage ?? '';
  bool hasPdfImage() => _pdfImage != null;

  // "textImagePath" field.
  String? _textImagePath;
  String get textImagePath => _textImagePath ?? '';
  bool hasTextImagePath() => _textImagePath != null;

  // "edited" field.
  bool? _edited;
  bool get edited => _edited ?? false;
  bool hasEdited() => _edited != null;

  // "pin" field.
  bool? _pin;
  bool get pin => _pin ?? false;
  bool hasPin() => _pin != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "personReactingList" field.
  List<DocumentReference>? _personReactingList;
  List<DocumentReference> get personReactingList =>
      _personReactingList ?? const [];
  bool hasPersonReactingList() => _personReactingList != null;

  // "personReplying" field.
  DocumentReference? _personReplying;
  DocumentReference? get personReplying => _personReplying;
  bool hasPersonReplying() => _personReplying != null;

  // "messageReplyingto" field.
  DocumentReference? _messageReplyingto;
  DocumentReference? get messageReplyingto => _messageReplyingto;
  bool hasMessageReplyingto() => _messageReplyingto != null;

  // "hasReply" field.
  bool? _hasReply;
  bool get hasReply => _hasReply ?? false;
  bool hasHasReply() => _hasReply != null;

  // "dateReset" field.
  DateTime? _dateReset;
  DateTime? get dateReset => _dateReset;
  bool hasDateReset() => _dateReset != null;

  // "dateResetMessage" field.
  bool? _dateResetMessage;
  bool get dateResetMessage => _dateResetMessage ?? false;
  bool hasDateResetMessage() => _dateResetMessage != null;

  // "messageNumberIDs" field.
  int? _messageNumberIDs;
  int get messageNumberIDs => _messageNumberIDs ?? 0;
  bool hasMessageNumberIDs() => _messageNumberIDs != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "linkTitle" field.
  String? _linkTitle;
  String get linkTitle => _linkTitle ?? '';
  bool hasLinkTitle() => _linkTitle != null;

  // "prayerRequest" field.
  DocumentReference? _prayerRequest;
  DocumentReference? get prayerRequest => _prayerRequest;
  bool hasPrayerRequest() => _prayerRequest != null;

  // "prayerText" field.
  String? _prayerText;
  String get prayerText => _prayerText ?? '';
  bool hasPrayerText() => _prayerText != null;

  void _initializeFields() {
    _messageText = snapshotData['messageText'] as String?;
    _timeSent = snapshotData['timeSent'] as DateTime?;
    _read = snapshotData['read'] as bool?;
    _reactionsVisible = snapshotData['reactionsVisible'] as bool?;
    _textImage = snapshotData['textImage'] as String?;
    _chatReference = snapshotData['chatReference'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _messageLiked = snapshotData['messageLiked'] as bool?;
    _messageOrder = castToType<int>(snapshotData['messageOrder']);
    _messageLaughedBy = getDataList(snapshotData['messageLaughedBy']);
    _messageCriedBy = getDataList(snapshotData['messageCriedBy']);
    _messageLikedBy = getDataList(snapshotData['messageLikedBy']);
    _lastmessageSentby =
        snapshotData['lastmessageSentby'] as DocumentReference?;
    _pdfImage = snapshotData['pdfImage'] as String?;
    _textImagePath = snapshotData['textImagePath'] as String?;
    _edited = snapshotData['edited'] as bool?;
    _pin = snapshotData['pin'] as bool?;
    _userName = snapshotData['userName'] as String?;
    _personReactingList = getDataList(snapshotData['personReactingList']);
    _personReplying = snapshotData['personReplying'] as DocumentReference?;
    _messageReplyingto =
        snapshotData['messageReplyingto'] as DocumentReference?;
    _hasReply = snapshotData['hasReply'] as bool?;
    _dateReset = snapshotData['dateReset'] as DateTime?;
    _dateResetMessage = snapshotData['dateResetMessage'] as bool?;
    _messageNumberIDs = castToType<int>(snapshotData['messageNumberIDs']);
    _link = snapshotData['link'] as String?;
    _linkTitle = snapshotData['linkTitle'] as String?;
    _prayerRequest = snapshotData['prayerRequest'] as DocumentReference?;
    _prayerText = snapshotData['prayerText'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('messages');

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  String? messageText,
  DateTime? timeSent,
  bool? read,
  bool? reactionsVisible,
  String? textImage,
  DocumentReference? chatReference,
  DocumentReference? user,
  bool? messageLiked,
  int? messageOrder,
  DocumentReference? lastmessageSentby,
  String? pdfImage,
  String? textImagePath,
  bool? edited,
  bool? pin,
  String? userName,
  DocumentReference? personReplying,
  DocumentReference? messageReplyingto,
  bool? hasReply,
  DateTime? dateReset,
  bool? dateResetMessage,
  int? messageNumberIDs,
  String? link,
  String? linkTitle,
  DocumentReference? prayerRequest,
  String? prayerText,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'messageText': messageText,
      'timeSent': timeSent,
      'read': read,
      'reactionsVisible': reactionsVisible,
      'textImage': textImage,
      'chatReference': chatReference,
      'user': user,
      'messageLiked': messageLiked,
      'messageOrder': messageOrder,
      'lastmessageSentby': lastmessageSentby,
      'pdfImage': pdfImage,
      'textImagePath': textImagePath,
      'edited': edited,
      'pin': pin,
      'userName': userName,
      'personReplying': personReplying,
      'messageReplyingto': messageReplyingto,
      'hasReply': hasReply,
      'dateReset': dateReset,
      'dateResetMessage': dateResetMessage,
      'messageNumberIDs': messageNumberIDs,
      'link': link,
      'linkTitle': linkTitle,
      'prayerRequest': prayerRequest,
      'prayerText': prayerText,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.messageText == e2?.messageText &&
        e1?.timeSent == e2?.timeSent &&
        e1?.read == e2?.read &&
        e1?.reactionsVisible == e2?.reactionsVisible &&
        e1?.textImage == e2?.textImage &&
        e1?.chatReference == e2?.chatReference &&
        e1?.user == e2?.user &&
        e1?.messageLiked == e2?.messageLiked &&
        e1?.messageOrder == e2?.messageOrder &&
        listEquality.equals(e1?.messageLaughedBy, e2?.messageLaughedBy) &&
        listEquality.equals(e1?.messageCriedBy, e2?.messageCriedBy) &&
        listEquality.equals(e1?.messageLikedBy, e2?.messageLikedBy) &&
        e1?.lastmessageSentby == e2?.lastmessageSentby &&
        e1?.pdfImage == e2?.pdfImage &&
        e1?.textImagePath == e2?.textImagePath &&
        e1?.edited == e2?.edited &&
        e1?.pin == e2?.pin &&
        e1?.userName == e2?.userName &&
        listEquality.equals(e1?.personReactingList, e2?.personReactingList) &&
        e1?.personReplying == e2?.personReplying &&
        e1?.messageReplyingto == e2?.messageReplyingto &&
        e1?.hasReply == e2?.hasReply &&
        e1?.dateReset == e2?.dateReset &&
        e1?.dateResetMessage == e2?.dateResetMessage &&
        e1?.messageNumberIDs == e2?.messageNumberIDs &&
        e1?.link == e2?.link &&
        e1?.linkTitle == e2?.linkTitle &&
        e1?.prayerRequest == e2?.prayerRequest &&
        e1?.prayerText == e2?.prayerText;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality().hash([
        e?.messageText,
        e?.timeSent,
        e?.read,
        e?.reactionsVisible,
        e?.textImage,
        e?.chatReference,
        e?.user,
        e?.messageLiked,
        e?.messageOrder,
        e?.messageLaughedBy,
        e?.messageCriedBy,
        e?.messageLikedBy,
        e?.lastmessageSentby,
        e?.pdfImage,
        e?.textImagePath,
        e?.edited,
        e?.pin,
        e?.userName,
        e?.personReactingList,
        e?.personReplying,
        e?.messageReplyingto,
        e?.hasReply,
        e?.dateReset,
        e?.dateResetMessage,
        e?.messageNumberIDs,
        e?.link,
        e?.linkTitle,
        e?.prayerRequest,
        e?.prayerText
      ]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
