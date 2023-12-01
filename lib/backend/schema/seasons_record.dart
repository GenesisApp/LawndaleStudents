import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SeasonsRecord extends FirestoreRecord {
  SeasonsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "season_name" field.
  String? _seasonName;
  String get seasonName => _seasonName ?? '';
  bool hasSeasonName() => _seasonName != null;

  // "season_description" field.
  String? _seasonDescription;
  String get seasonDescription => _seasonDescription ?? '';
  bool hasSeasonDescription() => _seasonDescription != null;

  // "season_users" field.
  List<DocumentReference>? _seasonUsers;
  List<DocumentReference> get seasonUsers => _seasonUsers ?? const [];
  bool hasSeasonUsers() => _seasonUsers != null;

  // "season_image" field.
  String? _seasonImage;
  String get seasonImage => _seasonImage ?? '';
  bool hasSeasonImage() => _seasonImage != null;

  // "season1" field.
  bool? _season1;
  bool get season1 => _season1 ?? false;
  bool hasSeason1() => _season1 != null;

  // "season2" field.
  bool? _season2;
  bool get season2 => _season2 ?? false;
  bool hasSeason2() => _season2 != null;

  // "season3" field.
  bool? _season3;
  bool get season3 => _season3 ?? false;
  bool hasSeason3() => _season3 != null;

  // "season4" field.
  bool? _season4;
  bool get season4 => _season4 ?? false;
  bool hasSeason4() => _season4 != null;

  // "season5" field.
  bool? _season5;
  bool get season5 => _season5 ?? false;
  bool hasSeason5() => _season5 != null;

  // "season_imageDM" field.
  String? _seasonImageDM;
  String get seasonImageDM => _seasonImageDM ?? '';
  bool hasSeasonImageDM() => _seasonImageDM != null;

  // "verse" field.
  String? _verse;
  String get verse => _verse ?? '';
  bool hasVerse() => _verse != null;

  // "verseReference" field.
  String? _verseReference;
  String get verseReference => _verseReference ?? '';
  bool hasVerseReference() => _verseReference != null;

  // "customSeason" field.
  bool? _customSeason;
  bool get customSeason => _customSeason ?? false;
  bool hasCustomSeason() => _customSeason != null;

  void _initializeFields() {
    _seasonName = snapshotData['season_name'] as String?;
    _seasonDescription = snapshotData['season_description'] as String?;
    _seasonUsers = getDataList(snapshotData['season_users']);
    _seasonImage = snapshotData['season_image'] as String?;
    _season1 = snapshotData['season1'] as bool?;
    _season2 = snapshotData['season2'] as bool?;
    _season3 = snapshotData['season3'] as bool?;
    _season4 = snapshotData['season4'] as bool?;
    _season5 = snapshotData['season5'] as bool?;
    _seasonImageDM = snapshotData['season_imageDM'] as String?;
    _verse = snapshotData['verse'] as String?;
    _verseReference = snapshotData['verseReference'] as String?;
    _customSeason = snapshotData['customSeason'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Seasons');

  static Stream<SeasonsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SeasonsRecord.fromSnapshot(s));

  static Future<SeasonsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SeasonsRecord.fromSnapshot(s));

  static SeasonsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SeasonsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SeasonsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SeasonsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SeasonsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SeasonsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSeasonsRecordData({
  String? seasonName,
  String? seasonDescription,
  String? seasonImage,
  bool? season1,
  bool? season2,
  bool? season3,
  bool? season4,
  bool? season5,
  String? seasonImageDM,
  String? verse,
  String? verseReference,
  bool? customSeason,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'season_name': seasonName,
      'season_description': seasonDescription,
      'season_image': seasonImage,
      'season1': season1,
      'season2': season2,
      'season3': season3,
      'season4': season4,
      'season5': season5,
      'season_imageDM': seasonImageDM,
      'verse': verse,
      'verseReference': verseReference,
      'customSeason': customSeason,
    }.withoutNulls,
  );

  return firestoreData;
}

class SeasonsRecordDocumentEquality implements Equality<SeasonsRecord> {
  const SeasonsRecordDocumentEquality();

  @override
  bool equals(SeasonsRecord? e1, SeasonsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.seasonName == e2?.seasonName &&
        e1?.seasonDescription == e2?.seasonDescription &&
        listEquality.equals(e1?.seasonUsers, e2?.seasonUsers) &&
        e1?.seasonImage == e2?.seasonImage &&
        e1?.season1 == e2?.season1 &&
        e1?.season2 == e2?.season2 &&
        e1?.season3 == e2?.season3 &&
        e1?.season4 == e2?.season4 &&
        e1?.season5 == e2?.season5 &&
        e1?.seasonImageDM == e2?.seasonImageDM &&
        e1?.verse == e2?.verse &&
        e1?.verseReference == e2?.verseReference &&
        e1?.customSeason == e2?.customSeason;
  }

  @override
  int hash(SeasonsRecord? e) => const ListEquality().hash([
        e?.seasonName,
        e?.seasonDescription,
        e?.seasonUsers,
        e?.seasonImage,
        e?.season1,
        e?.season2,
        e?.season3,
        e?.season4,
        e?.season5,
        e?.seasonImageDM,
        e?.verse,
        e?.verseReference,
        e?.customSeason
      ]);

  @override
  bool isValidKey(Object? o) => o is SeasonsRecord;
}
