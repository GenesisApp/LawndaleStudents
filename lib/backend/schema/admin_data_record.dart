import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminDataRecord extends FirestoreRecord {
  AdminDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "day" field.
  int? _day;
  int get day => _day ?? 0;
  bool hasDay() => _day != null;

  // "times_completed" field.
  int? _timesCompleted;
  int get timesCompleted => _timesCompleted ?? 0;
  bool hasTimesCompleted() => _timesCompleted != null;

  // "currentDay" field.
  DateTime? _currentDay;
  DateTime? get currentDay => _currentDay;
  bool hasCurrentDay() => _currentDay != null;

  // "times_1Completed" field.
  int? _times1Completed;
  int get times1Completed => _times1Completed ?? 0;
  bool hasTimes1Completed() => _times1Completed != null;

  // "times_2Completed" field.
  int? _times2Completed;
  int get times2Completed => _times2Completed ?? 0;
  bool hasTimes2Completed() => _times2Completed != null;

  // "times_3Completed" field.
  int? _times3Completed;
  int get times3Completed => _times3Completed ?? 0;
  bool hasTimes3Completed() => _times3Completed != null;

  // "displayDay" field.
  int? _displayDay;
  int get displayDay => _displayDay ?? 0;
  bool hasDisplayDay() => _displayDay != null;

  void _initializeFields() {
    _day = castToType<int>(snapshotData['day']);
    _timesCompleted = castToType<int>(snapshotData['times_completed']);
    _currentDay = snapshotData['currentDay'] as DateTime?;
    _times1Completed = castToType<int>(snapshotData['times_1Completed']);
    _times2Completed = castToType<int>(snapshotData['times_2Completed']);
    _times3Completed = castToType<int>(snapshotData['times_3Completed']);
    _displayDay = castToType<int>(snapshotData['displayDay']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('admin_data');

  static Stream<AdminDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminDataRecord.fromSnapshot(s));

  static Future<AdminDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminDataRecord.fromSnapshot(s));

  static AdminDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdminDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminDataRecordData({
  int? day,
  int? timesCompleted,
  DateTime? currentDay,
  int? times1Completed,
  int? times2Completed,
  int? times3Completed,
  int? displayDay,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'day': day,
      'times_completed': timesCompleted,
      'currentDay': currentDay,
      'times_1Completed': times1Completed,
      'times_2Completed': times2Completed,
      'times_3Completed': times3Completed,
      'displayDay': displayDay,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdminDataRecordDocumentEquality implements Equality<AdminDataRecord> {
  const AdminDataRecordDocumentEquality();

  @override
  bool equals(AdminDataRecord? e1, AdminDataRecord? e2) {
    return e1?.day == e2?.day &&
        e1?.timesCompleted == e2?.timesCompleted &&
        e1?.currentDay == e2?.currentDay &&
        e1?.times1Completed == e2?.times1Completed &&
        e1?.times2Completed == e2?.times2Completed &&
        e1?.times3Completed == e2?.times3Completed &&
        e1?.displayDay == e2?.displayDay;
  }

  @override
  int hash(AdminDataRecord? e) => const ListEquality().hash([
        e?.day,
        e?.timesCompleted,
        e?.currentDay,
        e?.times1Completed,
        e?.times2Completed,
        e?.times3Completed,
        e?.displayDay
      ]);

  @override
  bool isValidKey(Object? o) => o is AdminDataRecord;
}
