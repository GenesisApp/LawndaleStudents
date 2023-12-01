import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendanceRecord extends FirestoreRecord {
  AttendanceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "peopleinAttendance" field.
  List<DocumentReference>? _peopleinAttendance;
  List<DocumentReference> get peopleinAttendance =>
      _peopleinAttendance ?? const [];
  bool hasPeopleinAttendance() => _peopleinAttendance != null;

  // "groupReference" field.
  DocumentReference? _groupReference;
  DocumentReference? get groupReference => _groupReference;
  bool hasGroupReference() => _groupReference != null;

  // "timeofAttendance" field.
  DateTime? _timeofAttendance;
  DateTime? get timeofAttendance => _timeofAttendance;
  bool hasTimeofAttendance() => _timeofAttendance != null;

  // "attendanceNumber" field.
  int? _attendanceNumber;
  int get attendanceNumber => _attendanceNumber ?? 0;
  bool hasAttendanceNumber() => _attendanceNumber != null;

  // "monthofAttendance" field.
  DateTime? _monthofAttendance;
  DateTime? get monthofAttendance => _monthofAttendance;
  bool hasMonthofAttendance() => _monthofAttendance != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _peopleinAttendance = getDataList(snapshotData['peopleinAttendance']);
    _groupReference = snapshotData['groupReference'] as DocumentReference?;
    _timeofAttendance = snapshotData['timeofAttendance'] as DateTime?;
    _attendanceNumber = castToType<int>(snapshotData['attendanceNumber']);
    _monthofAttendance = snapshotData['monthofAttendance'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('attendance')
          : FirebaseFirestore.instance.collectionGroup('attendance');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('attendance').doc();

  static Stream<AttendanceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttendanceRecord.fromSnapshot(s));

  static Future<AttendanceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttendanceRecord.fromSnapshot(s));

  static AttendanceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AttendanceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttendanceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttendanceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AttendanceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttendanceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttendanceRecordData({
  DocumentReference? groupReference,
  DateTime? timeofAttendance,
  int? attendanceNumber,
  DateTime? monthofAttendance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'groupReference': groupReference,
      'timeofAttendance': timeofAttendance,
      'attendanceNumber': attendanceNumber,
      'monthofAttendance': monthofAttendance,
    }.withoutNulls,
  );

  return firestoreData;
}

class AttendanceRecordDocumentEquality implements Equality<AttendanceRecord> {
  const AttendanceRecordDocumentEquality();

  @override
  bool equals(AttendanceRecord? e1, AttendanceRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(
            e1?.peopleinAttendance, e2?.peopleinAttendance) &&
        e1?.groupReference == e2?.groupReference &&
        e1?.timeofAttendance == e2?.timeofAttendance &&
        e1?.attendanceNumber == e2?.attendanceNumber &&
        e1?.monthofAttendance == e2?.monthofAttendance;
  }

  @override
  int hash(AttendanceRecord? e) => const ListEquality().hash([
        e?.peopleinAttendance,
        e?.groupReference,
        e?.timeofAttendance,
        e?.attendanceNumber,
        e?.monthofAttendance
      ]);

  @override
  bool isValidKey(Object? o) => o is AttendanceRecord;
}
