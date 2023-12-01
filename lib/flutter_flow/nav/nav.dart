import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? SoLSplashScreenCopyWidget()
          : OnBoardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? SoLSplashScreenCopyWidget()
              : OnBoardingWidget(),
          routes: [
            FFRoute(
              name: 'LoginPage',
              path: 'loginPage',
              builder: (context, params) => LoginPageWidget(),
            ),
            FFRoute(
              name: 'SignupPage',
              path: 'signupPage',
              builder: (context, params) => SignupPageWidget(),
            ),
            FFRoute(
              name: 'GrowPage',
              path: 'growPage',
              requireAuth: true,
              builder: (context, params) => GrowPageWidget(),
            ),
            FFRoute(
              name: 'SeriesOverview',
              path: 'seriesOverview',
              requireAuth: true,
              builder: (context, params) => SeriesOverviewWidget(
                chosenSeries: params.getParam('chosenSeries',
                    ParamType.DocumentReference, false, ['videoSeries']),
              ),
            ),
            FFRoute(
              name: 'ChooseUser',
              path: 'chooseUser',
              requireAuth: true,
              builder: (context, params) => ChooseUserWidget(),
            ),
            FFRoute(
              name: 'AllChats',
              path: 'allChats',
              requireAuth: true,
              builder: (context, params) => AllChatsWidget(),
            ),
            FFRoute(
              name: 'ChatPage',
              path: 'chatPage',
              requireAuth: true,
              asyncParams: {
                'chatChosen':
                    getDoc(['messageChats'], MessageChatsRecord.fromSnapshot),
                'otherUserDoc': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => ChatPageWidget(
                chatChosen: params.getParam('chatChosen', ParamType.Document),
                chatUsers: params.getParam(
                    'chatUsers', ParamType.DocumentReference, false, ['users']),
                otherUserDoc:
                    params.getParam('otherUserDoc', ParamType.Document),
                otherUserRef: params.getParam('otherUserRef',
                    ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'groupsAttendance',
              path: 'groupsAttendance',
              requireAuth: true,
              asyncParams: {
                'groupChosen': getDoc(['groups'], GroupsRecord.fromSnapshot),
              },
              builder: (context, params) => GroupsAttendanceWidget(
                groupChosen: params.getParam('groupChosen', ParamType.Document),
                groupUsers: params.getParam<DocumentReference>(
                    'groupUsers', ParamType.DocumentReference, true, ['users']),
              ),
            ),
            FFRoute(
              name: 'CommunityPrayerPage',
              path: 'communityPrayerPage',
              requireAuth: true,
              builder: (context, params) => CommunityPrayerPageWidget(),
            ),
            FFRoute(
              name: 'PersonalPrayerPage',
              path: 'personalPrayerPage',
              requireAuth: true,
              builder: (context, params) => PersonalPrayerPageWidget(),
            ),
            FFRoute(
              name: 'ProfilePage',
              path: 'profilePage',
              requireAuth: true,
              builder: (context, params) => ProfilePageWidget(),
            ),
            FFRoute(
              name: 'EditProfilePage',
              path: 'editProfilePage',
              requireAuth: true,
              builder: (context, params) => EditProfilePageWidget(),
            ),
            FFRoute(
              name: 'FriendsList',
              path: 'friendsList',
              requireAuth: true,
              builder: (context, params) => FriendsListWidget(),
            ),
            FFRoute(
              name: 'OtherUserProfile',
              path: 'otherUserProfile',
              requireAuth: true,
              asyncParams: {
                'selectedUser': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => OtherUserProfileWidget(
                selectedUser:
                    params.getParam('selectedUser', ParamType.Document),
                selectedUserRef: params.getParam('selectedUserRef',
                    ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'PinnedMessages',
              path: 'pinnedMessages',
              requireAuth: true,
              asyncParams: {
                'chatChosen':
                    getDoc(['messageChats'], MessageChatsRecord.fromSnapshot),
                'otherUserDoc': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => PinnedMessagesWidget(
                chatChosen: params.getParam('chatChosen', ParamType.Document),
                chatUsers: params.getParam(
                    'chatUsers', ParamType.DocumentReference, false, ['users']),
                otherUserDoc:
                    params.getParam('otherUserDoc', ParamType.Document),
                otherUserRef: params.getParam('otherUserRef',
                    ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'PastoralCare',
              path: 'pastoralCare',
              requireAuth: true,
              builder: (context, params) => PastoralCareWidget(),
            ),
            FFRoute(
              name: 'CreateNewChat',
              path: 'createNewChat',
              requireAuth: true,
              builder: (context, params) => CreateNewChatWidget(),
            ),
            FFRoute(
              name: 'AddFriendsChat',
              path: 'addFriendsChat',
              requireAuth: true,
              asyncParams: {
                'chatChosen':
                    getDoc(['messageChats'], MessageChatsRecord.fromSnapshot),
              },
              builder: (context, params) => AddFriendsChatWidget(
                chatChosen: params.getParam('chatChosen', ParamType.Document),
                chatUsers: params.getParam(
                    'chatUsers', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'EditProfilePageAuth',
              path: 'editProfilePageAuth',
              requireAuth: true,
              builder: (context, params) => EditProfilePageAuthWidget(),
            ),
            FFRoute(
              name: 'PrayingPage',
              path: 'prayingPage',
              requireAuth: true,
              asyncParams: {
                'requestChosenDoc': getDoc(
                    ['prayer_requests'], PrayerRequestsRecord.fromSnapshot),
                'requestUser': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => PrayingPageWidget(
                requestChosen: params.getParam('requestChosen',
                    ParamType.DocumentReference, false, ['prayer_requests']),
                requestChosenDoc:
                    params.getParam('requestChosenDoc', ParamType.Document),
                requestUser: params.getParam('requestUser', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'WorshipArchives',
              path: 'worshipArchives',
              requireAuth: true,
              builder: (context, params) => WorshipArchivesWidget(),
            ),
            FFRoute(
              name: 'AdminDashboard',
              path: 'adminDashboard',
              requireAuth: true,
              builder: (context, params) => AdminDashboardWidget(),
            ),
            FFRoute(
              name: 'AllPracticesCompleted',
              path: 'allPracticesCompleted',
              requireAuth: true,
              builder: (context, params) => AllPracticesCompletedWidget(),
            ),
            FFRoute(
              name: 'CurrentChatMembers',
              path: 'currentChatMembers',
              requireAuth: true,
              asyncParams: {
                'chatChosen':
                    getDoc(['messageChats'], MessageChatsRecord.fromSnapshot),
              },
              builder: (context, params) => CurrentChatMembersWidget(
                chatChosen: params.getParam('chatChosen', ParamType.Document),
                chatUsers: params.getParam(
                    'chatUsers', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'DailyPracticeScheduling',
              path: 'dailyPracticeScheduling',
              requireAuth: true,
              builder: (context, params) => DailyPracticeSchedulingWidget(),
            ),
            FFRoute(
              name: 'AllPrayerList',
              path: 'allPrayerList',
              requireAuth: true,
              builder: (context, params) => AllPrayerListWidget(),
            ),
            FFRoute(
              name: 'AllPastoralRequests',
              path: 'allPastoralRequests',
              requireAuth: true,
              builder: (context, params) => AllPastoralRequestsWidget(),
            ),
            FFRoute(
              name: 'AllProfiles',
              path: 'allProfiles',
              requireAuth: true,
              builder: (context, params) => AllProfilesWidget(),
            ),
            FFRoute(
              name: 'ScriptureArchives',
              path: 'scriptureArchives',
              requireAuth: true,
              builder: (context, params) => ScriptureArchivesWidget(),
            ),
            FFRoute(
              name: 'PrayerArchives',
              path: 'prayerArchives',
              requireAuth: true,
              builder: (context, params) => PrayerArchivesWidget(),
            ),
            FFRoute(
              name: 'MessageArchives',
              path: 'messageArchives',
              requireAuth: true,
              builder: (context, params) => MessageArchivesWidget(),
            ),
            FFRoute(
              name: 'ProfileTags',
              path: 'profileTags',
              requireAuth: true,
              builder: (context, params) => ProfileTagsWidget(),
            ),
            FFRoute(
              name: 'AllProfilesWithTag',
              path: 'allProfilesWithTag',
              requireAuth: true,
              asyncParams: {
                'tagSelected':
                    getDoc(['profile_tags'], ProfileTagsRecord.fromSnapshot),
              },
              builder: (context, params) => AllProfilesWithTagWidget(
                tagSelected: params.getParam('tagSelected', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'SoLSplashScreenCopy',
              path: 'soLSplashScreenCopy',
              requireAuth: true,
              builder: (context, params) => SoLSplashScreenCopyWidget(),
            ),
            FFRoute(
              name: 'onBoarding',
              path: 'onBoarding',
              builder: (context, params) => OnBoardingWidget(),
            ),
            FFRoute(
              name: 'AllJournals',
              path: 'allJournals',
              requireAuth: true,
              builder: (context, params) => AllJournalsWidget(),
            ),
            FFRoute(
              name: 'Catechism',
              path: 'catechism',
              requireAuth: true,
              builder: (context, params) => CatechismWidget(),
            ),
            FFRoute(
              name: 'GrowPagePDF',
              path: 'growPagePDF',
              requireAuth: true,
              asyncParams: {
                'chosenResourceGuide':
                    getDoc(['guides'], GuidesRecord.fromSnapshot),
              },
              builder: (context, params) => GrowPagePDFWidget(
                chosenResourceGuide:
                    params.getParam('chosenResourceGuide', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'NotificationsSelection',
              path: 'notificationsSelection',
              requireAuth: true,
              builder: (context, params) => NotificationsSelectionWidget(),
            ),
            FFRoute(
              name: 'AddTagPeople',
              path: 'addTagPeople',
              requireAuth: true,
              asyncParams: {
                'tagChosen':
                    getDoc(['profile_tags'], ProfileTagsRecord.fromSnapshot),
              },
              builder: (context, params) => AddTagPeopleWidget(
                tagChosen: params.getParam('tagChosen', ParamType.Document),
                tagChosenRef: params.getParam('tagChosenRef',
                    ParamType.DocumentReference, false, ['profile_tags']),
              ),
            ),
            FFRoute(
              name: 'AllHeartChecks',
              path: 'allHeartChecks',
              requireAuth: true,
              builder: (context, params) => AllHeartChecksWidget(),
            ),
            FFRoute(
              name: 'groupAnalytics',
              path: 'groupAnalytics',
              requireAuth: true,
              builder: (context, params) => GroupAnalyticsWidget(),
            ),
            FFRoute(
              name: 'adminGroupsRatingsView',
              path: 'adminGroupsRatingsView',
              requireAuth: true,
              builder: (context, params) => AdminGroupsRatingsViewWidget(),
            ),
            FFRoute(
              name: 'myGroupsPage',
              path: 'myGroupsPage',
              requireAuth: true,
              builder: (context, params) => MyGroupsPageWidget(),
            ),
            FFRoute(
              name: 'groupsRatings',
              path: 'groupsRatings',
              requireAuth: true,
              asyncParams: {
                'groupChosenDoc': getDoc(['groups'], GroupsRecord.fromSnapshot),
              },
              builder: (context, params) => GroupsRatingsWidget(
                groupChosen: params.getParam('groupChosen',
                    ParamType.DocumentReference, false, ['groups']),
                groupChosenDoc:
                    params.getParam('groupChosenDoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'AddGroupPeople',
              path: 'addGroupPeople',
              requireAuth: true,
              asyncParams: {
                'groupChosen': getDoc(['groups'], GroupsRecord.fromSnapshot),
                'sgChatDoc':
                    getDoc(['messageChats'], MessageChatsRecord.fromSnapshot),
              },
              builder: (context, params) => AddGroupPeopleWidget(
                groupChosen: params.getParam('groupChosen', ParamType.Document),
                groupChosenRef: params.getParam('groupChosenRef',
                    ParamType.DocumentReference, false, ['groups']),
                sgChat: params.getParam('sgChat', ParamType.DocumentReference,
                    false, ['messageChats']),
                sgChatDoc: params.getParam('sgChatDoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'GroupDetails',
              path: 'groupDetails',
              requireAuth: true,
              asyncParams: {
                'chosenGroup': getDoc(['groups'], GroupsRecord.fromSnapshot),
              },
              builder: (context, params) => GroupDetailsWidget(
                chosenGroup: params.getParam('chosenGroup', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'adminGroupsViewClosed',
              path: 'adminGroupsViewClosed',
              requireAuth: true,
              builder: (context, params) => AdminGroupsViewClosedWidget(),
            ),
            FFRoute(
              name: 'adminGroupsViewOpen',
              path: 'adminGroupsViewOpen',
              requireAuth: true,
              builder: (context, params) => AdminGroupsViewOpenWidget(),
            ),
            FFRoute(
              name: 'adminGroupsViewAll',
              path: 'adminGroupsViewAll',
              requireAuth: true,
              builder: (context, params) => AdminGroupsViewAllWidget(),
            ),
            FFRoute(
              name: 'AllProfilesinGroups',
              path: 'allProfilesinGroups',
              requireAuth: true,
              builder: (context, params) => AllProfilesinGroupsWidget(),
            ),
            FFRoute(
              name: 'MyHeartChecks',
              path: 'myHeartChecks',
              requireAuth: true,
              builder: (context, params) => MyHeartChecksWidget(),
            ),
            FFRoute(
              name: 'HomePage',
              path: 'homePage',
              requireAuth: true,
              builder: (context, params) => HomePageWidget(
                loggedinUser: params.getParam('loggedinUser',
                    ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'JournalReplyPage',
              path: 'journalReplyPage',
              requireAuth: true,
              asyncParams: {
                'journalChosenDoc': getDoc(
                    ['personalJournals'], PersonalJournalsRecord.fromSnapshot),
              },
              builder: (context, params) => JournalReplyPageWidget(
                journalChosenDoc:
                    params.getParam('journalChosenDoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'SeriesCatalog',
              path: 'seriesCatalog',
              requireAuth: true,
              asyncParams: {
                'videoChosenDoc': getDoc(
                    ['resource_videos'], ResourceVideosRecord.fromSnapshot),
              },
              builder: (context, params) => SeriesCatalogWidget(
                videoChosen: params.getParam('videoChosen',
                    ParamType.DocumentReference, false, ['resource_videos']),
                videoChosenDoc:
                    params.getParam('videoChosenDoc', ParamType.Document),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/onBoarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
