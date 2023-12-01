import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GlobalGroupsDataRecord extends FirestoreRecord {
  GlobalGroupsDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "totalAttendancefortheDay" field.
  int? _totalAttendancefortheDay;
  int get totalAttendancefortheDay => _totalAttendancefortheDay ?? 0;
  bool hasTotalAttendancefortheDay() => _totalAttendancefortheDay != null;

  // "dayInteger" field.
  int? _dayInteger;
  int get dayInteger => _dayInteger ?? 0;
  bool hasDayInteger() => _dayInteger != null;

  // "currentDay" field.
  DateTime? _currentDay;
  DateTime? get currentDay => _currentDay;
  bool hasCurrentDay() => _currentDay != null;

  // "closedGroups" field.
  int? _closedGroups;
  int get closedGroups => _closedGroups ?? 0;
  bool hasClosedGroups() => _closedGroups != null;

  // "openGroups" field.
  int? _openGroups;
  int get openGroups => _openGroups ?? 0;
  bool hasOpenGroups() => _openGroups != null;

  // "archivedGroups" field.
  int? _archivedGroups;
  int get archivedGroups => _archivedGroups ?? 0;
  bool hasArchivedGroups() => _archivedGroups != null;

  // "activeGroups" field.
  int? _activeGroups;
  int get activeGroups => _activeGroups ?? 0;
  bool hasActiveGroups() => _activeGroups != null;

  // "peopleAdded" field.
  int? _peopleAdded;
  int get peopleAdded => _peopleAdded ?? 0;
  bool hasPeopleAdded() => _peopleAdded != null;

  // "peopleRemoved" field.
  int? _peopleRemoved;
  int get peopleRemoved => _peopleRemoved ?? 0;
  bool hasPeopleRemoved() => _peopleRemoved != null;

  // "displayDay" field.
  int? _displayDay;
  int get displayDay => _displayDay ?? 0;
  bool hasDisplayDay() => _displayDay != null;

  void _initializeFields() {
    _totalAttendancefortheDay =
        castToType<int>(snapshotData['totalAttendancefortheDay']);
    _dayInteger = castToType<int>(snapshotData['dayInteger']);
    _currentDay = snapshotData['currentDay'] as DateTime?;
    _closedGroups = castToType<int>(snapshotData['closedGroups']);
    _openGroups = castToType<int>(snapshotData['openGroups']);
    _archivedGroups = castToType<int>(snapshotData['archivedGroups']);
    _activeGroups = castToType<int>(snapshotData['activeGroups']);
    _peopleAdded = castToType<int>(snapshotData['peopleAdded']);
    _peopleRemoved = castToType<int>(snapshotData['peopleRemoved']);
    _displayDay = castToType<int>(snapshotData['displayDay']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('globalGroupsData');

  static Stream<GlobalGroupsDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GlobalGroupsDataRecord.fromSnapshot(s));

  static Future<GlobalGroupsDataRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GlobalGroupsDataRecord.fromSnapshot(s));

  static GlobalGroupsDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GlobalGroupsDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GlobalGroupsDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GlobalGroupsDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GlobalGroupsDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GlobalGroupsDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGlobalGroupsDataRecordData({
  int? totalAttendancefortheDay,
  int? dayInteger,
  DateTime? currentDay,
  int? closedGroups,
  int? openGroups,
  int? archivedGroups,
  int? activeGroups,
  int? peopleAdded,
  int? peopleRemoved,
  int? displayDay,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'totalAttendancefortheDay': totalAttendancefortheDay,
      'dayInteger': dayInteger,
      'currentDay': currentDay,
      'closedGroups': closedGroups,
      'openGroups': openGroups,
      'archivedGroups': archivedGroups,
      'activeGroups': activeGroups,
      'peopleAdded': peopleAdded,
      'peopleRemoved': peopleRemoved,
      'displayDay': displayDay,
    }.withoutNulls,
  );

  return firestoreData;
}

class GlobalGroupsDataRecordDocumentEquality
    implements Equality<GlobalGroupsDataRecord> {
  const GlobalGroupsDataRecordDocumentEquality();

  @override
  bool equals(GlobalGroupsDataRecord? e1, GlobalGroupsDataRecord? e2) {
    return e1?.totalAttendancefortheDay == e2?.totalAttendancefortheDay &&
        e1?.dayInteger == e2?.dayInteger &&
        e1?.currentDay == e2?.currentDay &&
        e1?.closedGroups == e2?.closedGroups &&
        e1?.openGroups == e2?.openGroups &&
        e1?.archivedGroups == e2?.archivedGroups &&
        e1?.activeGroups == e2?.activeGroups &&
        e1?.peopleAdded == e2?.peopleAdded &&
        e1?.peopleRemoved == e2?.peopleRemoved &&
        e1?.displayDay == e2?.displayDay;
  }

  @override
  int hash(GlobalGroupsDataRecord? e) => const ListEquality().hash([
        e?.totalAttendancefortheDay,
        e?.dayInteger,
        e?.currentDay,
        e?.closedGroups,
        e?.openGroups,
        e?.archivedGroups,
        e?.activeGroups,
        e?.peopleAdded,
        e?.peopleRemoved,
        e?.displayDay
      ]);

  @override
  bool isValidKey(Object? o) => o is GlobalGroupsDataRecord;
}
