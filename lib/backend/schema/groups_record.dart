import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupsRecord extends FirestoreRecord {
  GroupsRecord._(
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

  // "members" field.
  List<DocumentReference>? _members;
  List<DocumentReference> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  // "openGroup" field.
  bool? _openGroup;
  bool get openGroup => _openGroup ?? false;
  bool hasOpenGroup() => _openGroup != null;

  // "closedGroup" field.
  bool? _closedGroup;
  bool get closedGroup => _closedGroup ?? false;
  bool hasClosedGroup() => _closedGroup != null;

  // "groupLeaderName" field.
  String? _groupLeaderName;
  String get groupLeaderName => _groupLeaderName ?? '';
  bool hasGroupLeaderName() => _groupLeaderName != null;

  // "invitationReceivedByLeader" field.
  List<DocumentReference>? _invitationReceivedByLeader;
  List<DocumentReference> get invitationReceivedByLeader =>
      _invitationReceivedByLeader ?? const [];
  bool hasInvitationReceivedByLeader() => _invitationReceivedByLeader != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "inactive" field.
  bool? _inactive;
  bool get inactive => _inactive ?? false;
  bool hasInactive() => _inactive != null;

  // "meetingDay" field.
  String? _meetingDay;
  String get meetingDay => _meetingDay ?? '';
  bool hasMeetingDay() => _meetingDay != null;

  // "meetingPlace" field.
  String? _meetingPlace;
  String get meetingPlace => _meetingPlace ?? '';
  bool hasMeetingPlace() => _meetingPlace != null;

  // "targetAudience" field.
  String? _targetAudience;
  String get targetAudience => _targetAudience ?? '';
  bool hasTargetAudience() => _targetAudience != null;

  // "targetGender" field.
  String? _targetGender;
  String get targetGender => _targetGender ?? '';
  bool hasTargetGender() => _targetGender != null;

  // "totalWeeksMet" field.
  int? _totalWeeksMet;
  int get totalWeeksMet => _totalWeeksMet ?? 0;
  bool hasTotalWeeksMet() => _totalWeeksMet != null;

  // "numberofMembers" field.
  int? _numberofMembers;
  int get numberofMembers => _numberofMembers ?? 0;
  bool hasNumberofMembers() => _numberofMembers != null;

  // "numberofRatings" field.
  int? _numberofRatings;
  int get numberofRatings => _numberofRatings ?? 0;
  bool hasNumberofRatings() => _numberofRatings != null;

  // "meetingTime" field.
  String? _meetingTime;
  String get meetingTime => _meetingTime ?? '';
  bool hasMeetingTime() => _meetingTime != null;

  // "targetAge" field.
  String? _targetAge;
  String get targetAge => _targetAge ?? '';
  bool hasTargetAge() => _targetAge != null;

  // "groupCategory" field.
  String? _groupCategory;
  String get groupCategory => _groupCategory ?? '';
  bool hasGroupCategory() => _groupCategory != null;

  // "groupLeaders" field.
  List<DocumentReference>? _groupLeaders;
  List<DocumentReference> get groupLeaders => _groupLeaders ?? const [];
  bool hasGroupLeaders() => _groupLeaders != null;

  // "numberofMembersAdded" field.
  int? _numberofMembersAdded;
  int get numberofMembersAdded => _numberofMembersAdded ?? 0;
  bool hasNumberofMembersAdded() => _numberofMembersAdded != null;

  // "numberofMembersRemoved" field.
  int? _numberofMembersRemoved;
  int get numberofMembersRemoved => _numberofMembersRemoved ?? 0;
  bool hasNumberofMembersRemoved() => _numberofMembersRemoved != null;

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
    _members = getDataList(snapshotData['members']);
    _openGroup = snapshotData['openGroup'] as bool?;
    _closedGroup = snapshotData['closedGroup'] as bool?;
    _groupLeaderName = snapshotData['groupLeaderName'] as String?;
    _invitationReceivedByLeader =
        getDataList(snapshotData['invitationReceivedByLeader']);
    _active = snapshotData['active'] as bool?;
    _inactive = snapshotData['inactive'] as bool?;
    _meetingDay = snapshotData['meetingDay'] as String?;
    _meetingPlace = snapshotData['meetingPlace'] as String?;
    _targetAudience = snapshotData['targetAudience'] as String?;
    _targetGender = snapshotData['targetGender'] as String?;
    _totalWeeksMet = castToType<int>(snapshotData['totalWeeksMet']);
    _numberofMembers = castToType<int>(snapshotData['numberofMembers']);
    _numberofRatings = castToType<int>(snapshotData['numberofRatings']);
    _meetingTime = snapshotData['meetingTime'] as String?;
    _targetAge = snapshotData['targetAge'] as String?;
    _groupCategory = snapshotData['groupCategory'] as String?;
    _groupLeaders = getDataList(snapshotData['groupLeaders']);
    _numberofMembersAdded =
        castToType<int>(snapshotData['numberofMembersAdded']);
    _numberofMembersRemoved =
        castToType<int>(snapshotData['numberofMembersRemoved']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('groups');

  static Stream<GroupsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupsRecord.fromSnapshot(s));

  static Future<GroupsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupsRecord.fromSnapshot(s));

  static GroupsRecord fromSnapshot(DocumentSnapshot snapshot) => GroupsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupsRecordData({
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
  bool? openGroup,
  bool? closedGroup,
  String? groupLeaderName,
  bool? active,
  bool? inactive,
  String? meetingDay,
  String? meetingPlace,
  String? targetAudience,
  String? targetGender,
  int? totalWeeksMet,
  int? numberofMembers,
  int? numberofRatings,
  String? meetingTime,
  String? targetAge,
  String? groupCategory,
  int? numberofMembersAdded,
  int? numberofMembersRemoved,
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
      'openGroup': openGroup,
      'closedGroup': closedGroup,
      'groupLeaderName': groupLeaderName,
      'active': active,
      'inactive': inactive,
      'meetingDay': meetingDay,
      'meetingPlace': meetingPlace,
      'targetAudience': targetAudience,
      'targetGender': targetGender,
      'totalWeeksMet': totalWeeksMet,
      'numberofMembers': numberofMembers,
      'numberofRatings': numberofRatings,
      'meetingTime': meetingTime,
      'targetAge': targetAge,
      'groupCategory': groupCategory,
      'numberofMembersAdded': numberofMembersAdded,
      'numberofMembersRemoved': numberofMembersRemoved,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupsRecordDocumentEquality implements Equality<GroupsRecord> {
  const GroupsRecordDocumentEquality();

  @override
  bool equals(GroupsRecord? e1, GroupsRecord? e2) {
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
        e1?.pDFs == e2?.pDFs &&
        listEquality.equals(e1?.members, e2?.members) &&
        e1?.openGroup == e2?.openGroup &&
        e1?.closedGroup == e2?.closedGroup &&
        e1?.groupLeaderName == e2?.groupLeaderName &&
        listEquality.equals(
            e1?.invitationReceivedByLeader, e2?.invitationReceivedByLeader) &&
        e1?.active == e2?.active &&
        e1?.inactive == e2?.inactive &&
        e1?.meetingDay == e2?.meetingDay &&
        e1?.meetingPlace == e2?.meetingPlace &&
        e1?.targetAudience == e2?.targetAudience &&
        e1?.targetGender == e2?.targetGender &&
        e1?.totalWeeksMet == e2?.totalWeeksMet &&
        e1?.numberofMembers == e2?.numberofMembers &&
        e1?.numberofRatings == e2?.numberofRatings &&
        e1?.meetingTime == e2?.meetingTime &&
        e1?.targetAge == e2?.targetAge &&
        e1?.groupCategory == e2?.groupCategory &&
        listEquality.equals(e1?.groupLeaders, e2?.groupLeaders) &&
        e1?.numberofMembersAdded == e2?.numberofMembersAdded &&
        e1?.numberofMembersRemoved == e2?.numberofMembersRemoved;
  }

  @override
  int hash(GroupsRecord? e) => const ListEquality().hash([
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
        e?.pDFs,
        e?.members,
        e?.openGroup,
        e?.closedGroup,
        e?.groupLeaderName,
        e?.invitationReceivedByLeader,
        e?.active,
        e?.inactive,
        e?.meetingDay,
        e?.meetingPlace,
        e?.targetAudience,
        e?.targetGender,
        e?.totalWeeksMet,
        e?.numberofMembers,
        e?.numberofRatings,
        e?.meetingTime,
        e?.targetAge,
        e?.groupCategory,
        e?.groupLeaders,
        e?.numberofMembersAdded,
        e?.numberofMembersRemoved
      ]);

  @override
  bool isValidKey(Object? o) => o is GroupsRecord;
}
