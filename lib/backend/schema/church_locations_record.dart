import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChurchLocationsRecord extends FirestoreRecord {
  ChurchLocationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "campusName" field.
  String? _campusName;
  String get campusName => _campusName ?? '';
  bool hasCampusName() => _campusName != null;

  // "campusLocation" field.
  LatLng? _campusLocation;
  LatLng? get campusLocation => _campusLocation;
  bool hasCampusLocation() => _campusLocation != null;

  void _initializeFields() {
    _campusName = snapshotData['campusName'] as String?;
    _campusLocation = snapshotData['campusLocation'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('churchLocations');

  static Stream<ChurchLocationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChurchLocationsRecord.fromSnapshot(s));

  static Future<ChurchLocationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChurchLocationsRecord.fromSnapshot(s));

  static ChurchLocationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChurchLocationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChurchLocationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChurchLocationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChurchLocationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChurchLocationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChurchLocationsRecordData({
  String? campusName,
  LatLng? campusLocation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'campusName': campusName,
      'campusLocation': campusLocation,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChurchLocationsRecordDocumentEquality
    implements Equality<ChurchLocationsRecord> {
  const ChurchLocationsRecordDocumentEquality();

  @override
  bool equals(ChurchLocationsRecord? e1, ChurchLocationsRecord? e2) {
    return e1?.campusName == e2?.campusName &&
        e1?.campusLocation == e2?.campusLocation;
  }

  @override
  int hash(ChurchLocationsRecord? e) =>
      const ListEquality().hash([e?.campusName, e?.campusLocation]);

  @override
  bool isValidKey(Object? o) => o is ChurchLocationsRecord;
}
