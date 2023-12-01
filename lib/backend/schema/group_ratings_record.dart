import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupRatingsRecord extends FirestoreRecord {
  GroupRatingsRecord._(
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

  // "groupRatingNumber" field.
  int? _groupRatingNumber;
  int get groupRatingNumber => _groupRatingNumber ?? 0;
  bool hasGroupRatingNumber() => _groupRatingNumber != null;

  // "ratingNotes" field.
  String? _ratingNotes;
  String get ratingNotes => _ratingNotes ?? '';
  bool hasRatingNotes() => _ratingNotes != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _peopleinAttendance = getDataList(snapshotData['peopleinAttendance']);
    _groupReference = snapshotData['groupReference'] as DocumentReference?;
    _timeofAttendance = snapshotData['timeofAttendance'] as DateTime?;
    _attendanceNumber = castToType<int>(snapshotData['attendanceNumber']);
    _monthofAttendance = snapshotData['monthofAttendance'] as DateTime?;
    _groupRatingNumber = castToType<int>(snapshotData['groupRatingNumber']);
    _ratingNotes = snapshotData['ratingNotes'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('groupRatings')
          : FirebaseFirestore.instance.collectionGroup('groupRatings');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('groupRatings').doc();

  static Stream<GroupRatingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupRatingsRecord.fromSnapshot(s));

  static Future<GroupRatingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupRatingsRecord.fromSnapshot(s));

  static GroupRatingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GroupRatingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupRatingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupRatingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupRatingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupRatingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupRatingsRecordData({
  DocumentReference? groupReference,
  DateTime? timeofAttendance,
  int? attendanceNumber,
  DateTime? monthofAttendance,
  int? groupRatingNumber,
  String? ratingNotes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'groupReference': groupReference,
      'timeofAttendance': timeofAttendance,
      'attendanceNumber': attendanceNumber,
      'monthofAttendance': monthofAttendance,
      'groupRatingNumber': groupRatingNumber,
      'ratingNotes': ratingNotes,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupRatingsRecordDocumentEquality
    implements Equality<GroupRatingsRecord> {
  const GroupRatingsRecordDocumentEquality();

  @override
  bool equals(GroupRatingsRecord? e1, GroupRatingsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(
            e1?.peopleinAttendance, e2?.peopleinAttendance) &&
        e1?.groupReference == e2?.groupReference &&
        e1?.timeofAttendance == e2?.timeofAttendance &&
        e1?.attendanceNumber == e2?.attendanceNumber &&
        e1?.monthofAttendance == e2?.monthofAttendance &&
        e1?.groupRatingNumber == e2?.groupRatingNumber &&
        e1?.ratingNotes == e2?.ratingNotes;
  }

  @override
  int hash(GroupRatingsRecord? e) => const ListEquality().hash([
        e?.peopleinAttendance,
        e?.groupReference,
        e?.timeofAttendance,
        e?.attendanceNumber,
        e?.monthofAttendance,
        e?.groupRatingNumber,
        e?.ratingNotes
      ]);

  @override
  bool isValidKey(Object? o) => o is GroupRatingsRecord;
}
