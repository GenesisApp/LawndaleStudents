import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportedConcernsRecord extends FirestoreRecord {
  ReportedConcernsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "submittedBy" field.
  DocumentReference? _submittedBy;
  DocumentReference? get submittedBy => _submittedBy;
  bool hasSubmittedBy() => _submittedBy != null;

  // "reportText" field.
  String? _reportText;
  String get reportText => _reportText ?? '';
  bool hasReportText() => _reportText != null;

  // "dateofConcern" field.
  DateTime? _dateofConcern;
  DateTime? get dateofConcern => _dateofConcern;
  bool hasDateofConcern() => _dateofConcern != null;

  void _initializeFields() {
    _submittedBy = snapshotData['submittedBy'] as DocumentReference?;
    _reportText = snapshotData['reportText'] as String?;
    _dateofConcern = snapshotData['dateofConcern'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reportedConcerns');

  static Stream<ReportedConcernsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportedConcernsRecord.fromSnapshot(s));

  static Future<ReportedConcernsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ReportedConcernsRecord.fromSnapshot(s));

  static ReportedConcernsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportedConcernsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportedConcernsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportedConcernsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportedConcernsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportedConcernsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportedConcernsRecordData({
  DocumentReference? submittedBy,
  String? reportText,
  DateTime? dateofConcern,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'submittedBy': submittedBy,
      'reportText': reportText,
      'dateofConcern': dateofConcern,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportedConcernsRecordDocumentEquality
    implements Equality<ReportedConcernsRecord> {
  const ReportedConcernsRecordDocumentEquality();

  @override
  bool equals(ReportedConcernsRecord? e1, ReportedConcernsRecord? e2) {
    return e1?.submittedBy == e2?.submittedBy &&
        e1?.reportText == e2?.reportText &&
        e1?.dateofConcern == e2?.dateofConcern;
  }

  @override
  int hash(ReportedConcernsRecord? e) => const ListEquality()
      .hash([e?.submittedBy, e?.reportText, e?.dateofConcern]);

  @override
  bool isValidKey(Object? o) => o is ReportedConcernsRecord;
}
