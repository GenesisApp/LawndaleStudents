import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoreQuestionsRecord extends FirestoreRecord {
  CoreQuestionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "coreQuestionsActivated" field.
  bool? _coreQuestionsActivated;
  bool get coreQuestionsActivated => _coreQuestionsActivated ?? false;
  bool hasCoreQuestionsActivated() => _coreQuestionsActivated != null;

  void _initializeFields() {
    _coreQuestionsActivated = snapshotData['coreQuestionsActivated'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('coreQuestions');

  static Stream<CoreQuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoreQuestionsRecord.fromSnapshot(s));

  static Future<CoreQuestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoreQuestionsRecord.fromSnapshot(s));

  static CoreQuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoreQuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoreQuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoreQuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoreQuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoreQuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoreQuestionsRecordData({
  bool? coreQuestionsActivated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'coreQuestionsActivated': coreQuestionsActivated,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoreQuestionsRecordDocumentEquality
    implements Equality<CoreQuestionsRecord> {
  const CoreQuestionsRecordDocumentEquality();

  @override
  bool equals(CoreQuestionsRecord? e1, CoreQuestionsRecord? e2) {
    return e1?.coreQuestionsActivated == e2?.coreQuestionsActivated;
  }

  @override
  int hash(CoreQuestionsRecord? e) =>
      const ListEquality().hash([e?.coreQuestionsActivated]);

  @override
  bool isValidKey(Object? o) => o is CoreQuestionsRecord;
}
