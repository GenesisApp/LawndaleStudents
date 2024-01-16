import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "admin" field.
  bool? _admin;
  bool get admin => _admin ?? false;
  bool hasAdmin() => _admin != null;

  // "completed_1" field.
  bool? _completed1;
  bool get completed1 => _completed1 ?? false;
  bool hasCompleted1() => _completed1 != null;

  // "completed_2" field.
  bool? _completed2;
  bool get completed2 => _completed2 ?? false;
  bool hasCompleted2() => _completed2 != null;

  // "complete_3" field.
  bool? _complete3;
  bool get complete3 => _complete3 ?? false;
  bool hasComplete3() => _complete3 != null;

  // "percentage_completed1" field.
  int? _percentageCompleted1;
  int get percentageCompleted1 => _percentageCompleted1 ?? 0;
  bool hasPercentageCompleted1() => _percentageCompleted1 != null;

  // "percentage_completed2" field.
  int? _percentageCompleted2;
  int get percentageCompleted2 => _percentageCompleted2 ?? 0;
  bool hasPercentageCompleted2() => _percentageCompleted2 != null;

  // "percentage_completed3" field.
  int? _percentageCompleted3;
  int get percentageCompleted3 => _percentageCompleted3 ?? 0;
  bool hasPercentageCompleted3() => _percentageCompleted3 != null;

  // "backgroundPhotoURL" field.
  String? _backgroundPhotoURL;
  String get backgroundPhotoURL => _backgroundPhotoURL ?? '';
  bool hasBackgroundPhotoURL() => _backgroundPhotoURL != null;

  // "prayedforRequests" field.
  List<DocumentReference>? _prayedforRequests;
  List<DocumentReference> get prayedforRequests =>
      _prayedforRequests ?? const [];
  bool hasPrayedforRequests() => _prayedforRequests != null;

  // "likedJournal" field.
  List<DocumentReference>? _likedJournal;
  List<DocumentReference> get likedJournal => _likedJournal ?? const [];
  bool hasLikedJournal() => _likedJournal != null;

  // "timesCompletedJournal" field.
  int? _timesCompletedJournal;
  int get timesCompletedJournal => _timesCompletedJournal ?? 0;
  bool hasTimesCompletedJournal() => _timesCompletedJournal != null;

  // "timesWatchedVideo" field.
  int? _timesWatchedVideo;
  int get timesWatchedVideo => _timesWatchedVideo ?? 0;
  bool hasTimesWatchedVideo() => _timesWatchedVideo != null;

  // "userFriends" field.
  List<DocumentReference>? _userFriends;
  List<DocumentReference> get userFriends => _userFriends ?? const [];
  bool hasUserFriends() => _userFriends != null;

  // "completedtime1" field.
  DateTime? _completedtime1;
  DateTime? get completedtime1 => _completedtime1;
  bool hasCompletedtime1() => _completedtime1 != null;

  // "completedtime2" field.
  DateTime? _completedtime2;
  DateTime? get completedtime2 => _completedtime2;
  bool hasCompletedtime2() => _completedtime2 != null;

  // "completedtime3" field.
  DateTime? _completedtime3;
  DateTime? get completedtime3 => _completedtime3;
  bool hasCompletedtime3() => _completedtime3 != null;

  // "videos_watched" field.
  List<DocumentReference>? _videosWatched;
  List<DocumentReference> get videosWatched => _videosWatched ?? const [];
  bool hasVideosWatched() => _videosWatched != null;

  // "completionNumber" field.
  int? _completionNumber;
  int get completionNumber => _completionNumber ?? 0;
  bool hasCompletionNumber() => _completionNumber != null;

  // "messageChats" field.
  List<DocumentReference>? _messageChats;
  List<DocumentReference> get messageChats => _messageChats ?? const [];
  bool hasMessageChats() => _messageChats != null;

  // "currentSeason" field.
  DocumentReference? _currentSeason;
  DocumentReference? get currentSeason => _currentSeason;
  bool hasCurrentSeason() => _currentSeason != null;

  // "splashPageVerse" field.
  String? _splashPageVerse;
  String get splashPageVerse => _splashPageVerse ?? '';
  bool hasSplashPageVerse() => _splashPageVerse != null;

  // "splashPageVerseRef" field.
  String? _splashPageVerseRef;
  String get splashPageVerseRef => _splashPageVerseRef ?? '';
  bool hasSplashPageVerseRef() => _splashPageVerseRef != null;

  // "pastoralCare" field.
  bool? _pastoralCare;
  bool get pastoralCare => _pastoralCare ?? false;
  bool hasPastoralCare() => _pastoralCare != null;

  // "notificationsON" field.
  bool? _notificationsON;
  bool get notificationsON => _notificationsON ?? false;
  bool hasNotificationsON() => _notificationsON != null;

  // "completed7" field.
  bool? _completed7;
  bool get completed7 => _completed7 ?? false;
  bool hasCompleted7() => _completed7 != null;

  // "completed30" field.
  bool? _completed30;
  bool get completed30 => _completed30 ?? false;
  bool hasCompleted30() => _completed30 != null;

  // "completed100" field.
  bool? _completed100;
  bool get completed100 => _completed100 ?? false;
  bool hasCompleted100() => _completed100 != null;

  // "completed200" field.
  bool? _completed200;
  bool get completed200 => _completed200 ?? false;
  bool hasCompleted200() => _completed200 != null;

  // "completed365" field.
  bool? _completed365;
  bool get completed365 => _completed365 ?? false;
  bool hasCompleted365() => _completed365 != null;

  // "completedprayer" field.
  bool? _completedprayer;
  bool get completedprayer => _completedprayer ?? false;
  bool hasCompletedprayer() => _completedprayer != null;

  // "timeInPrayer" field.
  int? _timeInPrayer;
  int get timeInPrayer => _timeInPrayer ?? 0;
  bool hasTimeInPrayer() => _timeInPrayer != null;

  // "messageReplyingTo" field.
  DocumentReference? _messageReplyingTo;
  DocumentReference? get messageReplyingTo => _messageReplyingTo;
  bool hasMessageReplyingTo() => _messageReplyingTo != null;

  // "replyingToMessage" field.
  bool? _replyingToMessage;
  bool get replyingToMessage => _replyingToMessage ?? false;
  bool hasReplyingToMessage() => _replyingToMessage != null;

  // "showPrayer" field.
  bool? _showPrayer;
  bool get showPrayer => _showPrayer ?? false;
  bool hasShowPrayer() => _showPrayer != null;

  // "show7" field.
  bool? _show7;
  bool get show7 => _show7 ?? false;
  bool hasShow7() => _show7 != null;

  // "show30" field.
  bool? _show30;
  bool get show30 => _show30 ?? false;
  bool hasShow30() => _show30 != null;

  // "show100" field.
  bool? _show100;
  bool get show100 => _show100 ?? false;
  bool hasShow100() => _show100 != null;

  // "show200" field.
  bool? _show200;
  bool get show200 => _show200 ?? false;
  bool hasShow200() => _show200 != null;

  // "show365" field.
  bool? _show365;
  bool get show365 => _show365 ?? false;
  bool hasShow365() => _show365 != null;

  // "blockedBy" field.
  List<DocumentReference>? _blockedBy;
  List<DocumentReference> get blockedBy => _blockedBy ?? const [];
  bool hasBlockedBy() => _blockedBy != null;

  // "seenPrayer" field.
  bool? _seenPrayer;
  bool get seenPrayer => _seenPrayer ?? false;
  bool hasSeenPrayer() => _seenPrayer != null;

  // "seen7" field.
  bool? _seen7;
  bool get seen7 => _seen7 ?? false;
  bool hasSeen7() => _seen7 != null;

  // "seen30" field.
  bool? _seen30;
  bool get seen30 => _seen30 ?? false;
  bool hasSeen30() => _seen30 != null;

  // "seen100" field.
  bool? _seen100;
  bool get seen100 => _seen100 ?? false;
  bool hasSeen100() => _seen100 != null;

  // "seen200" field.
  bool? _seen200;
  bool get seen200 => _seen200 ?? false;
  bool hasSeen200() => _seen200 != null;

  // "seen365" field.
  bool? _seen365;
  bool get seen365 => _seen365 ?? false;
  bool hasSeen365() => _seen365 != null;

  // "friendRequestReceivedBy" field.
  List<DocumentReference>? _friendRequestReceivedBy;
  List<DocumentReference> get friendRequestReceivedBy =>
      _friendRequestReceivedBy ?? const [];
  bool hasFriendRequestReceivedBy() => _friendRequestReceivedBy != null;

  // "tags" field.
  List<DocumentReference>? _tags;
  List<DocumentReference> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "friendsthathaveReceivedRequest" field.
  List<DocumentReference>? _friendsthathaveReceivedRequest;
  List<DocumentReference> get friendsthathaveReceivedRequest =>
      _friendsthathaveReceivedRequest ?? const [];
  bool hasFriendsthathaveReceivedRequest() =>
      _friendsthathaveReceivedRequest != null;

  // "chatsOptedOutOf" field.
  List<DocumentReference>? _chatsOptedOutOf;
  List<DocumentReference> get chatsOptedOutOf => _chatsOptedOutOf ?? const [];
  bool hasChatsOptedOutOf() => _chatsOptedOutOf != null;

  // "pollAnswersChosen" field.
  List<DocumentReference>? _pollAnswersChosen;
  List<DocumentReference> get pollAnswersChosen =>
      _pollAnswersChosen ?? const [];
  bool hasPollAnswersChosen() => _pollAnswersChosen != null;

  // "eventsDeclined" field.
  List<DocumentReference>? _eventsDeclined;
  List<DocumentReference> get eventsDeclined => _eventsDeclined ?? const [];
  bool hasEventsDeclined() => _eventsDeclined != null;

  // "eventsConfirmed" field.
  List<DocumentReference>? _eventsConfirmed;
  List<DocumentReference> get eventsConfirmed => _eventsConfirmed ?? const [];
  bool hasEventsConfirmed() => _eventsConfirmed != null;

  // "eventsMaybe" field.
  List<DocumentReference>? _eventsMaybe;
  List<DocumentReference> get eventsMaybe => _eventsMaybe ?? const [];
  bool hasEventsMaybe() => _eventsMaybe != null;

  // "lastLoggedIn" field.
  DateTime? _lastLoggedIn;
  DateTime? get lastLoggedIn => _lastLoggedIn;
  bool hasLastLoggedIn() => _lastLoggedIn != null;

  // "prayerVideoURL" field.
  String? _prayerVideoURL;
  String get prayerVideoURL => _prayerVideoURL ?? '';
  bool hasPrayerVideoURL() => _prayerVideoURL != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "grade" field.
  String? _grade;
  String get grade => _grade ?? '';
  bool hasGrade() => _grade != null;

  // "dateofCompletion" field.
  DateTime? _dateofCompletion;
  DateTime? get dateofCompletion => _dateofCompletion;
  bool hasDateofCompletion() => _dateofCompletion != null;

  // "groups" field.
  List<DocumentReference>? _groups;
  List<DocumentReference> get groups => _groups ?? const [];
  bool hasGroups() => _groups != null;

  // "heartCheckActive" field.
  bool? _heartCheckActive;
  bool get heartCheckActive => _heartCheckActive ?? false;
  bool hasHeartCheckActive() => _heartCheckActive != null;

  // "lastHeartCheckDate" field.
  DateTime? _lastHeartCheckDate;
  DateTime? get lastHeartCheckDate => _lastHeartCheckDate;
  bool hasLastHeartCheckDate() => _lastHeartCheckDate != null;

  // "groupsLeader" field.
  bool? _groupsLeader;
  bool get groupsLeader => _groupsLeader ?? false;
  bool hasGroupsLeader() => _groupsLeader != null;

  // "inaGroup" field.
  bool? _inaGroup;
  bool get inaGroup => _inaGroup ?? false;
  bool hasInaGroup() => _inaGroup != null;

  // "acceptedTC" field.
  bool? _acceptedTC;
  bool get acceptedTC => _acceptedTC ?? false;
  bool hasAcceptedTC() => _acceptedTC != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "blockedPeople" field.
  List<DocumentReference>? _blockedPeople;
  List<DocumentReference> get blockedPeople => _blockedPeople ?? const [];
  bool hasBlockedPeople() => _blockedPeople != null;

  // "dailyStreak" field.
  int? _dailyStreak;
  int get dailyStreak => _dailyStreak ?? 0;
  bool hasDailyStreak() => _dailyStreak != null;

  // "distanceFromChurch" field.
  double? _distanceFromChurch;
  double get distanceFromChurch => _distanceFromChurch ?? 0.0;
  bool hasDistanceFromChurch() => _distanceFromChurch != null;

  // "dateNoticeSeen" field.
  DateTime? _dateNoticeSeen;
  DateTime? get dateNoticeSeen => _dateNoticeSeen;
  bool hasDateNoticeSeen() => _dateNoticeSeen != null;

  // "datesAtChurch" field.
  List<DateTime>? _datesAtChurch;
  List<DateTime> get datesAtChurch => _datesAtChurch ?? const [];
  bool hasDatesAtChurch() => _datesAtChurch != null;

  // "notificationCount" field.
  int? _notificationCount;
  int get notificationCount => _notificationCount ?? 0;
  bool hasNotificationCount() => _notificationCount != null;

  // "lastAttendance" field.
  DateTime? _lastAttendance;
  DateTime? get lastAttendance => _lastAttendance;
  bool hasLastAttendance() => _lastAttendance != null;

  // "dateCheckedinGroup" field.
  DateTime? _dateCheckedinGroup;
  DateTime? get dateCheckedinGroup => _dateCheckedinGroup;
  bool hasDateCheckedinGroup() => _dateCheckedinGroup != null;

  // "accountApproved" field.
  bool? _accountApproved;
  bool get accountApproved => _accountApproved ?? false;
  bool hasAccountApproved() => _accountApproved != null;

  // "accountDenied" field.
  bool? _accountDenied;
  bool get accountDenied => _accountDenied ?? false;
  bool hasAccountDenied() => _accountDenied != null;

  // "accountWaiting" field.
  bool? _accountWaiting;
  bool get accountWaiting => _accountWaiting ?? false;
  bool hasAccountWaiting() => _accountWaiting != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _admin = snapshotData['admin'] as bool?;
    _completed1 = snapshotData['completed_1'] as bool?;
    _completed2 = snapshotData['completed_2'] as bool?;
    _complete3 = snapshotData['complete_3'] as bool?;
    _percentageCompleted1 =
        castToType<int>(snapshotData['percentage_completed1']);
    _percentageCompleted2 =
        castToType<int>(snapshotData['percentage_completed2']);
    _percentageCompleted3 =
        castToType<int>(snapshotData['percentage_completed3']);
    _backgroundPhotoURL = snapshotData['backgroundPhotoURL'] as String?;
    _prayedforRequests = getDataList(snapshotData['prayedforRequests']);
    _likedJournal = getDataList(snapshotData['likedJournal']);
    _timesCompletedJournal =
        castToType<int>(snapshotData['timesCompletedJournal']);
    _timesWatchedVideo = castToType<int>(snapshotData['timesWatchedVideo']);
    _userFriends = getDataList(snapshotData['userFriends']);
    _completedtime1 = snapshotData['completedtime1'] as DateTime?;
    _completedtime2 = snapshotData['completedtime2'] as DateTime?;
    _completedtime3 = snapshotData['completedtime3'] as DateTime?;
    _videosWatched = getDataList(snapshotData['videos_watched']);
    _completionNumber = castToType<int>(snapshotData['completionNumber']);
    _messageChats = getDataList(snapshotData['messageChats']);
    _currentSeason = snapshotData['currentSeason'] as DocumentReference?;
    _splashPageVerse = snapshotData['splashPageVerse'] as String?;
    _splashPageVerseRef = snapshotData['splashPageVerseRef'] as String?;
    _pastoralCare = snapshotData['pastoralCare'] as bool?;
    _notificationsON = snapshotData['notificationsON'] as bool?;
    _completed7 = snapshotData['completed7'] as bool?;
    _completed30 = snapshotData['completed30'] as bool?;
    _completed100 = snapshotData['completed100'] as bool?;
    _completed200 = snapshotData['completed200'] as bool?;
    _completed365 = snapshotData['completed365'] as bool?;
    _completedprayer = snapshotData['completedprayer'] as bool?;
    _timeInPrayer = castToType<int>(snapshotData['timeInPrayer']);
    _messageReplyingTo =
        snapshotData['messageReplyingTo'] as DocumentReference?;
    _replyingToMessage = snapshotData['replyingToMessage'] as bool?;
    _showPrayer = snapshotData['showPrayer'] as bool?;
    _show7 = snapshotData['show7'] as bool?;
    _show30 = snapshotData['show30'] as bool?;
    _show100 = snapshotData['show100'] as bool?;
    _show200 = snapshotData['show200'] as bool?;
    _show365 = snapshotData['show365'] as bool?;
    _blockedBy = getDataList(snapshotData['blockedBy']);
    _seenPrayer = snapshotData['seenPrayer'] as bool?;
    _seen7 = snapshotData['seen7'] as bool?;
    _seen30 = snapshotData['seen30'] as bool?;
    _seen100 = snapshotData['seen100'] as bool?;
    _seen200 = snapshotData['seen200'] as bool?;
    _seen365 = snapshotData['seen365'] as bool?;
    _friendRequestReceivedBy =
        getDataList(snapshotData['friendRequestReceivedBy']);
    _tags = getDataList(snapshotData['tags']);
    _friendsthathaveReceivedRequest =
        getDataList(snapshotData['friendsthathaveReceivedRequest']);
    _chatsOptedOutOf = getDataList(snapshotData['chatsOptedOutOf']);
    _pollAnswersChosen = getDataList(snapshotData['pollAnswersChosen']);
    _eventsDeclined = getDataList(snapshotData['eventsDeclined']);
    _eventsConfirmed = getDataList(snapshotData['eventsConfirmed']);
    _eventsMaybe = getDataList(snapshotData['eventsMaybe']);
    _lastLoggedIn = snapshotData['lastLoggedIn'] as DateTime?;
    _prayerVideoURL = snapshotData['prayerVideoURL'] as String?;
    _birthday = snapshotData['birthday'] as DateTime?;
    _gender = snapshotData['gender'] as String?;
    _grade = snapshotData['grade'] as String?;
    _dateofCompletion = snapshotData['dateofCompletion'] as DateTime?;
    _groups = getDataList(snapshotData['groups']);
    _heartCheckActive = snapshotData['heartCheckActive'] as bool?;
    _lastHeartCheckDate = snapshotData['lastHeartCheckDate'] as DateTime?;
    _groupsLeader = snapshotData['groupsLeader'] as bool?;
    _inaGroup = snapshotData['inaGroup'] as bool?;
    _acceptedTC = snapshotData['acceptedTC'] as bool?;
    _firstName = snapshotData['firstName'] as String?;
    _lastName = snapshotData['lastName'] as String?;
    _blockedPeople = getDataList(snapshotData['blockedPeople']);
    _dailyStreak = castToType<int>(snapshotData['dailyStreak']);
    _distanceFromChurch =
        castToType<double>(snapshotData['distanceFromChurch']);
    _dateNoticeSeen = snapshotData['dateNoticeSeen'] as DateTime?;
    _datesAtChurch = getDataList(snapshotData['datesAtChurch']);
    _notificationCount = castToType<int>(snapshotData['notificationCount']);
    _lastAttendance = snapshotData['lastAttendance'] as DateTime?;
    _dateCheckedinGroup = snapshotData['dateCheckedinGroup'] as DateTime?;
    _accountApproved = snapshotData['accountApproved'] as bool?;
    _accountDenied = snapshotData['accountDenied'] as bool?;
    _accountWaiting = snapshotData['accountWaiting'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? admin,
  bool? completed1,
  bool? completed2,
  bool? complete3,
  int? percentageCompleted1,
  int? percentageCompleted2,
  int? percentageCompleted3,
  String? backgroundPhotoURL,
  int? timesCompletedJournal,
  int? timesWatchedVideo,
  DateTime? completedtime1,
  DateTime? completedtime2,
  DateTime? completedtime3,
  int? completionNumber,
  DocumentReference? currentSeason,
  String? splashPageVerse,
  String? splashPageVerseRef,
  bool? pastoralCare,
  bool? notificationsON,
  bool? completed7,
  bool? completed30,
  bool? completed100,
  bool? completed200,
  bool? completed365,
  bool? completedprayer,
  int? timeInPrayer,
  DocumentReference? messageReplyingTo,
  bool? replyingToMessage,
  bool? showPrayer,
  bool? show7,
  bool? show30,
  bool? show100,
  bool? show200,
  bool? show365,
  bool? seenPrayer,
  bool? seen7,
  bool? seen30,
  bool? seen100,
  bool? seen200,
  bool? seen365,
  DateTime? lastLoggedIn,
  String? prayerVideoURL,
  DateTime? birthday,
  String? gender,
  String? grade,
  DateTime? dateofCompletion,
  bool? heartCheckActive,
  DateTime? lastHeartCheckDate,
  bool? groupsLeader,
  bool? inaGroup,
  bool? acceptedTC,
  String? firstName,
  String? lastName,
  int? dailyStreak,
  double? distanceFromChurch,
  DateTime? dateNoticeSeen,
  int? notificationCount,
  DateTime? lastAttendance,
  DateTime? dateCheckedinGroup,
  bool? accountApproved,
  bool? accountDenied,
  bool? accountWaiting,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'admin': admin,
      'completed_1': completed1,
      'completed_2': completed2,
      'complete_3': complete3,
      'percentage_completed1': percentageCompleted1,
      'percentage_completed2': percentageCompleted2,
      'percentage_completed3': percentageCompleted3,
      'backgroundPhotoURL': backgroundPhotoURL,
      'timesCompletedJournal': timesCompletedJournal,
      'timesWatchedVideo': timesWatchedVideo,
      'completedtime1': completedtime1,
      'completedtime2': completedtime2,
      'completedtime3': completedtime3,
      'completionNumber': completionNumber,
      'currentSeason': currentSeason,
      'splashPageVerse': splashPageVerse,
      'splashPageVerseRef': splashPageVerseRef,
      'pastoralCare': pastoralCare,
      'notificationsON': notificationsON,
      'completed7': completed7,
      'completed30': completed30,
      'completed100': completed100,
      'completed200': completed200,
      'completed365': completed365,
      'completedprayer': completedprayer,
      'timeInPrayer': timeInPrayer,
      'messageReplyingTo': messageReplyingTo,
      'replyingToMessage': replyingToMessage,
      'showPrayer': showPrayer,
      'show7': show7,
      'show30': show30,
      'show100': show100,
      'show200': show200,
      'show365': show365,
      'seenPrayer': seenPrayer,
      'seen7': seen7,
      'seen30': seen30,
      'seen100': seen100,
      'seen200': seen200,
      'seen365': seen365,
      'lastLoggedIn': lastLoggedIn,
      'prayerVideoURL': prayerVideoURL,
      'birthday': birthday,
      'gender': gender,
      'grade': grade,
      'dateofCompletion': dateofCompletion,
      'heartCheckActive': heartCheckActive,
      'lastHeartCheckDate': lastHeartCheckDate,
      'groupsLeader': groupsLeader,
      'inaGroup': inaGroup,
      'acceptedTC': acceptedTC,
      'firstName': firstName,
      'lastName': lastName,
      'dailyStreak': dailyStreak,
      'distanceFromChurch': distanceFromChurch,
      'dateNoticeSeen': dateNoticeSeen,
      'notificationCount': notificationCount,
      'lastAttendance': lastAttendance,
      'dateCheckedinGroup': dateCheckedinGroup,
      'accountApproved': accountApproved,
      'accountDenied': accountDenied,
      'accountWaiting': accountWaiting,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.admin == e2?.admin &&
        e1?.completed1 == e2?.completed1 &&
        e1?.completed2 == e2?.completed2 &&
        e1?.complete3 == e2?.complete3 &&
        e1?.percentageCompleted1 == e2?.percentageCompleted1 &&
        e1?.percentageCompleted2 == e2?.percentageCompleted2 &&
        e1?.percentageCompleted3 == e2?.percentageCompleted3 &&
        e1?.backgroundPhotoURL == e2?.backgroundPhotoURL &&
        listEquality.equals(e1?.prayedforRequests, e2?.prayedforRequests) &&
        listEquality.equals(e1?.likedJournal, e2?.likedJournal) &&
        e1?.timesCompletedJournal == e2?.timesCompletedJournal &&
        e1?.timesWatchedVideo == e2?.timesWatchedVideo &&
        listEquality.equals(e1?.userFriends, e2?.userFriends) &&
        e1?.completedtime1 == e2?.completedtime1 &&
        e1?.completedtime2 == e2?.completedtime2 &&
        e1?.completedtime3 == e2?.completedtime3 &&
        listEquality.equals(e1?.videosWatched, e2?.videosWatched) &&
        e1?.completionNumber == e2?.completionNumber &&
        listEquality.equals(e1?.messageChats, e2?.messageChats) &&
        e1?.currentSeason == e2?.currentSeason &&
        e1?.splashPageVerse == e2?.splashPageVerse &&
        e1?.splashPageVerseRef == e2?.splashPageVerseRef &&
        e1?.pastoralCare == e2?.pastoralCare &&
        e1?.notificationsON == e2?.notificationsON &&
        e1?.completed7 == e2?.completed7 &&
        e1?.completed30 == e2?.completed30 &&
        e1?.completed100 == e2?.completed100 &&
        e1?.completed200 == e2?.completed200 &&
        e1?.completed365 == e2?.completed365 &&
        e1?.completedprayer == e2?.completedprayer &&
        e1?.timeInPrayer == e2?.timeInPrayer &&
        e1?.messageReplyingTo == e2?.messageReplyingTo &&
        e1?.replyingToMessage == e2?.replyingToMessage &&
        e1?.showPrayer == e2?.showPrayer &&
        e1?.show7 == e2?.show7 &&
        e1?.show30 == e2?.show30 &&
        e1?.show100 == e2?.show100 &&
        e1?.show200 == e2?.show200 &&
        e1?.show365 == e2?.show365 &&
        listEquality.equals(e1?.blockedBy, e2?.blockedBy) &&
        e1?.seenPrayer == e2?.seenPrayer &&
        e1?.seen7 == e2?.seen7 &&
        e1?.seen30 == e2?.seen30 &&
        e1?.seen100 == e2?.seen100 &&
        e1?.seen200 == e2?.seen200 &&
        e1?.seen365 == e2?.seen365 &&
        listEquality.equals(
            e1?.friendRequestReceivedBy, e2?.friendRequestReceivedBy) &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        listEquality.equals(e1?.friendsthathaveReceivedRequest,
            e2?.friendsthathaveReceivedRequest) &&
        listEquality.equals(e1?.chatsOptedOutOf, e2?.chatsOptedOutOf) &&
        listEquality.equals(e1?.pollAnswersChosen, e2?.pollAnswersChosen) &&
        listEquality.equals(e1?.eventsDeclined, e2?.eventsDeclined) &&
        listEquality.equals(e1?.eventsConfirmed, e2?.eventsConfirmed) &&
        listEquality.equals(e1?.eventsMaybe, e2?.eventsMaybe) &&
        e1?.lastLoggedIn == e2?.lastLoggedIn &&
        e1?.prayerVideoURL == e2?.prayerVideoURL &&
        e1?.birthday == e2?.birthday &&
        e1?.gender == e2?.gender &&
        e1?.grade == e2?.grade &&
        e1?.dateofCompletion == e2?.dateofCompletion &&
        listEquality.equals(e1?.groups, e2?.groups) &&
        e1?.heartCheckActive == e2?.heartCheckActive &&
        e1?.lastHeartCheckDate == e2?.lastHeartCheckDate &&
        e1?.groupsLeader == e2?.groupsLeader &&
        e1?.inaGroup == e2?.inaGroup &&
        e1?.acceptedTC == e2?.acceptedTC &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        listEquality.equals(e1?.blockedPeople, e2?.blockedPeople) &&
        e1?.dailyStreak == e2?.dailyStreak &&
        e1?.distanceFromChurch == e2?.distanceFromChurch &&
        e1?.dateNoticeSeen == e2?.dateNoticeSeen &&
        listEquality.equals(e1?.datesAtChurch, e2?.datesAtChurch) &&
        e1?.notificationCount == e2?.notificationCount &&
        e1?.lastAttendance == e2?.lastAttendance &&
        e1?.dateCheckedinGroup == e2?.dateCheckedinGroup &&
        e1?.accountApproved == e2?.accountApproved &&
        e1?.accountDenied == e2?.accountDenied &&
        e1?.accountWaiting == e2?.accountWaiting;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.admin,
        e?.completed1,
        e?.completed2,
        e?.complete3,
        e?.percentageCompleted1,
        e?.percentageCompleted2,
        e?.percentageCompleted3,
        e?.backgroundPhotoURL,
        e?.prayedforRequests,
        e?.likedJournal,
        e?.timesCompletedJournal,
        e?.timesWatchedVideo,
        e?.userFriends,
        e?.completedtime1,
        e?.completedtime2,
        e?.completedtime3,
        e?.videosWatched,
        e?.completionNumber,
        e?.messageChats,
        e?.currentSeason,
        e?.splashPageVerse,
        e?.splashPageVerseRef,
        e?.pastoralCare,
        e?.notificationsON,
        e?.completed7,
        e?.completed30,
        e?.completed100,
        e?.completed200,
        e?.completed365,
        e?.completedprayer,
        e?.timeInPrayer,
        e?.messageReplyingTo,
        e?.replyingToMessage,
        e?.showPrayer,
        e?.show7,
        e?.show30,
        e?.show100,
        e?.show200,
        e?.show365,
        e?.blockedBy,
        e?.seenPrayer,
        e?.seen7,
        e?.seen30,
        e?.seen100,
        e?.seen200,
        e?.seen365,
        e?.friendRequestReceivedBy,
        e?.tags,
        e?.friendsthathaveReceivedRequest,
        e?.chatsOptedOutOf,
        e?.pollAnswersChosen,
        e?.eventsDeclined,
        e?.eventsConfirmed,
        e?.eventsMaybe,
        e?.lastLoggedIn,
        e?.prayerVideoURL,
        e?.birthday,
        e?.gender,
        e?.grade,
        e?.dateofCompletion,
        e?.groups,
        e?.heartCheckActive,
        e?.lastHeartCheckDate,
        e?.groupsLeader,
        e?.inaGroup,
        e?.acceptedTC,
        e?.firstName,
        e?.lastName,
        e?.blockedPeople,
        e?.dailyStreak,
        e?.distanceFromChurch,
        e?.dateNoticeSeen,
        e?.datesAtChurch,
        e?.notificationCount,
        e?.lastAttendance,
        e?.dateCheckedinGroup,
        e?.accountApproved,
        e?.accountDenied,
        e?.accountWaiting
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
