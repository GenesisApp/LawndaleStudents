import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GivingTabRecord extends FirestoreRecord {
  GivingTabRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "givingURL" field.
  String? _givingURL;
  String get givingURL => _givingURL ?? '';
  bool hasGivingURL() => _givingURL != null;

  // "timesClicked" field.
  int? _timesClicked;
  int get timesClicked => _timesClicked ?? 0;
  bool hasTimesClicked() => _timesClicked != null;

  void _initializeFields() {
    _givingURL = snapshotData['givingURL'] as String?;
    _timesClicked = castToType<int>(snapshotData['timesClicked']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('givingTab');

  static Stream<GivingTabRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GivingTabRecord.fromSnapshot(s));

  static Future<GivingTabRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GivingTabRecord.fromSnapshot(s));

  static GivingTabRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GivingTabRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GivingTabRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GivingTabRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GivingTabRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GivingTabRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGivingTabRecordData({
  String? givingURL,
  int? timesClicked,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'givingURL': givingURL,
      'timesClicked': timesClicked,
    }.withoutNulls,
  );

  return firestoreData;
}

class GivingTabRecordDocumentEquality implements Equality<GivingTabRecord> {
  const GivingTabRecordDocumentEquality();

  @override
  bool equals(GivingTabRecord? e1, GivingTabRecord? e2) {
    return e1?.givingURL == e2?.givingURL &&
        e1?.timesClicked == e2?.timesClicked;
  }

  @override
  int hash(GivingTabRecord? e) =>
      const ListEquality().hash([e?.givingURL, e?.timesClicked]);

  @override
  bool isValidKey(Object? o) => o is GivingTabRecord;
}
