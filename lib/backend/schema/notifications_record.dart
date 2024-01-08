import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tagRef" field.
  DocumentReference? _tagRef;
  DocumentReference? get tagRef => _tagRef;
  bool hasTagRef() => _tagRef != null;

  // "notificationText" field.
  String? _notificationText;
  String get notificationText => _notificationText ?? '';
  bool hasNotificationText() => _notificationText != null;

  // "notificationPic" field.
  String? _notificationPic;
  String get notificationPic => _notificationPic ?? '';
  bool hasNotificationPic() => _notificationPic != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "tagName" field.
  String? _tagName;
  String get tagName => _tagName ?? '';
  bool hasTagName() => _tagName != null;

  void _initializeFields() {
    _tagRef = snapshotData['tagRef'] as DocumentReference?;
    _notificationText = snapshotData['notificationText'] as String?;
    _notificationPic = snapshotData['notificationPic'] as String?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _tagName = snapshotData['tagName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  DocumentReference? tagRef,
  String? notificationText,
  String? notificationPic,
  DateTime? createdTime,
  String? tagName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tagRef': tagRef,
      'notificationText': notificationText,
      'notificationPic': notificationPic,
      'createdTime': createdTime,
      'tagName': tagName,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.tagRef == e2?.tagRef &&
        e1?.notificationText == e2?.notificationText &&
        e1?.notificationPic == e2?.notificationPic &&
        e1?.createdTime == e2?.createdTime &&
        e1?.tagName == e2?.tagName;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.tagRef,
        e?.notificationText,
        e?.notificationPic,
        e?.createdTime,
        e?.tagName
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
