import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrayerRequestsRecord extends FirestoreRecord {
  PrayerRequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "requestText" field.
  String? _requestText;
  String get requestText => _requestText ?? '';
  bool hasRequestText() => _requestText != null;

  // "timeUploaded" field.
  DateTime? _timeUploaded;
  DateTime? get timeUploaded => _timeUploaded;
  bool hasTimeUploaded() => _timeUploaded != null;

  // "markedAnswered" field.
  bool? _markedAnswered;
  bool get markedAnswered => _markedAnswered ?? false;
  bool hasMarkedAnswered() => _markedAnswered != null;

  // "prayedforByUsers" field.
  List<DocumentReference>? _prayedforByUsers;
  List<DocumentReference> get prayedforByUsers => _prayedforByUsers ?? const [];
  bool hasPrayedforByUsers() => _prayedforByUsers != null;

  // "public" field.
  bool? _public;
  bool get public => _public ?? false;
  bool hasPublic() => _public != null;

  // "usersName" field.
  String? _usersName;
  String get usersName => _usersName ?? '';
  bool hasUsersName() => _usersName != null;

  // "notificationSent" field.
  bool? _notificationSent;
  bool get notificationSent => _notificationSent ?? false;
  bool hasNotificationSent() => _notificationSent != null;

  // "messageRef" field.
  DocumentReference? _messageRef;
  DocumentReference? get messageRef => _messageRef;
  bool hasMessageRef() => _messageRef != null;

  // "pinned" field.
  bool? _pinned;
  bool get pinned => _pinned ?? false;
  bool hasPinned() => _pinned != null;

  // "pinnedTime" field.
  DateTime? _pinnedTime;
  DateTime? get pinnedTime => _pinnedTime;
  bool hasPinnedTime() => _pinnedTime != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _requestText = snapshotData['requestText'] as String?;
    _timeUploaded = snapshotData['timeUploaded'] as DateTime?;
    _markedAnswered = snapshotData['markedAnswered'] as bool?;
    _prayedforByUsers = getDataList(snapshotData['prayedforByUsers']);
    _public = snapshotData['public'] as bool?;
    _usersName = snapshotData['usersName'] as String?;
    _notificationSent = snapshotData['notificationSent'] as bool?;
    _messageRef = snapshotData['messageRef'] as DocumentReference?;
    _pinned = snapshotData['pinned'] as bool?;
    _pinnedTime = snapshotData['pinnedTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('prayer_requests');

  static Stream<PrayerRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PrayerRequestsRecord.fromSnapshot(s));

  static Future<PrayerRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PrayerRequestsRecord.fromSnapshot(s));

  static PrayerRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PrayerRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PrayerRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PrayerRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PrayerRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PrayerRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPrayerRequestsRecordData({
  DocumentReference? user,
  String? requestText,
  DateTime? timeUploaded,
  bool? markedAnswered,
  bool? public,
  String? usersName,
  bool? notificationSent,
  DocumentReference? messageRef,
  bool? pinned,
  DateTime? pinnedTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'requestText': requestText,
      'timeUploaded': timeUploaded,
      'markedAnswered': markedAnswered,
      'public': public,
      'usersName': usersName,
      'notificationSent': notificationSent,
      'messageRef': messageRef,
      'pinned': pinned,
      'pinnedTime': pinnedTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class PrayerRequestsRecordDocumentEquality
    implements Equality<PrayerRequestsRecord> {
  const PrayerRequestsRecordDocumentEquality();

  @override
  bool equals(PrayerRequestsRecord? e1, PrayerRequestsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        e1?.requestText == e2?.requestText &&
        e1?.timeUploaded == e2?.timeUploaded &&
        e1?.markedAnswered == e2?.markedAnswered &&
        listEquality.equals(e1?.prayedforByUsers, e2?.prayedforByUsers) &&
        e1?.public == e2?.public &&
        e1?.usersName == e2?.usersName &&
        e1?.notificationSent == e2?.notificationSent &&
        e1?.messageRef == e2?.messageRef &&
        e1?.pinned == e2?.pinned &&
        e1?.pinnedTime == e2?.pinnedTime;
  }

  @override
  int hash(PrayerRequestsRecord? e) => const ListEquality().hash([
        e?.user,
        e?.requestText,
        e?.timeUploaded,
        e?.markedAnswered,
        e?.prayedforByUsers,
        e?.public,
        e?.usersName,
        e?.notificationSent,
        e?.messageRef,
        e?.pinned,
        e?.pinnedTime
      ]);

  @override
  bool isValidKey(Object? o) => o is PrayerRequestsRecord;
}
