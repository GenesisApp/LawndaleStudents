import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoSeriesRecord extends FirestoreRecord {
  VideoSeriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "seriesName" field.
  String? _seriesName;
  String get seriesName => _seriesName ?? '';
  bool hasSeriesName() => _seriesName != null;

  // "seriesDescription" field.
  String? _seriesDescription;
  String get seriesDescription => _seriesDescription ?? '';
  bool hasSeriesDescription() => _seriesDescription != null;

  // "videosApartOfSeries" field.
  List<DocumentReference>? _videosApartOfSeries;
  List<DocumentReference> get videosApartOfSeries =>
      _videosApartOfSeries ?? const [];
  bool hasVideosApartOfSeries() => _videosApartOfSeries != null;

  // "seriesThumbnail" field.
  String? _seriesThumbnail;
  String get seriesThumbnail => _seriesThumbnail ?? '';
  bool hasSeriesThumbnail() => _seriesThumbnail != null;

  // "seriesStart" field.
  DateTime? _seriesStart;
  DateTime? get seriesStart => _seriesStart;
  bool hasSeriesStart() => _seriesStart != null;

  // "seriesEnd" field.
  DateTime? _seriesEnd;
  DateTime? get seriesEnd => _seriesEnd;
  bool hasSeriesEnd() => _seriesEnd != null;

  void _initializeFields() {
    _seriesName = snapshotData['seriesName'] as String?;
    _seriesDescription = snapshotData['seriesDescription'] as String?;
    _videosApartOfSeries = getDataList(snapshotData['videosApartOfSeries']);
    _seriesThumbnail = snapshotData['seriesThumbnail'] as String?;
    _seriesStart = snapshotData['seriesStart'] as DateTime?;
    _seriesEnd = snapshotData['seriesEnd'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('videoSeries');

  static Stream<VideoSeriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideoSeriesRecord.fromSnapshot(s));

  static Future<VideoSeriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideoSeriesRecord.fromSnapshot(s));

  static VideoSeriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VideoSeriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideoSeriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideoSeriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideoSeriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideoSeriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideoSeriesRecordData({
  String? seriesName,
  String? seriesDescription,
  String? seriesThumbnail,
  DateTime? seriesStart,
  DateTime? seriesEnd,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'seriesName': seriesName,
      'seriesDescription': seriesDescription,
      'seriesThumbnail': seriesThumbnail,
      'seriesStart': seriesStart,
      'seriesEnd': seriesEnd,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideoSeriesRecordDocumentEquality implements Equality<VideoSeriesRecord> {
  const VideoSeriesRecordDocumentEquality();

  @override
  bool equals(VideoSeriesRecord? e1, VideoSeriesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.seriesName == e2?.seriesName &&
        e1?.seriesDescription == e2?.seriesDescription &&
        listEquality.equals(e1?.videosApartOfSeries, e2?.videosApartOfSeries) &&
        e1?.seriesThumbnail == e2?.seriesThumbnail &&
        e1?.seriesStart == e2?.seriesStart &&
        e1?.seriesEnd == e2?.seriesEnd;
  }

  @override
  int hash(VideoSeriesRecord? e) => const ListEquality().hash([
        e?.seriesName,
        e?.seriesDescription,
        e?.videosApartOfSeries,
        e?.seriesThumbnail,
        e?.seriesStart,
        e?.seriesEnd
      ]);

  @override
  bool isValidKey(Object? o) => o is VideoSeriesRecord;
}
