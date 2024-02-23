import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GuestsRecord extends FirestoreRecord {
  GuestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "guestName" field.
  String? _guestName;
  String get guestName => _guestName ?? '';
  bool hasGuestName() => _guestName != null;

  // "guestPhoneNumber" field.
  String? _guestPhoneNumber;
  String get guestPhoneNumber => _guestPhoneNumber ?? '';
  bool hasGuestPhoneNumber() => _guestPhoneNumber != null;

  // "guestAge" field.
  int? _guestAge;
  int get guestAge => _guestAge ?? 0;
  bool hasGuestAge() => _guestAge != null;

  // "groupReference" field.
  DocumentReference? _groupReference;
  DocumentReference? get groupReference => _groupReference;
  bool hasGroupReference() => _groupReference != null;

  // "lastAttendance" field.
  DateTime? _lastAttendance;
  DateTime? get lastAttendance => _lastAttendance;
  bool hasLastAttendance() => _lastAttendance != null;

  // "dateCheckedinGroup" field.
  DateTime? _dateCheckedinGroup;
  DateTime? get dateCheckedinGroup => _dateCheckedinGroup;
  bool hasDateCheckedinGroup() => _dateCheckedinGroup != null;

  // "newGuest" field.
  bool? _newGuest;
  bool get newGuest => _newGuest ?? false;
  bool hasNewGuest() => _newGuest != null;

  void _initializeFields() {
    _guestName = snapshotData['guestName'] as String?;
    _guestPhoneNumber = snapshotData['guestPhoneNumber'] as String?;
    _guestAge = castToType<int>(snapshotData['guestAge']);
    _groupReference = snapshotData['groupReference'] as DocumentReference?;
    _lastAttendance = snapshotData['lastAttendance'] as DateTime?;
    _dateCheckedinGroup = snapshotData['dateCheckedinGroup'] as DateTime?;
    _newGuest = snapshotData['newGuest'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Guests');

  static Stream<GuestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GuestsRecord.fromSnapshot(s));

  static Future<GuestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GuestsRecord.fromSnapshot(s));

  static GuestsRecord fromSnapshot(DocumentSnapshot snapshot) => GuestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GuestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GuestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GuestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GuestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGuestsRecordData({
  String? guestName,
  String? guestPhoneNumber,
  int? guestAge,
  DocumentReference? groupReference,
  DateTime? lastAttendance,
  DateTime? dateCheckedinGroup,
  bool? newGuest,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'guestName': guestName,
      'guestPhoneNumber': guestPhoneNumber,
      'guestAge': guestAge,
      'groupReference': groupReference,
      'lastAttendance': lastAttendance,
      'dateCheckedinGroup': dateCheckedinGroup,
      'newGuest': newGuest,
    }.withoutNulls,
  );

  return firestoreData;
}

class GuestsRecordDocumentEquality implements Equality<GuestsRecord> {
  const GuestsRecordDocumentEquality();

  @override
  bool equals(GuestsRecord? e1, GuestsRecord? e2) {
    return e1?.guestName == e2?.guestName &&
        e1?.guestPhoneNumber == e2?.guestPhoneNumber &&
        e1?.guestAge == e2?.guestAge &&
        e1?.groupReference == e2?.groupReference &&
        e1?.lastAttendance == e2?.lastAttendance &&
        e1?.dateCheckedinGroup == e2?.dateCheckedinGroup &&
        e1?.newGuest == e2?.newGuest;
  }

  @override
  int hash(GuestsRecord? e) => const ListEquality().hash([
        e?.guestName,
        e?.guestPhoneNumber,
        e?.guestAge,
        e?.groupReference,
        e?.lastAttendance,
        e?.dateCheckedinGroup,
        e?.newGuest
      ]);

  @override
  bool isValidKey(Object? o) => o is GuestsRecord;
}
