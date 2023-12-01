import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FriendRequestsRecord extends FirestoreRecord {
  FriendRequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "timeofRequest" field.
  DateTime? _timeofRequest;
  DateTime? get timeofRequest => _timeofRequest;
  bool hasTimeofRequest() => _timeofRequest != null;

  // "requestSender" field.
  DocumentReference? _requestSender;
  DocumentReference? get requestSender => _requestSender;
  bool hasRequestSender() => _requestSender != null;

  // "requestReceiver" field.
  DocumentReference? _requestReceiver;
  DocumentReference? get requestReceiver => _requestReceiver;
  bool hasRequestReceiver() => _requestReceiver != null;

  // "requestAccepted" field.
  bool? _requestAccepted;
  bool get requestAccepted => _requestAccepted ?? false;
  bool hasRequestAccepted() => _requestAccepted != null;

  // "requestAnswered" field.
  bool? _requestAnswered;
  bool get requestAnswered => _requestAnswered ?? false;
  bool hasRequestAnswered() => _requestAnswered != null;

  // "requestCreated" field.
  bool? _requestCreated;
  bool get requestCreated => _requestCreated ?? false;
  bool hasRequestCreated() => _requestCreated != null;

  void _initializeFields() {
    _timeofRequest = snapshotData['timeofRequest'] as DateTime?;
    _requestSender = snapshotData['requestSender'] as DocumentReference?;
    _requestReceiver = snapshotData['requestReceiver'] as DocumentReference?;
    _requestAccepted = snapshotData['requestAccepted'] as bool?;
    _requestAnswered = snapshotData['requestAnswered'] as bool?;
    _requestCreated = snapshotData['requestCreated'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('friendRequests');

  static Stream<FriendRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FriendRequestsRecord.fromSnapshot(s));

  static Future<FriendRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FriendRequestsRecord.fromSnapshot(s));

  static FriendRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FriendRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FriendRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FriendRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FriendRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FriendRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFriendRequestsRecordData({
  DateTime? timeofRequest,
  DocumentReference? requestSender,
  DocumentReference? requestReceiver,
  bool? requestAccepted,
  bool? requestAnswered,
  bool? requestCreated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timeofRequest': timeofRequest,
      'requestSender': requestSender,
      'requestReceiver': requestReceiver,
      'requestAccepted': requestAccepted,
      'requestAnswered': requestAnswered,
      'requestCreated': requestCreated,
    }.withoutNulls,
  );

  return firestoreData;
}

class FriendRequestsRecordDocumentEquality
    implements Equality<FriendRequestsRecord> {
  const FriendRequestsRecordDocumentEquality();

  @override
  bool equals(FriendRequestsRecord? e1, FriendRequestsRecord? e2) {
    return e1?.timeofRequest == e2?.timeofRequest &&
        e1?.requestSender == e2?.requestSender &&
        e1?.requestReceiver == e2?.requestReceiver &&
        e1?.requestAccepted == e2?.requestAccepted &&
        e1?.requestAnswered == e2?.requestAnswered &&
        e1?.requestCreated == e2?.requestCreated;
  }

  @override
  int hash(FriendRequestsRecord? e) => const ListEquality().hash([
        e?.timeofRequest,
        e?.requestSender,
        e?.requestReceiver,
        e?.requestAccepted,
        e?.requestAnswered,
        e?.requestCreated
      ]);

  @override
  bool isValidKey(Object? o) => o is FriendRequestsRecord;
}
