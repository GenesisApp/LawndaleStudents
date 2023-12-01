import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GuidesRecord extends FirestoreRecord {
  GuidesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "time_completed" field.
  DateTime? _timeCompleted;
  DateTime? get timeCompleted => _timeCompleted;
  bool hasTimeCompleted() => _timeCompleted != null;

  // "time_uploaded" field.
  DateTime? _timeUploaded;
  DateTime? get timeUploaded => _timeUploaded;
  bool hasTimeUploaded() => _timeUploaded != null;

  // "imageThumbnail" field.
  String? _imageThumbnail;
  String get imageThumbnail => _imageThumbnail ?? '';
  bool hasImageThumbnail() => _imageThumbnail != null;

  // "videoName" field.
  String? _videoName;
  String get videoName => _videoName ?? '';
  bool hasVideoName() => _videoName != null;

  // "videoURL" field.
  String? _videoURL;
  String get videoURL => _videoURL ?? '';
  bool hasVideoURL() => _videoURL != null;

  // "messageDescription" field.
  String? _messageDescription;
  String get messageDescription => _messageDescription ?? '';
  bool hasMessageDescription() => _messageDescription != null;

  // "featuredMessage" field.
  bool? _featuredMessage;
  bool get featuredMessage => _featuredMessage ?? false;
  bool hasFeaturedMessage() => _featuredMessage != null;

  // "recommendedTalk" field.
  bool? _recommendedTalk;
  bool get recommendedTalk => _recommendedTalk ?? false;
  bool hasRecommendedTalk() => _recommendedTalk != null;

  // "recommendedDevotional" field.
  bool? _recommendedDevotional;
  bool get recommendedDevotional => _recommendedDevotional ?? false;
  bool hasRecommendedDevotional() => _recommendedDevotional != null;

  // "speaker" field.
  String? _speaker;
  String get speaker => _speaker ?? '';
  bool hasSpeaker() => _speaker != null;

  // "announcements" field.
  bool? _announcements;
  bool get announcements => _announcements ?? false;
  bool hasAnnouncements() => _announcements != null;

  // "users_watched" field.
  List<DocumentReference>? _usersWatched;
  List<DocumentReference> get usersWatched => _usersWatched ?? const [];
  bool hasUsersWatched() => _usersWatched != null;

  // "journalResponses" field.
  DocumentReference? _journalResponses;
  DocumentReference? get journalResponses => _journalResponses;
  bool hasJournalResponses() => _journalResponses != null;

  // "messageNotes" field.
  String? _messageNotes;
  String get messageNotes => _messageNotes ?? '';
  bool hasMessageNotes() => _messageNotes != null;

  // "timeEdited" field.
  DateTime? _timeEdited;
  DateTime? get timeEdited => _timeEdited;
  bool hasTimeEdited() => _timeEdited != null;

  // "timeofRecording" field.
  String? _timeofRecording;
  String get timeofRecording => _timeofRecording ?? '';
  bool hasTimeofRecording() => _timeofRecording != null;

  // "videoLength" field.
  String? _videoLength;
  String get videoLength => _videoLength ?? '';
  bool hasVideoLength() => _videoLength != null;

  // "registrationLink" field.
  String? _registrationLink;
  String get registrationLink => _registrationLink ?? '';
  bool hasRegistrationLink() => _registrationLink != null;

  // "tagToAdd" field.
  DocumentReference? _tagToAdd;
  DocumentReference? get tagToAdd => _tagToAdd;
  bool hasTagToAdd() => _tagToAdd != null;

  // "group" field.
  bool? _group;
  bool get group => _group ?? false;
  bool hasGroup() => _group != null;

  // "event" field.
  bool? _event;
  bool get event => _event ?? false;
  bool hasEvent() => _event != null;

  // "guide" field.
  bool? _guide;
  bool get guide => _guide ?? false;
  bool hasGuide() => _guide != null;

  // "Groups" field.
  bool? _groups;
  bool get groups => _groups ?? false;
  bool hasGroups() => _groups != null;

  // "PDFs" field.
  bool? _pDFs;
  bool get pDFs => _pDFs ?? false;
  bool hasPDFs() => _pDFs != null;

  void _initializeFields() {
    _timeCompleted = snapshotData['time_completed'] as DateTime?;
    _timeUploaded = snapshotData['time_uploaded'] as DateTime?;
    _imageThumbnail = snapshotData['imageThumbnail'] as String?;
    _videoName = snapshotData['videoName'] as String?;
    _videoURL = snapshotData['videoURL'] as String?;
    _messageDescription = snapshotData['messageDescription'] as String?;
    _featuredMessage = snapshotData['featuredMessage'] as bool?;
    _recommendedTalk = snapshotData['recommendedTalk'] as bool?;
    _recommendedDevotional = snapshotData['recommendedDevotional'] as bool?;
    _speaker = snapshotData['speaker'] as String?;
    _announcements = snapshotData['announcements'] as bool?;
    _usersWatched = getDataList(snapshotData['users_watched']);
    _journalResponses = snapshotData['journalResponses'] as DocumentReference?;
    _messageNotes = snapshotData['messageNotes'] as String?;
    _timeEdited = snapshotData['timeEdited'] as DateTime?;
    _timeofRecording = snapshotData['timeofRecording'] as String?;
    _videoLength = snapshotData['videoLength'] as String?;
    _registrationLink = snapshotData['registrationLink'] as String?;
    _tagToAdd = snapshotData['tagToAdd'] as DocumentReference?;
    _group = snapshotData['group'] as bool?;
    _event = snapshotData['event'] as bool?;
    _guide = snapshotData['guide'] as bool?;
    _groups = snapshotData['Groups'] as bool?;
    _pDFs = snapshotData['PDFs'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('guides');

  static Stream<GuidesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GuidesRecord.fromSnapshot(s));

  static Future<GuidesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GuidesRecord.fromSnapshot(s));

  static GuidesRecord fromSnapshot(DocumentSnapshot snapshot) => GuidesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GuidesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GuidesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GuidesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GuidesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGuidesRecordData({
  DateTime? timeCompleted,
  DateTime? timeUploaded,
  String? imageThumbnail,
  String? videoName,
  String? videoURL,
  String? messageDescription,
  bool? featuredMessage,
  bool? recommendedTalk,
  bool? recommendedDevotional,
  String? speaker,
  bool? announcements,
  DocumentReference? journalResponses,
  String? messageNotes,
  DateTime? timeEdited,
  String? timeofRecording,
  String? videoLength,
  String? registrationLink,
  DocumentReference? tagToAdd,
  bool? group,
  bool? event,
  bool? guide,
  bool? groups,
  bool? pDFs,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time_completed': timeCompleted,
      'time_uploaded': timeUploaded,
      'imageThumbnail': imageThumbnail,
      'videoName': videoName,
      'videoURL': videoURL,
      'messageDescription': messageDescription,
      'featuredMessage': featuredMessage,
      'recommendedTalk': recommendedTalk,
      'recommendedDevotional': recommendedDevotional,
      'speaker': speaker,
      'announcements': announcements,
      'journalResponses': journalResponses,
      'messageNotes': messageNotes,
      'timeEdited': timeEdited,
      'timeofRecording': timeofRecording,
      'videoLength': videoLength,
      'registrationLink': registrationLink,
      'tagToAdd': tagToAdd,
      'group': group,
      'event': event,
      'guide': guide,
      'Groups': groups,
      'PDFs': pDFs,
    }.withoutNulls,
  );

  return firestoreData;
}

class GuidesRecordDocumentEquality implements Equality<GuidesRecord> {
  const GuidesRecordDocumentEquality();

  @override
  bool equals(GuidesRecord? e1, GuidesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.timeCompleted == e2?.timeCompleted &&
        e1?.timeUploaded == e2?.timeUploaded &&
        e1?.imageThumbnail == e2?.imageThumbnail &&
        e1?.videoName == e2?.videoName &&
        e1?.videoURL == e2?.videoURL &&
        e1?.messageDescription == e2?.messageDescription &&
        e1?.featuredMessage == e2?.featuredMessage &&
        e1?.recommendedTalk == e2?.recommendedTalk &&
        e1?.recommendedDevotional == e2?.recommendedDevotional &&
        e1?.speaker == e2?.speaker &&
        e1?.announcements == e2?.announcements &&
        listEquality.equals(e1?.usersWatched, e2?.usersWatched) &&
        e1?.journalResponses == e2?.journalResponses &&
        e1?.messageNotes == e2?.messageNotes &&
        e1?.timeEdited == e2?.timeEdited &&
        e1?.timeofRecording == e2?.timeofRecording &&
        e1?.videoLength == e2?.videoLength &&
        e1?.registrationLink == e2?.registrationLink &&
        e1?.tagToAdd == e2?.tagToAdd &&
        e1?.group == e2?.group &&
        e1?.event == e2?.event &&
        e1?.guide == e2?.guide &&
        e1?.groups == e2?.groups &&
        e1?.pDFs == e2?.pDFs;
  }

  @override
  int hash(GuidesRecord? e) => const ListEquality().hash([
        e?.timeCompleted,
        e?.timeUploaded,
        e?.imageThumbnail,
        e?.videoName,
        e?.videoURL,
        e?.messageDescription,
        e?.featuredMessage,
        e?.recommendedTalk,
        e?.recommendedDevotional,
        e?.speaker,
        e?.announcements,
        e?.usersWatched,
        e?.journalResponses,
        e?.messageNotes,
        e?.timeEdited,
        e?.timeofRecording,
        e?.videoLength,
        e?.registrationLink,
        e?.tagToAdd,
        e?.group,
        e?.event,
        e?.guide,
        e?.groups,
        e?.pDFs
      ]);

  @override
  bool isValidKey(Object? o) => o is GuidesRecord;
}
