import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfileTagsRecord extends FirestoreRecord {
  ProfileTagsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tagName" field.
  String? _tagName;
  String get tagName => _tagName ?? '';
  bool hasTagName() => _tagName != null;

  // "usersWithTag" field.
  List<DocumentReference>? _usersWithTag;
  List<DocumentReference> get usersWithTag => _usersWithTag ?? const [];
  bool hasUsersWithTag() => _usersWithTag != null;

  // "tagDescription" field.
  String? _tagDescription;
  String get tagDescription => _tagDescription ?? '';
  bool hasTagDescription() => _tagDescription != null;

  // "dateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  void _initializeFields() {
    _tagName = snapshotData['tagName'] as String?;
    _usersWithTag = getDataList(snapshotData['usersWithTag']);
    _tagDescription = snapshotData['tagDescription'] as String?;
    _dateCreated = snapshotData['dateCreated'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('profile_tags');

  static Stream<ProfileTagsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProfileTagsRecord.fromSnapshot(s));

  static Future<ProfileTagsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProfileTagsRecord.fromSnapshot(s));

  static ProfileTagsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfileTagsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfileTagsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfileTagsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProfileTagsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfileTagsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfileTagsRecordData({
  String? tagName,
  String? tagDescription,
  DateTime? dateCreated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tagName': tagName,
      'tagDescription': tagDescription,
      'dateCreated': dateCreated,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProfileTagsRecordDocumentEquality implements Equality<ProfileTagsRecord> {
  const ProfileTagsRecordDocumentEquality();

  @override
  bool equals(ProfileTagsRecord? e1, ProfileTagsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.tagName == e2?.tagName &&
        listEquality.equals(e1?.usersWithTag, e2?.usersWithTag) &&
        e1?.tagDescription == e2?.tagDescription &&
        e1?.dateCreated == e2?.dateCreated;
  }

  @override
  int hash(ProfileTagsRecord? e) => const ListEquality()
      .hash([e?.tagName, e?.usersWithTag, e?.tagDescription, e?.dateCreated]);

  @override
  bool isValidKey(Object? o) => o is ProfileTagsRecord;
}
