import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 75.0,
            height: 75.0,
            child: SpinKitRipple(
              color: Color(0xFF7F95AD),
              size: 75.0,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'LoginPage': ParameterData.none(),
  'SignupPage': ParameterData.none(),
  'GrowPage': ParameterData.none(),
  'SeriesOverview': (data) async => ParameterData(
        allParams: {
          'chosenSeries': getParameter<DocumentReference>(data, 'chosenSeries'),
        },
      ),
  'ChooseUser': ParameterData.none(),
  'AllChats': ParameterData.none(),
  'ChatPage': (data) async => ParameterData(
        allParams: {
          'chatChosen': await getDocumentParameter<MessageChatsRecord>(
              data, 'chatChosen', MessageChatsRecord.fromSnapshot),
          'chatUsers': getParameter<DocumentReference>(data, 'chatUsers'),
          'otherUserDoc': await getDocumentParameter<UsersRecord>(
              data, 'otherUserDoc', UsersRecord.fromSnapshot),
          'otherUserRef': getParameter<DocumentReference>(data, 'otherUserRef'),
        },
      ),
  'groupsAttendance': (data) async => ParameterData(
        allParams: {
          'groupChosen': await getDocumentParameter<GroupsRecord>(
              data, 'groupChosen', GroupsRecord.fromSnapshot),
        },
      ),
  'CommunityPrayerPage': ParameterData.none(),
  'PersonalPrayerPage': ParameterData.none(),
  'ProfilePage': ParameterData.none(),
  'EditProfilePage': ParameterData.none(),
  'FriendsList': ParameterData.none(),
  'OtherUserProfile': (data) async => ParameterData(
        allParams: {
          'selectedUser': await getDocumentParameter<UsersRecord>(
              data, 'selectedUser', UsersRecord.fromSnapshot),
          'selectedUserRef':
              getParameter<DocumentReference>(data, 'selectedUserRef'),
        },
      ),
  'PinnedMessages': (data) async => ParameterData(
        allParams: {
          'chatChosen': await getDocumentParameter<MessageChatsRecord>(
              data, 'chatChosen', MessageChatsRecord.fromSnapshot),
          'chatUsers': getParameter<DocumentReference>(data, 'chatUsers'),
          'otherUserDoc': await getDocumentParameter<UsersRecord>(
              data, 'otherUserDoc', UsersRecord.fromSnapshot),
          'otherUserRef': getParameter<DocumentReference>(data, 'otherUserRef'),
        },
      ),
  'PastoralCare': ParameterData.none(),
  'CreateNewChat': ParameterData.none(),
  'AddFriendsChat': (data) async => ParameterData(
        allParams: {
          'chatChosen': await getDocumentParameter<MessageChatsRecord>(
              data, 'chatChosen', MessageChatsRecord.fromSnapshot),
          'chatUsers': getParameter<DocumentReference>(data, 'chatUsers'),
        },
      ),
  'EditProfilePageAuth': ParameterData.none(),
  'PrayingPage': (data) async => ParameterData(
        allParams: {
          'requestChosen':
              getParameter<DocumentReference>(data, 'requestChosen'),
          'requestChosenDoc': await getDocumentParameter<PrayerRequestsRecord>(
              data, 'requestChosenDoc', PrayerRequestsRecord.fromSnapshot),
          'requestUser': await getDocumentParameter<UsersRecord>(
              data, 'requestUser', UsersRecord.fromSnapshot),
        },
      ),
  'WorshipArchives': ParameterData.none(),
  'AdminDashboard': ParameterData.none(),
  'AllPracticesCompleted': ParameterData.none(),
  'CurrentChatMembers': (data) async => ParameterData(
        allParams: {
          'chatChosen': await getDocumentParameter<MessageChatsRecord>(
              data, 'chatChosen', MessageChatsRecord.fromSnapshot),
          'chatUsers': getParameter<DocumentReference>(data, 'chatUsers'),
        },
      ),
  'DailyPracticeScheduling': ParameterData.none(),
  'AllPrayerList': ParameterData.none(),
  'AllPastoralRequests': ParameterData.none(),
  'AllProfiles': ParameterData.none(),
  'ScriptureArchives': ParameterData.none(),
  'PrayerArchives': ParameterData.none(),
  'MessageArchives': ParameterData.none(),
  'ProfileTags': ParameterData.none(),
  'AllProfilesWithTag': (data) async => ParameterData(
        allParams: {
          'tagSelected': await getDocumentParameter<ProfileTagsRecord>(
              data, 'tagSelected', ProfileTagsRecord.fromSnapshot),
        },
      ),
  'SoLSplashScreenCopy': ParameterData.none(),
  'onBoarding': ParameterData.none(),
  'AllJournals': ParameterData.none(),
  'Catechism': ParameterData.none(),
  'GrowPagePDF': (data) async => ParameterData(
        allParams: {
          'chosenResourceGuide': await getDocumentParameter<GuidesRecord>(
              data, 'chosenResourceGuide', GuidesRecord.fromSnapshot),
        },
      ),
  'NotificationsSelection': ParameterData.none(),
  'AddTagPeople': (data) async => ParameterData(
        allParams: {
          'tagChosen': await getDocumentParameter<ProfileTagsRecord>(
              data, 'tagChosen', ProfileTagsRecord.fromSnapshot),
          'tagChosenRef': getParameter<DocumentReference>(data, 'tagChosenRef'),
        },
      ),
  'AllHeartChecks': ParameterData.none(),
  'groupAnalytics': ParameterData.none(),
  'adminGroupsRatingsView': ParameterData.none(),
  'myGroupsPage': ParameterData.none(),
  'groupsRatings': (data) async => ParameterData(
        allParams: {
          'groupChosen': getParameter<DocumentReference>(data, 'groupChosen'),
          'groupChosenDoc': await getDocumentParameter<GroupsRecord>(
              data, 'groupChosenDoc', GroupsRecord.fromSnapshot),
        },
      ),
  'AddGroupPeople': (data) async => ParameterData(
        allParams: {
          'groupChosen': await getDocumentParameter<GroupsRecord>(
              data, 'groupChosen', GroupsRecord.fromSnapshot),
          'groupChosenRef':
              getParameter<DocumentReference>(data, 'groupChosenRef'),
          'sgChat': getParameter<DocumentReference>(data, 'sgChat'),
          'sgChatDoc': await getDocumentParameter<MessageChatsRecord>(
              data, 'sgChatDoc', MessageChatsRecord.fromSnapshot),
        },
      ),
  'GroupDetails': (data) async => ParameterData(
        allParams: {
          'chosenGroup': await getDocumentParameter<GroupsRecord>(
              data, 'chosenGroup', GroupsRecord.fromSnapshot),
        },
      ),
  'adminGroupsViewClosed': ParameterData.none(),
  'adminGroupsViewOpen': ParameterData.none(),
  'adminGroupsViewAll': ParameterData.none(),
  'AllProfilesinGroups': ParameterData.none(),
  'MyHeartChecks': ParameterData.none(),
  'HomePage': (data) async => ParameterData(
        allParams: {
          'loggedinUser': getParameter<DocumentReference>(data, 'loggedinUser'),
        },
      ),
  'JournalReplyPage': (data) async => ParameterData(
        allParams: {
          'journalChosenDoc':
              await getDocumentParameter<PersonalJournalsRecord>(data,
                  'journalChosenDoc', PersonalJournalsRecord.fromSnapshot),
        },
      ),
  'SeriesCatalog': (data) async => ParameterData(
        allParams: {
          'videoChosen': getParameter<DocumentReference>(data, 'videoChosen'),
          'videoChosenDoc': await getDocumentParameter<ResourceVideosRecord>(
              data, 'videoChosenDoc', ResourceVideosRecord.fromSnapshot),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
