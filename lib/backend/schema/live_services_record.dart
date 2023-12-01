import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LiveServicesRecord extends FirestoreRecord {
  LiveServicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "visibleBanner" field.
  bool? _visibleBanner;
  bool get visibleBanner => _visibleBanner ?? false;
  bool hasVisibleBanner() => _visibleBanner != null;

  // "bannerNumber" field.
  int? _bannerNumber;
  int get bannerNumber => _bannerNumber ?? 0;
  bool hasBannerNumber() => _bannerNumber != null;

  // "liveServiceURL" field.
  String? _liveServiceURL;
  String get liveServiceURL => _liveServiceURL ?? '';
  bool hasLiveServiceURL() => _liveServiceURL != null;

  void _initializeFields() {
    _visibleBanner = snapshotData['visibleBanner'] as bool?;
    _bannerNumber = castToType<int>(snapshotData['bannerNumber']);
    _liveServiceURL = snapshotData['liveServiceURL'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('liveServices');

  static Stream<LiveServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LiveServicesRecord.fromSnapshot(s));

  static Future<LiveServicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LiveServicesRecord.fromSnapshot(s));

  static LiveServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LiveServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LiveServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LiveServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LiveServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LiveServicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLiveServicesRecordData({
  bool? visibleBanner,
  int? bannerNumber,
  String? liveServiceURL,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'visibleBanner': visibleBanner,
      'bannerNumber': bannerNumber,
      'liveServiceURL': liveServiceURL,
    }.withoutNulls,
  );

  return firestoreData;
}

class LiveServicesRecordDocumentEquality
    implements Equality<LiveServicesRecord> {
  const LiveServicesRecordDocumentEquality();

  @override
  bool equals(LiveServicesRecord? e1, LiveServicesRecord? e2) {
    return e1?.visibleBanner == e2?.visibleBanner &&
        e1?.bannerNumber == e2?.bannerNumber &&
        e1?.liveServiceURL == e2?.liveServiceURL;
  }

  @override
  int hash(LiveServicesRecord? e) => const ListEquality()
      .hash([e?.visibleBanner, e?.bannerNumber, e?.liveServiceURL]);

  @override
  bool isValidKey(Object? o) => o is LiveServicesRecord;
}
