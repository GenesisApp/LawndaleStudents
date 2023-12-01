import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GlobalGroupRatingsRecord extends FirestoreRecord {
  GlobalGroupRatingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "groupRatingNumber" field.
  int? _groupRatingNumber;
  int get groupRatingNumber => _groupRatingNumber ?? 0;
  bool hasGroupRatingNumber() => _groupRatingNumber != null;

  // "groupRated" field.
  DocumentReference? _groupRated;
  DocumentReference? get groupRated => _groupRated;
  bool hasGroupRated() => _groupRated != null;

  // "personSubmittedBy" field.
  DocumentReference? _personSubmittedBy;
  DocumentReference? get personSubmittedBy => _personSubmittedBy;
  bool hasPersonSubmittedBy() => _personSubmittedBy != null;

  void _initializeFields() {
    _groupRatingNumber = castToType<int>(snapshotData['groupRatingNumber']);
    _groupRated = snapshotData['groupRated'] as DocumentReference?;
    _personSubmittedBy =
        snapshotData['personSubmittedBy'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('globalGroupRatings');

  static Stream<GlobalGroupRatingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GlobalGroupRatingsRecord.fromSnapshot(s));

  static Future<GlobalGroupRatingsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GlobalGroupRatingsRecord.fromSnapshot(s));

  static GlobalGroupRatingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GlobalGroupRatingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GlobalGroupRatingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GlobalGroupRatingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GlobalGroupRatingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GlobalGroupRatingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGlobalGroupRatingsRecordData({
  int? groupRatingNumber,
  DocumentReference? groupRated,
  DocumentReference? personSubmittedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'groupRatingNumber': groupRatingNumber,
      'groupRated': groupRated,
      'personSubmittedBy': personSubmittedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class GlobalGroupRatingsRecordDocumentEquality
    implements Equality<GlobalGroupRatingsRecord> {
  const GlobalGroupRatingsRecordDocumentEquality();

  @override
  bool equals(GlobalGroupRatingsRecord? e1, GlobalGroupRatingsRecord? e2) {
    return e1?.groupRatingNumber == e2?.groupRatingNumber &&
        e1?.groupRated == e2?.groupRated &&
        e1?.personSubmittedBy == e2?.personSubmittedBy;
  }

  @override
  int hash(GlobalGroupRatingsRecord? e) => const ListEquality()
      .hash([e?.groupRatingNumber, e?.groupRated, e?.personSubmittedBy]);

  @override
  bool isValidKey(Object? o) => o is GlobalGroupRatingsRecord;
}
