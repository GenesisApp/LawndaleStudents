import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JournalRepliesRecord extends FirestoreRecord {
  JournalRepliesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "journalRepliedto" field.
  DocumentReference? _journalRepliedto;
  DocumentReference? get journalRepliedto => _journalRepliedto;
  bool hasJournalRepliedto() => _journalRepliedto != null;

  // "personReplying" field.
  DocumentReference? _personReplying;
  DocumentReference? get personReplying => _personReplying;
  bool hasPersonReplying() => _personReplying != null;

  // "responseText" field.
  String? _responseText;
  String get responseText => _responseText ?? '';
  bool hasResponseText() => _responseText != null;

  // "likedbyOthers" field.
  List<DocumentReference>? _likedbyOthers;
  List<DocumentReference> get likedbyOthers => _likedbyOthers ?? const [];
  bool hasLikedbyOthers() => _likedbyOthers != null;

  // "likedbyUser" field.
  bool? _likedbyUser;
  bool get likedbyUser => _likedbyUser ?? false;
  bool hasLikedbyUser() => _likedbyUser != null;

  // "timeSent" field.
  DateTime? _timeSent;
  DateTime? get timeSent => _timeSent;
  bool hasTimeSent() => _timeSent != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _journalRepliedto = snapshotData['journalRepliedto'] as DocumentReference?;
    _personReplying = snapshotData['personReplying'] as DocumentReference?;
    _responseText = snapshotData['responseText'] as String?;
    _likedbyOthers = getDataList(snapshotData['likedbyOthers']);
    _likedbyUser = snapshotData['likedbyUser'] as bool?;
    _timeSent = snapshotData['timeSent'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('journalReplies')
          : FirebaseFirestore.instance.collectionGroup('journalReplies');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('journalReplies').doc();

  static Stream<JournalRepliesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JournalRepliesRecord.fromSnapshot(s));

  static Future<JournalRepliesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JournalRepliesRecord.fromSnapshot(s));

  static JournalRepliesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      JournalRepliesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JournalRepliesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JournalRepliesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JournalRepliesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JournalRepliesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJournalRepliesRecordData({
  DocumentReference? journalRepliedto,
  DocumentReference? personReplying,
  String? responseText,
  bool? likedbyUser,
  DateTime? timeSent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'journalRepliedto': journalRepliedto,
      'personReplying': personReplying,
      'responseText': responseText,
      'likedbyUser': likedbyUser,
      'timeSent': timeSent,
    }.withoutNulls,
  );

  return firestoreData;
}

class JournalRepliesRecordDocumentEquality
    implements Equality<JournalRepliesRecord> {
  const JournalRepliesRecordDocumentEquality();

  @override
  bool equals(JournalRepliesRecord? e1, JournalRepliesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.journalRepliedto == e2?.journalRepliedto &&
        e1?.personReplying == e2?.personReplying &&
        e1?.responseText == e2?.responseText &&
        listEquality.equals(e1?.likedbyOthers, e2?.likedbyOthers) &&
        e1?.likedbyUser == e2?.likedbyUser &&
        e1?.timeSent == e2?.timeSent;
  }

  @override
  int hash(JournalRepliesRecord? e) => const ListEquality().hash([
        e?.journalRepliedto,
        e?.personReplying,
        e?.responseText,
        e?.likedbyOthers,
        e?.likedbyUser,
        e?.timeSent
      ]);

  @override
  bool isValidKey(Object? o) => o is JournalRepliesRecord;
}
