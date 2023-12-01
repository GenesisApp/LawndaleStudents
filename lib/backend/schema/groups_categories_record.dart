import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupsCategoriesRecord extends FirestoreRecord {
  GroupsCategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "groupsinCategories" field.
  List<DocumentReference>? _groupsinCategories;
  List<DocumentReference> get groupsinCategories =>
      _groupsinCategories ?? const [];
  bool hasGroupsinCategories() => _groupsinCategories != null;

  // "nameofCategory" field.
  String? _nameofCategory;
  String get nameofCategory => _nameofCategory ?? '';
  bool hasNameofCategory() => _nameofCategory != null;

  void _initializeFields() {
    _groupsinCategories = getDataList(snapshotData['groupsinCategories']);
    _nameofCategory = snapshotData['nameofCategory'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('groupsCategories');

  static Stream<GroupsCategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupsCategoriesRecord.fromSnapshot(s));

  static Future<GroupsCategoriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GroupsCategoriesRecord.fromSnapshot(s));

  static GroupsCategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GroupsCategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupsCategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupsCategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupsCategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupsCategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupsCategoriesRecordData({
  String? nameofCategory,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nameofCategory': nameofCategory,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupsCategoriesRecordDocumentEquality
    implements Equality<GroupsCategoriesRecord> {
  const GroupsCategoriesRecordDocumentEquality();

  @override
  bool equals(GroupsCategoriesRecord? e1, GroupsCategoriesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(
            e1?.groupsinCategories, e2?.groupsinCategories) &&
        e1?.nameofCategory == e2?.nameofCategory;
  }

  @override
  int hash(GroupsCategoriesRecord? e) =>
      const ListEquality().hash([e?.groupsinCategories, e?.nameofCategory]);

  @override
  bool isValidKey(Object? o) => o is GroupsCategoriesRecord;
}
