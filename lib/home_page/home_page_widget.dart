import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/chat_tab_icon_unselected_widget.dart';
import '/components/prayer_practice_b_s_widget.dart';
import '/components/prayer_ring_small_widget.dart';
import '/components/prayer_update_widget.dart';
import '/components/profile_tab_icon_unselected_widget.dart';
import '/components/scripture_practice_b_s_widget.dart';
import '/components/scripture_update_widget.dart';
import '/components/seasons_update_widget.dart';
import '/components/video_details_b_s_widget.dart';
import '/components/welcome_to_church_widget.dart';
import '/components/worship_practice_b_s_widget.dart';
import '/components/worship_update_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key? key,
    this.loggedinUser,
  }) : super(key: key);

  final DocumentReference? loggedinUser;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'richTextOnPageLoadAnimation': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.3,
          end: 1.0,
        ),
      ],
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(-30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'progressBarOnPageLoadAnimation1': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.3,
          end: 1.0,
        ),
      ],
    ),
    'progressBarOnPageLoadAnimation2': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.3,
          end: 1.0,
        ),
      ],
    ),
    'progressBarOnPageLoadAnimation3': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.3,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-15.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1400.ms,
          begin: Offset(-15.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1800.ms,
          begin: Offset(-15.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 900.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 900.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'iconOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 650.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 650.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 750.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 750.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 850.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 850.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 950.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 950.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 600.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 700.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 700.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 800.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation8': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 900.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 900.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(-50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 900.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation9': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1050.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1050.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation10': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1150.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1150.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation11': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1250.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1250.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation12': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1350.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1350.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation13': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1000.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation14': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1100.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1100.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation15': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1200.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation16': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1300.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1300.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(-50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'iconOnPageLoadAnimation17': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1450.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1450.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation18': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1550.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1550.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation19': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1650.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1650.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation20': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1750.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1750.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation21': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1400.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1400.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation22': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1500.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1500.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation23': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1600.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1600.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation24': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1700.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1700.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation8': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(-50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation9': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation10': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 700.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 700.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation11': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation12': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 900.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 900.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation13': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 1000.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation14': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 1100.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 1100.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation15': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation();
      if ((valueOrDefault(currentUserDocument?.distanceFromChurch, 0.0) <=
              .055) &&
          (currentUserDocument?.dateNoticeSeen != functions.getDayDate())) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          barrierColor: FlutterFlowTheme.of(context).opagueSeparator,
          isDismissible: false,
          context: context,
          builder: (context) {
            return WebViewAware(
                child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: WelcomeToChurchWidget(),
            ));
          },
        ).then((value) => safeSetState(() {}));
      }
      if (dateTimeFormat(
            'yMMMd',
            currentUserDocument?.dateofCompletion,
            locale: FFLocalizations.of(context).languageCode,
          ) !=
          dateTimeFormat(
            'yMMMd',
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          )) {
        if (!functions
            .checkYesterdayDate(currentUserDocument?.dateofCompletion)!) {
          await currentUserReference!.update(createUsersRecordData(
            dailyStreak: 0,
          ));
        }
      }
      if ((valueOrDefault(currentUserDocument?.dailyStreak, 0) >= 1) &&
          !valueOrDefault<bool>(currentUserDocument?.seenPrayer, false)) {
        await currentUserReference!.update(createUsersRecordData(
          completedprayer: true,
          showPrayer: true,
        ));
      }
      if ((valueOrDefault(currentUserDocument?.dailyStreak, 0) >= 7) &&
          !valueOrDefault<bool>(currentUserDocument?.seen7, false)) {
        await currentUserReference!.update(createUsersRecordData(
          completed7: true,
          show7: true,
        ));
      }
      if ((valueOrDefault(currentUserDocument?.dailyStreak, 0) >= 30) &&
          !valueOrDefault<bool>(currentUserDocument?.seen30, false)) {
        await currentUserReference!.update(createUsersRecordData(
          completed30: true,
          show30: true,
        ));
      }
      if ((valueOrDefault(currentUserDocument?.dailyStreak, 0) >= 100) &&
          !valueOrDefault<bool>(currentUserDocument?.seen100, false)) {
        await currentUserReference!.update(createUsersRecordData(
          completed100: true,
          show100: true,
        ));
      }
      if ((valueOrDefault(currentUserDocument?.dailyStreak, 0) >= 200) &&
          !valueOrDefault<bool>(currentUserDocument?.seen200, false)) {
        await currentUserReference!.update(createUsersRecordData(
          completed200: true,
          show200: true,
        ));
      }
      if ((valueOrDefault(currentUserDocument?.dailyStreak, 0) >= 365) &&
          !valueOrDefault<bool>(currentUserDocument?.seen365, false)) {
        await currentUserReference!.update(createUsersRecordData(
          completed365: true,
          show365: true,
        ));
      }
      _model.timerController.onStartTimer();
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 6000),
        callback: (timer) async {
          if (_model.pageViewCurrentIndex == 2) {
            await _model.pageViewController?.animateToPage(
              0,
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          } else {
            await _model.pageViewController?.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          }
        },
        startImmediately: false,
      );
    });

    _model.expandableController1 = ExpandableController(initialExpanded: false);
    _model.expandableController2 = ExpandableController(initialExpanded: false);
    _model.expandableController3 = ExpandableController(initialExpanded: false);

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<List<MessageChatsRecord>>(
      stream: queryMessageChatsRecord(
        queryBuilder: (messageChatsRecord) => messageChatsRecord
            .where(
              'archived',
              isEqualTo: false,
            )
            .where(
              'userswithIndicator',
              arrayContains: currentUserReference,
            )
            .orderBy('lastMessageTime', descending: true),
      )..listen((snapshot) async {
          List<MessageChatsRecord> homePageMessageChatsRecordList = snapshot;
          if (_model.homePagePreviousSnapshot != null &&
              !const ListEquality(MessageChatsRecordDocumentEquality()).equals(
                  homePageMessageChatsRecordList,
                  _model.homePagePreviousSnapshot)) {
            _model.timerController.onStartTimer();

            setState(() {});
          }
          _model.homePagePreviousSnapshot = snapshot;
        }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).systemBackground,
            body: Center(
              child: SizedBox(
                width: 75.0,
                height: 75.0,
                child: SpinKitRipple(
                  color: Color(0xFF7F95AD),
                  size: 75.0,
                ),
              ),
            ),
          );
        }
        List<MessageChatsRecord> homePageMessageChatsRecordList =
            snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).systemBackground,
          endDrawer: Container(
            width: double.infinity,
            child: WebViewAware(
                child: Drawer(
              elevation: 16.0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 60.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '91hxo5di' /* Settings */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 25.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.dark)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    6.0,
                                                                    6.0,
                                                                    6.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/moon-fill_(1).svg',
                                                          width: 25.0,
                                                          height: 25.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      SelectionArea(
                                                          child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'i151cczt' /* Dark Mode */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                ),
                                                      )),
                                                    ],
                                                  ),
                                                ),
                                              if (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    6.0,
                                                                    6.0,
                                                                    6.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/sun-dim-fill_(1).svg',
                                                          width: 28.0,
                                                          height: 28.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      SelectionArea(
                                                          child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '7as0kl2f' /* Light Mode */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                ),
                                                      )),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 100.0,
                                        height: 150.0,
                                        decoration: BoxDecoration(),
                                      ),
                                    ),
                                    Stack(
                                      alignment: AlignmentDirectional(
                                          0.1, 0.44999999999999996),
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 60.0, 0.0, 0.0),
                                          child: Container(
                                            width: 85.0,
                                            height: 85.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(2.0, 2.0, 2.0, 2.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl:
                                                        valueOrDefault<String>(
                                                      currentUserPhoto,
                                                      'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                                                    ),
                                                    width: 100.0,
                                                    height: 100.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 25.0, 5.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor:
                                              FlutterFlowTheme.of(context)
                                                  .opagueSeparator,
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                                child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: SeasonsUpdateWidget(
                                                userUpdating:
                                                    currentUserReference,
                                              ),
                                            ));
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                3.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondarySystemBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: Icon(
                                                  Icons.bookmarks_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 18.0,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'k6js125n' /* Edit Loading Screen */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 16.0,
                                                        ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                ),
                                              ),
                                              FaIcon(
                                                FontAwesomeIcons.chevronRight,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 18.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation9']!),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 20.0, 5.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          3.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondarySystemBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.solidBell,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 18.0,
                                              ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '7ds4mw68' /* General Notifications */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 16.0,
                                                      ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(),
                                              ),
                                            ),
                                            AuthUserStreamWidget(
                                              builder: (context) => Switch(
                                                value: _model.switchValue ??=
                                                    valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.notificationsON,
                                                        false),
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                      .switchValue = newValue!);
                                                  if (newValue!) {
                                                    await currentUserReference!
                                                        .update(
                                                            createUsersRecordData(
                                                      notificationsON: true,
                                                    ));
                                                  } else {
                                                    await currentUserReference!
                                                        .update(
                                                            createUsersRecordData(
                                                      notificationsON: false,
                                                    ));
                                                  }
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .worshipRing,
                                                activeTrackColor:
                                                    FlutterFlowTheme.of(context)
                                                        .label,
                                                inactiveTrackColor:
                                                    FlutterFlowTheme.of(context)
                                                        .lightSecondaryText,
                                                inactiveThumbColor:
                                                    Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation10']!),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 20.0, 5.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await launchURL(
                                            'https://app.termly.io/document/privacy-policy/96aceb9d-0f48-466e-9523-de70d2ac3465');
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                3.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondarySystemBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: Icon(
                                                  Icons.privacy_tip_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 18.0,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '4ia0f4zr' /* Privacy Policy */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 16.0,
                                                        ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: 10.0,
                                                  height: 20.0,
                                                  decoration: BoxDecoration(),
                                                ),
                                              ),
                                              FaIcon(
                                                FontAwesomeIcons.chevronRight,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 18.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation11']!),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 20.0, 5.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await launchURL(
                                            'https://app.termly.io/document/terms-of-use-for-saas/5034d5f0-b88e-4e23-aa62-fb7cda327fdc');
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                3.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondarySystemBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: Icon(
                                                  Icons.qr_code_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 18.0,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'qi9xx8kl' /* Terms of Service */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 16.0,
                                                        ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                ),
                                              ),
                                              FaIcon(
                                                FontAwesomeIcons.chevronRight,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 18.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation12']!),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 20.0, 5.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await launchURL(
                                            'https://app.termly.io/document/acceptable-use-policy/aa25a736-caf9-47c0-b452-a6791e7df437');
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                3.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondarySystemBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: Icon(
                                                  Icons.rule_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 18.0,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'upxhvh0j' /* Community Guidelines */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 16.0,
                                                        ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                ),
                                              ),
                                              FaIcon(
                                                FontAwesomeIcons.chevronRight,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 18.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation13']!),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 20.0, 5.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await launchURL(
                                            'mailto:support@genesisapp.church');
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                3.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondarySystemBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons
                                                      .questionCircle,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 18.0,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'dvhahgzx' /* Support */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 16.0,
                                                        ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                ),
                                              ),
                                              FaIcon(
                                                FontAwesomeIcons.chevronRight,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 18.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation14']!),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 20.0, 5.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondarySystemBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: FlutterFlowLanguageSelector(
                                              width: double.infinity,
                                              backgroundColor: FlutterFlowTheme
                                                      .of(context)
                                                  .secondarySystemBackground,
                                              borderColor: FlutterFlowTheme.of(
                                                      context)
                                                  .secondarySystemBackground,
                                              dropdownColor: FlutterFlowTheme
                                                      .of(context)
                                                  .secondarySystemBackground,
                                              dropdownIconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              borderRadius: 8.0,
                                              textStyle: GoogleFonts.getFont(
                                                'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16.0,
                                              ),
                                              hideFlags: false,
                                              flagTextGap: 12.0,
                                              currentLanguage:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                              languages:
                                                  FFLocalizations.languages(),
                                              onChanged: (lang) =>
                                                  setAppLanguage(context, lang),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation15']!),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 5.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 100.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            Navigator.pop(context);
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 10.0, 0.0),
                                                child: Icon(
                                                  Icons
                                                      .subdirectory_arrow_left_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 24.0,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '3lg9simt' /* Back */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 18.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(),
                                        ),
                                      ),
                                      Container(
                                        width: 100.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            GoRouter.of(context)
                                                .prepareAuthEvent();
                                            await authManager.signOut();
                                            GoRouter.of(context)
                                                .clearRedirectLocation();

                                            context.goNamedAuth(
                                                'onBoarding', context.mounted);
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'kb2dps6g' /* Log Out */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 18.0,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Icon(
                                                  Icons.login_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ),
          body: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Stack(
              alignment: AlignmentDirectional(0.0, 0.0),
              children: [
                Align(
                  alignment: AlignmentDirectional(0.00, -1.00),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context)
                          .secondarySystemBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.06,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: FlutterFlowTimer(
                                        initialTime: _model.timerMilliseconds,
                                        getDisplayTime: (value) =>
                                            StopWatchTimer.getDisplayTime(
                                          value,
                                          hours: false,
                                          milliSecond: false,
                                        ),
                                        controller: _model.timerController,
                                        updateStateInterval:
                                            Duration(milliseconds: 500),
                                        onChanged:
                                            (value, displayTime, shouldUpdate) {
                                          _model.timerMilliseconds = value;
                                          _model.timerValue = displayTime;
                                          if (shouldUpdate) setState(() {});
                                        },
                                        onEnded: () async {
                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            notificationCount:
                                                homePageMessageChatsRecordList
                                                    .length,
                                          ));
                                          await Future.delayed(const Duration(
                                              milliseconds: 1000));
                                          _model.badgeCount =
                                              await actions.appBadge(
                                            valueOrDefault(
                                                currentUserDocument
                                                    ?.notificationCount,
                                                0),
                                          );

                                          setState(() {});
                                        },
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.transparent,
                                              fontSize: 12.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 5.0, 20.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setDarkModeSetting(
                                              context, ThemeMode.light);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.dark)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 6.0, 6.0, 6.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      setDarkModeSetting(
                                                          context,
                                                          ThemeMode.light);
                                                    },
                                                    child: SvgPicture.asset(
                                                      'assets/images/sun-dim-fill_(1).svg',
                                                      width: 35.0,
                                                      height: 35.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              if (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      setDarkModeSetting(
                                                          context,
                                                          ThemeMode.dark);
                                                    },
                                                    child: SvgPicture.asset(
                                                      'assets/images/moon-fill_(1).svg',
                                                      width: 30.0,
                                                      height: 30.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    StreamBuilder<List<LiveServicesRecord>>(
                                      stream: queryLiveServicesRecord(
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 75.0,
                                              height: 75.0,
                                              child: SpinKitRipple(
                                                color: Color(0xFF7F95AD),
                                                size: 75.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<LiveServicesRecord>
                                            stackLiveServicesRecordList =
                                            snapshot.data!;
                                        final stackLiveServicesRecord =
                                            stackLiveServicesRecordList
                                                    .isNotEmpty
                                                ? stackLiveServicesRecordList
                                                    .first
                                                : null;
                                        return Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            if (stackLiveServicesRecord
                                                    ?.visibleBanner ==
                                                false)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Container(
                                                  width: 200.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            Container(
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .systemGray5,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            border: Border.all(
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                dateTimeFormat(
                                                                          'yMMMd',
                                                                          currentUserDocument
                                                                              ?.dateofCompletion,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ) ==
                                                                        dateTimeFormat(
                                                                          'yMMMd',
                                                                          getCurrentTimestamp,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .worshipRing
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .systemGray5,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .systemGray5,
                                                              ),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        6.0,
                                                                        0.0,
                                                                        6.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                if (dateTimeFormat(
                                                                      'yMMMd',
                                                                      currentUserDocument
                                                                          ?.dateofCompletion,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ) !=
                                                                    dateTimeFormat(
                                                                      'yMMMd',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        Theme.of(context).brightness ==
                                                                                Brightness.dark
                                                                            ? 'assets/images/feather-duotone_(darkmode).svg'
                                                                            : 'assets/images/feather-duotone_(lightmode).svg',
                                                                        width:
                                                                            20.0,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (dateTimeFormat(
                                                                      'yMMMd',
                                                                      currentUserDocument
                                                                          ?.dateofCompletion,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ) ==
                                                                    dateTimeFormat(
                                                                      'yMMMd',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        Theme.of(context).brightness ==
                                                                                Brightness.dark
                                                                            ? 'assets/images/feather-duotone_(filled_-_darkmode).svg'
                                                                            : 'assets/images/feather-duotone_(filled_-_lightmode).svg',
                                                                        width:
                                                                            20.0,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      valueOrDefault(
                                                                              currentUserDocument?.dailyStreak,
                                                                              0)
                                                                          .toString(),
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).quaternaryLabel,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    6.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'yrs2xst1' /* Journal Streak */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .quaternaryLabel,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            if (stackLiveServicesRecord
                                                    ?.visibleBanner ==
                                                true)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await launchURL(
                                                        stackLiveServicesRecord!
                                                            .liveServiceURL);
                                                  },
                                                  child: Container(
                                                    width: 215.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .systemBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  6.0,
                                                                  0.0,
                                                                  6.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          RichText(
                                                            textScaleFactor:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaleFactor,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'upz5buc4' /* We're  */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .label,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'l44tq1bm' /* live!  */,
                                                                  ),
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .worshipRing,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '7co1dlgi' /* Click here to join. */,
                                                                  ),
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .label,
                                                                  ),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'richTextOnPageLoadAnimation']!),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        );
                                      },
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          scaffoldKey.currentState!
                                              .openEndDrawer();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.dark)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 6.0, 6.0, 6.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/user-circle-gear-fill.svg',
                                                    width: 35.0,
                                                    height: 35.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              if (!(Theme.of(context)
                                                      .brightness ==
                                                  Brightness.dark))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 6.0, 6.0, 6.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/user-circle-gear-fill_(1).svg',
                                                    width: 35.0,
                                                    height: 35.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.01,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'drstqp7s' /* Hello, */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryLabel,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          currentUserDisplayName,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .label,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ).animateOnPageLoad(
                                    animationsMap['rowOnPageLoadAnimation1']!),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'gy0bu9tu' /* Here's your resources for toda... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryLabel,
                                      ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.01,
                                decoration: BoxDecoration(),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 16.0, 12.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    StreamBuilder<
                                        List<DailyPracticeVideosRecord>>(
                                      stream: queryDailyPracticeVideosRecord(
                                        queryBuilder:
                                            (dailyPracticeVideosRecord) =>
                                                dailyPracticeVideosRecord.where(
                                          'worshipPractice',
                                          isEqualTo: true,
                                        ),
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 75.0,
                                              height: 75.0,
                                              child: SpinKitRipple(
                                                color: Color(0xFF7F95AD),
                                                size: 75.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<DailyPracticeVideosRecord>
                                            stackDailyPracticeVideosRecordList =
                                            snapshot.data!;
                                        final stackDailyPracticeVideosRecord =
                                            stackDailyPracticeVideosRecordList
                                                    .isNotEmpty
                                                ? stackDailyPracticeVideosRecordList
                                                    .first
                                                : null;
                                        return Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.29,
                                              height: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.29,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondarySystemBackground,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.completed1,
                                                    false))
                                                  AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.11,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.05,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          if (Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark)
                                                            SvgPicture.asset(
                                                              'assets/images/flame-fill_(3).svg',
                                                              width: 40.0,
                                                              height: 40.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          if (!(Theme.of(
                                                                      context)
                                                                  .brightness ==
                                                              Brightness.dark))
                                                            SvgPicture.asset(
                                                              'assets/images/flame-fill_(1).svg',
                                                              width: 40.0,
                                                              height: 40.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                if (!valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.completed1,
                                                    false))
                                                  AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.11,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.05,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.light)
                                                            SvgPicture.asset(
                                                              'assets/images/flame-fill_(4).svg',
                                                              width: 40.0,
                                                              height: 40.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          if (Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark)
                                                            SvgPicture.asset(
                                                              'assets/images/flame-fill_(5).svg',
                                                              width: 40.0,
                                                              height: 40.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            if (valueOrDefault<bool>(
                                                currentUserDocument?.completed1,
                                                false))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      CircularPercentIndicator(
                                                    percent: valueOrDefault(
                                                            currentUserDocument
                                                                ?.percentageCompleted1,
                                                            0)
                                                        .toDouble(),
                                                    radius: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.145,
                                                    lineWidth: 6.0,
                                                    animation: true,
                                                    animateFromLastPercent:
                                                        true,
                                                    progressColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .worshipRing,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .systemGray5,
                                                  ),
                                                ),
                                              ),
                                            if (!valueOrDefault<bool>(
                                                currentUserDocument?.completed1,
                                                false))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      CircularPercentIndicator(
                                                    percent: 1.0,
                                                    radius: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.145,
                                                    lineWidth: 6.0,
                                                    animation: true,
                                                    animateFromLastPercent:
                                                        true,
                                                    progressColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .worshipRing,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .systemGray5,
                                                  ).animateOnPageLoad(animationsMap[
                                                          'progressBarOnPageLoadAnimation1']!),
                                                ),
                                              ),
                                          ],
                                        );
                                      },
                                    ),
                                    StreamBuilder<
                                        List<DailyPracticeVideosRecord>>(
                                      stream: queryDailyPracticeVideosRecord(
                                        queryBuilder:
                                            (dailyPracticeVideosRecord) =>
                                                dailyPracticeVideosRecord.where(
                                          'scripturePractice',
                                          isEqualTo: true,
                                        ),
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 75.0,
                                              height: 75.0,
                                              child: SpinKitRipple(
                                                color: Color(0xFF7F95AD),
                                                size: 75.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<DailyPracticeVideosRecord>
                                            stackDailyPracticeVideosRecordList =
                                            snapshot.data!;
                                        final stackDailyPracticeVideosRecord =
                                            stackDailyPracticeVideosRecordList
                                                    .isNotEmpty
                                                ? stackDailyPracticeVideosRecordList
                                                    .first
                                                : null;
                                        return Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.29,
                                              height: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.29,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondarySystemBackground,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (valueOrDefault<bool>(
                                                currentUserDocument?.completed2,
                                                false))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      CircularPercentIndicator(
                                                    percent: valueOrDefault(
                                                            currentUserDocument
                                                                ?.percentageCompleted2,
                                                            0)
                                                        .toDouble(),
                                                    radius: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.145,
                                                    lineWidth: 6.0,
                                                    animation: true,
                                                    animateFromLastPercent:
                                                        true,
                                                    progressColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .scriptureRing,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .systemGray5,
                                                  ),
                                                ),
                                              ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.completed2,
                                                    false))
                                                  AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.11,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.05,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          if (Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark)
                                                            SvgPicture.asset(
                                                              'assets/images/bookmarks-simple-fill_(1).svg',
                                                              width: 40.0,
                                                              height: 40.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          if (!(Theme.of(
                                                                      context)
                                                                  .brightness ==
                                                              Brightness.dark))
                                                            SvgPicture.asset(
                                                              'assets/images/bookmarks-simple-fill.svg',
                                                              width: 40.0,
                                                              height: 40.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                if (!valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.completed2,
                                                    false))
                                                  AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.11,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.05,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.light)
                                                            SvgPicture.asset(
                                                              'assets/images/bookmarks-simple-fill_(5).svg',
                                                              width: 40.0,
                                                              height: 40.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          if (Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark)
                                                            SvgPicture.asset(
                                                              'assets/images/bookmarks-simple-fill_(6).svg',
                                                              width: 40.0,
                                                              height: 40.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            if (!valueOrDefault<bool>(
                                                currentUserDocument?.completed2,
                                                false))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      CircularPercentIndicator(
                                                    percent: 1.0,
                                                    radius: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.145,
                                                    lineWidth: 6.0,
                                                    animation: true,
                                                    animateFromLastPercent:
                                                        true,
                                                    progressColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .scriptureRing,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .systemGray5,
                                                  ).animateOnPageLoad(animationsMap[
                                                          'progressBarOnPageLoadAnimation2']!),
                                                ),
                                              ),
                                          ],
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 2.0, 0.0),
                                      child: StreamBuilder<
                                          List<DailyPracticeVideosRecord>>(
                                        stream: queryDailyPracticeVideosRecord(
                                          queryBuilder:
                                              (dailyPracticeVideosRecord) =>
                                                  dailyPracticeVideosRecord
                                                      .where(
                                            'prayerPractice',
                                            isEqualTo: true,
                                          ),
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 75.0,
                                                height: 75.0,
                                                child: SpinKitRipple(
                                                  color: Color(0xFF7F95AD),
                                                  size: 75.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<DailyPracticeVideosRecord>
                                              stackDailyPracticeVideosRecordList =
                                              snapshot.data!;
                                          final stackDailyPracticeVideosRecord =
                                              stackDailyPracticeVideosRecordList
                                                      .isNotEmpty
                                                  ? stackDailyPracticeVideosRecordList
                                                      .first
                                                  : null;
                                          return Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.29,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.29,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondarySystemBackground,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.complete3,
                                                  false))
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        CircularPercentIndicator(
                                                      percent: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.percentageCompleted3,
                                                              0)
                                                          .toDouble(),
                                                      radius: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.145,
                                                      lineWidth: 6.0,
                                                      animation: true,
                                                      animateFromLastPercent:
                                                          true,
                                                      progressColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .prayerRing,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .systemGray5,
                                                    ),
                                                  ),
                                                ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.complete3,
                                                      false))
                                                    AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.11,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.05,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            if (Theme.of(
                                                                        context)
                                                                    .brightness ==
                                                                Brightness.dark)
                                                              SvgPicture.asset(
                                                                'assets/images/hands-clapping-fill_(3).svg',
                                                                width: 40.0,
                                                                height: 40.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            if (!(Theme.of(
                                                                        context)
                                                                    .brightness ==
                                                                Brightness
                                                                    .dark))
                                                              SvgPicture.asset(
                                                                'assets/images/hands-clapping-fill_(7).svg',
                                                                width: 40.0,
                                                                height: 40.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  if (!valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.complete3,
                                                      false))
                                                    AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.11,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.05,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (Theme.of(
                                                                        context)
                                                                    .brightness ==
                                                                Brightness
                                                                    .light)
                                                              SvgPicture.asset(
                                                                'assets/images/hands-clapping-fill_(7).svg',
                                                                width: 40.0,
                                                                height: 40.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            if (Theme.of(
                                                                        context)
                                                                    .brightness ==
                                                                Brightness.dark)
                                                              SvgPicture.asset(
                                                                'assets/images/hands-clapping-fill_(8).svg',
                                                                width: 40.0,
                                                                height: 40.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                              if (!valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.complete3,
                                                  false))
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        CircularPercentIndicator(
                                                      percent: 1.0,
                                                      radius: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.145,
                                                      lineWidth: 6.0,
                                                      animation: true,
                                                      animateFromLastPercent:
                                                          true,
                                                      progressColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .prayerRing,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .systemGray5,
                                                    ).animateOnPageLoad(
                                                            animationsMap[
                                                                'progressBarOnPageLoadAnimation3']!),
                                                  ),
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ).animateOnPageLoad(
                                    animationsMap['rowOnPageLoadAnimation2']!),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25.0, 12.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      StreamBuilder<List<UsersRecord>>(
                                        stream: queryUsersRecord(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord
                                                  .where(
                                                    'completed_1',
                                                    isEqualTo: true,
                                                  )
                                                  .where(
                                                    'completed_2',
                                                    isEqualTo: true,
                                                  )
                                                  .where(
                                                    'complete_3',
                                                    isEqualTo: true,
                                                  )
                                                  .where(
                                                    'dateofCompletion',
                                                    isEqualTo:
                                                        functions.getDayDate(),
                                                  ),
                                          limit: 4,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 75.0,
                                                height: 75.0,
                                                child: SpinKitRipple(
                                                  color: Color(0xFF7F95AD),
                                                  size: 75.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<UsersRecord> rowUsersRecordList =
                                              snapshot.data!;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                rowUsersRecordList.length,
                                                (rowIndex) {
                                              final rowUsersRecord =
                                                  rowUsersRecordList[rowIndex];
                                              return Align(
                                                alignment: AlignmentDirectional(
                                                    -0.98, 0.00),
                                                child: Container(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image:
                                                          CachedNetworkImageProvider(
                                                        valueOrDefault<String>(
                                                          rowUsersRecord
                                                              .photoUrl,
                                                          'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                                                        ),
                                                      ),
                                                    ),
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.80, 0.00),
                                                ).animateOnPageLoad(animationsMap[
                                                    'containerOnPageLoadAnimation2']!),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.50, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
                                          child:
                                              StreamBuilder<List<UsersRecord>>(
                                            stream: queryUsersRecord(
                                              queryBuilder: (usersRecord) =>
                                                  usersRecord
                                                      .where(
                                                        'completed_1',
                                                        isEqualTo: true,
                                                      )
                                                      .where(
                                                        'completed_2',
                                                        isEqualTo: true,
                                                      )
                                                      .where(
                                                        'complete_3',
                                                        isEqualTo: true,
                                                      )
                                                      .where(
                                                        'dateofCompletion',
                                                        isEqualTo: functions
                                                            .getDayDate(),
                                                      ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 75.0,
                                                    height: 75.0,
                                                    child: SpinKitRipple(
                                                      color: Color(0xFF7F95AD),
                                                      size: 75.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<UsersRecord>
                                                  containerUsersRecordList =
                                                  snapshot.data!;
                                              return Container(
                                                height: 30.0,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (containerUsersRecordList
                                                            .length >
                                                        4)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.00, 0.00),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '6czfhn4v' /* + */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                              ),
                                                        ),
                                                      ),
                                                    if (containerUsersRecordList
                                                            .length ==
                                                        0)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.00, 0.00),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '3gngcohu' /* 0 */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                              ),
                                                        ),
                                                      ),
                                                    if (containerUsersRecordList
                                                            .length >
                                                        4)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.00, 0.00),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            (containerUsersRecordList
                                                                        .length -
                                                                    4)
                                                                .toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                              ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'containerOnPageLoadAnimation3']!);
                                            },
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.35),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '5of9i4o4' /* have completed! */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Source Sans Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                ),
                                          ).animateOnPageLoad(animationsMap[
                                              'textOnPageLoadAnimation']!),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    if (!FFAppState().recentActivity)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25.0, 16.0, 25.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'nf1uy9uj' /* Recent Activity */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .lightSecondaryText,
                                                      ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  FFAppState().recentActivity =
                                                      true;
                                                });
                                              },
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '5tk0053j' /* Show */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lightSecondaryText,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (FFAppState().recentActivity)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25.0, 16.0, 25.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'nqqrnbnu' /* Recent Activity */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .lightSecondaryText,
                                                      ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 2.0,
                                                decoration: BoxDecoration(),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  FFAppState().recentActivity =
                                                      false;
                                                });
                                              },
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'f8zsg8mr' /* Hide */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lightSecondaryText,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (FFAppState().recentActivity)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            18.0, 0.0, 18.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 75.0,
                                          decoration: BoxDecoration(),
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 8.0),
                                                child: PageView(
                                                  controller: _model
                                                          .pageViewController ??=
                                                      PageController(
                                                          initialPage: 0),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  children: [
                                                    StreamBuilder<
                                                        List<
                                                            MessageChatsRecord>>(
                                                      stream:
                                                          queryMessageChatsRecord(
                                                        queryBuilder:
                                                            (messageChatsRecord) =>
                                                                messageChatsRecord
                                                                    .where(
                                                                      'users',
                                                                      arrayContains:
                                                                          currentUserReference,
                                                                    )
                                                                    .where(
                                                                      'archived',
                                                                      isEqualTo:
                                                                          false,
                                                                    ),
                                                        limit: 1,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 75.0,
                                                              height: 75.0,
                                                              child:
                                                                  SpinKitRipple(
                                                                color: Color(
                                                                    0xFF7F95AD),
                                                                size: 75.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<MessageChatsRecord>
                                                            containerMessageChatsRecordList =
                                                            snapshot.data!;
                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        6.0,
                                                                        6.0,
                                                                        6.0,
                                                                        6.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                if (valueOrDefault<
                                                                    bool>(
                                                                  containerMessageChatsRecordList
                                                                          .length >=
                                                                      1,
                                                                  false,
                                                                ))
                                                                  Expanded(
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            MessageChatsRecord>>(
                                                                      stream:
                                                                          queryMessageChatsRecord(
                                                                        queryBuilder: (messageChatsRecord) => messageChatsRecord
                                                                            .where(
                                                                              'users',
                                                                              arrayContains: currentUserReference,
                                                                            )
                                                                            .where(
                                                                              'archived',
                                                                              isEqualTo: false,
                                                                            )
                                                                            .orderBy('lastMessageTime', descending: true),
                                                                        limit:
                                                                            1,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 75.0,
                                                                              height: 75.0,
                                                                              child: SpinKitRipple(
                                                                                color: Color(0xFF7F95AD),
                                                                                size: 75.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<MessageChatsRecord>
                                                                            containerMessageChatsRecordList =
                                                                            snapshot.data!;
                                                                        return Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.08,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          child:
                                                                              StreamBuilder<UsersRecord>(
                                                                            stream:
                                                                                UsersRecord.getDocument(containerMessageChatsRecordList.first.otherUser!),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 75.0,
                                                                                    height: 75.0,
                                                                                    child: SpinKitRipple(
                                                                                      color: Color(0xFF7F95AD),
                                                                                      size: 75.0,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              final containerUsersRecord = snapshot.data!;
                                                                              return Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondarySystemBackground,
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                  border: Border.all(
                                                                                    color: containerMessageChatsRecordList.first.pastoralRequest ? FlutterFlowTheme.of(context).worshipRing : Color(0x00000000),
                                                                                    width: 3.0,
                                                                                  ),
                                                                                ),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    context.pushNamed(
                                                                                      'ChatPage',
                                                                                      queryParameters: {
                                                                                        'chatChosen': serializeParam(
                                                                                          containerMessageChatsRecordList.first,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                        'otherUserRef': serializeParam(
                                                                                          containerMessageChatsRecordList.first.otherUser,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'otherUserDoc': serializeParam(
                                                                                          containerUsersRecord,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'chatChosen': containerMessageChatsRecordList.first,
                                                                                        'otherUserDoc': containerUsersRecord,
                                                                                      },
                                                                                    );

                                                                                    await containerMessageChatsRecordList.first.reference.update({
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'userswithIndicator': FieldValue.arrayRemove([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                  },
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              if (containerMessageChatsRecordList.first.users.length <= 2)
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                  child: AuthUserStreamWidget(
                                                                                                    builder: (context) => Container(
                                                                                                      width: 35.0,
                                                                                                      height: 35.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: Colors.transparent,
                                                                                                        image: DecorationImage(
                                                                                                          fit: BoxFit.cover,
                                                                                                          image: CachedNetworkImageProvider(
                                                                                                            valueOrDefault<String>(
                                                                                                              containerMessageChatsRecordList.first.groupBackground != null && containerMessageChatsRecordList.first.groupBackground != '' ? containerMessageChatsRecordList.first.groupBackground : (containerMessageChatsRecordList.first.lastMessageSentBy == currentUserReference ? currentUserPhoto : containerUsersRecord.photoUrl),
                                                                                                              'https://www.chocolatebayou.org/wp-content/uploads/No-Image-Person-2048x2048.jpeg',
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        shape: BoxShape.circle,
                                                                                                        border: Border.all(
                                                                                                          color: Colors.transparent,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              if (containerMessageChatsRecordList.first.users.length >= 3)
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 0.0, 0.0),
                                                                                                  child: Container(
                                                                                                    width: 40.0,
                                                                                                    height: 40.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Colors.transparent,
                                                                                                      image: DecorationImage(
                                                                                                        fit: BoxFit.cover,
                                                                                                        image: CachedNetworkImageProvider(
                                                                                                          valueOrDefault<String>(
                                                                                                            containerMessageChatsRecordList.first.groupBackground,
                                                                                                            'https://images.unsplash.com/photo-1502810365585-56ffa361fdde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(6.0),
                                                                                                      shape: BoxShape.rectangle,
                                                                                                      border: Border.all(
                                                                                                        color: Colors.transparent,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            if (containerMessageChatsRecordList.first.users.length <= 2)
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  containerMessageChatsRecordList.first.groupName != null && containerMessageChatsRecordList.first.groupName != '' ? containerMessageChatsRecordList.first.groupName : containerMessageChatsRecordList.first.lastMessageSentByName,
                                                                                                  'Guest User',
                                                                                                ).maybeHandleOverflow(
                                                                                                  maxChars: 25,
                                                                                                  replacement: '…',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).label,
                                                                                                      fontSize: 15.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                              ),
                                                                                            if (containerMessageChatsRecordList.first.users.length >= 3)
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  containerMessageChatsRecordList.first.groupName,
                                                                                                  'Group Chat',
                                                                                                ).maybeHandleOverflow(
                                                                                                  maxChars: 25,
                                                                                                  replacement: '…',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).label,
                                                                                                      fontSize: 15.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                              ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'uwgbneg7' /* New message: */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Inter',
                                                                                                        color: FlutterFlowTheme.of(context).placeholderText,
                                                                                                        fontSize: 12.0,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    containerMessageChatsRecordList.first.lastMessage.maybeHandleOverflow(
                                                                                                      maxChars: 20,
                                                                                                      replacement: '…',
                                                                                                    ),
                                                                                                    maxLines: 1,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: FlutterFlowTheme.of(context).placeholderText,
                                                                                                          fontSize: 12.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Container(
                                                                                          width: 100.0,
                                                                                          height: 100.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Colors.transparent,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Icon(
                                                                                        Icons.keyboard_arrow_right,
                                                                                        color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                        size: 30.0,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                if (containerMessageChatsRecordList
                                                                        .length ==
                                                                    0)
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.08,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.08,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondarySystemBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.00,
                                                                              0.00),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'x5wrj1f2' /* You have no messages... Yet! */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).secondaryLabel,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  6.0,
                                                                  6.0,
                                                                  6.0,
                                                                  6.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.1,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: FutureBuilder<
                                                            List<
                                                                ResourceVideosRecord>>(
                                                          future:
                                                              queryResourceVideosRecordOnce(
                                                            queryBuilder: (resourceVideosRecord) =>
                                                                resourceVideosRecord.orderBy(
                                                                    'time_uploaded',
                                                                    descending:
                                                                        true),
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 75.0,
                                                                  height: 75.0,
                                                                  child:
                                                                      SpinKitRipple(
                                                                    color: Color(
                                                                        0xFF7F95AD),
                                                                    size: 75.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<ResourceVideosRecord>
                                                                containerResourceVideosRecordList =
                                                                snapshot.data!;
                                                            // Return an empty Container when the item does not exist.
                                                            if (snapshot.data!
                                                                .isEmpty) {
                                                              return Container();
                                                            }
                                                            final containerResourceVideosRecord =
                                                                containerResourceVideosRecordList
                                                                        .isNotEmpty
                                                                    ? containerResourceVideosRecordList
                                                                        .first
                                                                    : null;
                                                            return InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return WebViewAware(
                                                                        child:
                                                                            Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          VideoDetailsBSWidget(
                                                                        videoChosenRef:
                                                                            containerResourceVideosRecord!.reference,
                                                                        videoChosenDoc:
                                                                            containerResourceVideosRecord!,
                                                                      ),
                                                                    ));
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                        () {}));
                                                              },
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondarySystemBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 3.0,
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                width: 60.0,
                                                                                height: 40.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.transparent,
                                                                                  image: DecorationImage(
                                                                                    fit: BoxFit.cover,
                                                                                    image: CachedNetworkImageProvider(
                                                                                      containerResourceVideosRecord!.imageThumbnail,
                                                                                    ),
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                  shape: BoxShape.rectangle,
                                                                                  border: Border.all(
                                                                                    color: Colors.transparent,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            containerResourceVideosRecord!.videoName.maybeHandleOverflow(
                                                                              maxChars: 25,
                                                                              replacement: '…',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).label,
                                                                                  fontSize: 15.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                '${containerResourceVideosRecord?.speaker} |'.maybeHandleOverflow(
                                                                                  maxChars: 50,
                                                                                  replacement: '…',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).placeholderText,
                                                                                      fontSize: 12.0,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  dateTimeFormat(
                                                                                    'MMMEd',
                                                                                    containerResourceVideosRecord!.timeUploaded!,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ).maybeHandleOverflow(
                                                                                    maxChars: 20,
                                                                                    replacement: '…',
                                                                                  ),
                                                                                  maxLines: 1,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).placeholderText,
                                                                                        fontSize: 12.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.transparent,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .keyboard_arrow_right,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .lightSecondaryText,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  6.0,
                                                                  6.0,
                                                                  6.0,
                                                                  6.0),
                                                      child: FutureBuilder<
                                                          List<
                                                              PrayerRequestsRecord>>(
                                                        future:
                                                            queryPrayerRequestsRecordOnce(
                                                          queryBuilder: (prayerRequestsRecord) =>
                                                              prayerRequestsRecord
                                                                  .where(
                                                                    'public',
                                                                    isEqualTo:
                                                                        true,
                                                                  )
                                                                  .orderBy(
                                                                      'timeUploaded',
                                                                      descending:
                                                                          true),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 75.0,
                                                                height: 75.0,
                                                                child:
                                                                    SpinKitRipple(
                                                                  color: Color(
                                                                      0xFF7F95AD),
                                                                  size: 75.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<PrayerRequestsRecord>
                                                              containerPrayerRequestsRecordList =
                                                              snapshot.data!;
                                                          // Return an empty Container when the item does not exist.
                                                          if (snapshot
                                                              .data!.isEmpty) {
                                                            return Container();
                                                          }
                                                          final containerPrayerRequestsRecord =
                                                              containerPrayerRequestsRecordList
                                                                      .isNotEmpty
                                                                  ? containerPrayerRequestsRecordList
                                                                      .first
                                                                  : null;
                                                          return Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.08,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            child: FutureBuilder<
                                                                UsersRecord>(
                                                              future: UsersRecord
                                                                  .getDocumentOnce(
                                                                      containerPrayerRequestsRecord!
                                                                          .user!),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          75.0,
                                                                      height:
                                                                          75.0,
                                                                      child:
                                                                          SpinKitRipple(
                                                                        color: Color(
                                                                            0xFF7F95AD),
                                                                        size:
                                                                            75.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final containerUsersRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondarySystemBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          3.0,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context.goNamed(
                                                                          'CommunityPrayerPage');
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                35.0,
                                                                            height:
                                                                                35.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.transparent,
                                                                              image: DecorationImage(
                                                                                fit: BoxFit.cover,
                                                                                image: CachedNetworkImageProvider(
                                                                                  valueOrDefault<String>(
                                                                                    containerUsersRecord.photoUrl,
                                                                                    'https://www.chocolatebayou.org/wp-content/uploads/No-Image-Person-2048x2048.jpeg',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              shape: BoxShape.circle,
                                                                              border: Border.all(
                                                                                color: Colors.transparent,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'h6sshw6d' /* Prayer Request */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).label,
                                                                                      fontSize: 15.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      containerUsersRecord.displayName,
                                                                                      'Guest User',
                                                                                    ).maybeHandleOverflow(
                                                                                      maxChars: 20,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    maxLines: 1,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: FlutterFlowTheme.of(context).placeholderText,
                                                                                          fontSize: 12.0,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    ' | ${dateTimeFormat(
                                                                                      'MEd',
                                                                                      containerPrayerRequestsRecord?.timeUploaded,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    )}'
                                                                                        .maybeHandleOverflow(
                                                                                      maxChars: 50,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: FlutterFlowTheme.of(context).placeholderText,
                                                                                          fontSize: 12.0,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.transparent,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Icon(
                                                                          Icons
                                                                              .keyboard_arrow_right,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lightSecondaryText,
                                                                          size:
                                                                              30.0,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 1.50),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: smooth_page_indicator
                                                      .SmoothPageIndicator(
                                                    controller: _model
                                                            .pageViewController ??=
                                                        PageController(
                                                            initialPage: 0),
                                                    count: 3,
                                                    axisDirection:
                                                        Axis.horizontal,
                                                    onDotClicked: (i) async {
                                                      await _model
                                                          .pageViewController!
                                                          .animateToPage(
                                                        i,
                                                        duration: Duration(
                                                            milliseconds: 500),
                                                        curve: Curves.ease,
                                                      );
                                                    },
                                                    effect:
                                                        smooth_page_indicator
                                                            .SlideEffect(
                                                      spacing: 8.0,
                                                      radius: 100.0,
                                                      dotWidth: 8.0,
                                                      dotHeight: 8.0,
                                                      dotColor:
                                                          Color(0xFF9E9E9E),
                                                      activeDotColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      paintStyle:
                                                          PaintingStyle.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1.0,
                                indent: 25.0,
                                endIndent: 25.0,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryGreyKinda,
                              ),
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.01,
                                decoration: BoxDecoration(),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 10.0, 16.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(),
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        constraints: BoxConstraints(
                                          maxWidth: double.infinity,
                                        ),
                                        decoration: BoxDecoration(),
                                        child: StreamBuilder<
                                            List<DailyPracticeVideosRecord>>(
                                          stream:
                                              queryDailyPracticeVideosRecord(
                                            queryBuilder:
                                                (dailyPracticeVideosRecord) =>
                                                    dailyPracticeVideosRecord
                                                        .where(
                                                          'worshipPractice',
                                                          isEqualTo: true,
                                                        )
                                                        .where(
                                                          'timeToLaunch',
                                                          isLessThanOrEqualTo:
                                                              getCurrentTimestamp,
                                                        )
                                                        .orderBy('timeToLaunch',
                                                            descending: true),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 75.0,
                                                  height: 75.0,
                                                  child: SpinKitRipple(
                                                    color: Color(0xFF7F95AD),
                                                    size: 75.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<DailyPracticeVideosRecord>
                                                expandableDailyPracticeVideosRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final expandableDailyPracticeVideosRecord =
                                                expandableDailyPracticeVideosRecordList
                                                        .isNotEmpty
                                                    ? expandableDailyPracticeVideosRecordList
                                                        .first
                                                    : null;
                                            return ExpandableNotifier(
                                              controller:
                                                  _model.expandableController1,
                                              child: ExpandablePanel(
                                                header: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 30.0,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .worshipRing,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            if (Theme.of(
                                                                        context)
                                                                    .brightness ==
                                                                Brightness.dark)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            6.0,
                                                                            6.0,
                                                                            6.0),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/images/flame-fill.svg',
                                                                  width: double
                                                                      .infinity,
                                                                  height: 16.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            if (!(Theme.of(
                                                                        context)
                                                                    .brightness ==
                                                                Brightness
                                                                    .dark))
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            5.0),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/images/flame-fill_(2).svg',
                                                                  width: double
                                                                      .infinity,
                                                                  height: 18.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation4']!),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '8qfaivah' /* Worship */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lightSecondaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                collapsed: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  width: 30.0,
                                                                  height: 82.0,
                                                                  child: Stack(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.00,
                                                                            0.00),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              60.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: valueOrDefault<bool>(currentUserDocument?.completed1, false) ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                              size: 3.0,
                                                                            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation1']!),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                        child:
                                                                            AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              FaIcon(
                                                                            FontAwesomeIcons.solidCircle,
                                                                            color: valueOrDefault<bool>(currentUserDocument?.completed1, false)
                                                                                ? FlutterFlowTheme.of(context).tertiary
                                                                                : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                            size:
                                                                                3.0,
                                                                          ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation2']!),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              FaIcon(
                                                                            FontAwesomeIcons.solidCircle,
                                                                            color: valueOrDefault<bool>(currentUserDocument?.completed1, false)
                                                                                ? FlutterFlowTheme.of(context).tertiary
                                                                                : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                            size:
                                                                                3.0,
                                                                          ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation3']!),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            60.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              FaIcon(
                                                                            FontAwesomeIcons.solidCircle,
                                                                            color: valueOrDefault<bool>(currentUserDocument?.completed1, false)
                                                                                ? FlutterFlowTheme.of(context).tertiary
                                                                                : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                            size:
                                                                                3.0,
                                                                          ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation4']!),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.00,
                                                                            0.00),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              80.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: valueOrDefault<bool>(currentUserDocument?.completed1, false) ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                              size: 3.0,
                                                                            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation5']!),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            40.0),
                                                                        child:
                                                                            AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              FaIcon(
                                                                            FontAwesomeIcons.solidCircle,
                                                                            color: valueOrDefault<bool>(currentUserDocument?.completed1, false)
                                                                                ? FlutterFlowTheme.of(context).tertiary
                                                                                : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                            size:
                                                                                3.0,
                                                                          ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation6']!),
                                                                        ),
                                                                      ),
                                                                      AuthUserStreamWidget(
                                                                        builder:
                                                                            (context) =>
                                                                                FaIcon(
                                                                          FontAwesomeIcons
                                                                              .solidCircle,
                                                                          color: valueOrDefault<bool>(currentUserDocument?.completed1, false)
                                                                              ? FlutterFlowTheme.of(context).tertiary
                                                                              : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                          size:
                                                                              3.0,
                                                                        ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation7']!),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            40.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              FaIcon(
                                                                            FontAwesomeIcons.solidCircle,
                                                                            color: valueOrDefault<bool>(currentUserDocument?.completed1, false)
                                                                                ? FlutterFlowTheme.of(context).tertiary
                                                                                : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                            size:
                                                                                3.0,
                                                                          ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation8']!),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.78,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondarySystemBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.006,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.49,
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.transparent,
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    height: 25.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: AutoSizeText(
                                                                                      expandableDailyPracticeVideosRecord!.practiceName,
                                                                                      maxLines: 1,
                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: FlutterFlowTheme.of(context).label,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    height: 18.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.headphonesAlt,
                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                          size: 14.0,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                          child: AutoSizeText(
                                                                                            valueOrDefault<String>(
                                                                                              expandableDailyPracticeVideosRecord?.practiceDescription,
                                                                                              'Worship Video',
                                                                                            ).maybeHandleOverflow(
                                                                                              maxChars: 25,
                                                                                              replacement: '…',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                                  fontSize: 12.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    height: 18.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.clock,
                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                          size: 14.0,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                          child: AutoSizeText(
                                                                                            valueOrDefault<String>(
                                                                                              expandableDailyPracticeVideosRecord?.practiceLength,
                                                                                              '5 minutes',
                                                                                            ).maybeHandleOverflow(
                                                                                              maxChars: 25,
                                                                                              replacement: '…',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                                  fontSize: 12.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.2,
                                                                                height: MediaQuery.sizeOf(context).height * 0.06,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: Container(
                                                                                  width: 100.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).tertiarySystemBackground,
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.00, 0.00),
                                                                                    child: Icon(
                                                                                      Icons.play_arrow_rounded,
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      size: 40.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.006,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'containerOnPageLoadAnimation5']!),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                expanded: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if (!valueOrDefault<
                                                                        bool>(
                                                                    currentUserDocument
                                                                        ?.completed1,
                                                                    false))
                                                                  AuthUserStreamWidget(
                                                                    builder:
                                                                        (context) =>
                                                                            Container(
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          142.0,
                                                                      child:
                                                                          Stack(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.00, 0.00),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                20.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              size: 3.0,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                20.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              size: 3.0,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                120.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              size: 3.0,
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.00, 0.00),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 140.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                40.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              size: 3.0,
                                                                            ),
                                                                          ),
                                                                          FaIcon(
                                                                            FontAwesomeIcons.solidCircle,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                3.0,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                40.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              size: 3.0,
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.00, 0.00),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.00, 0.00),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.00, 0.00),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 120.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                60.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              size: 3.0,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                80.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              size: 3.0,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                100.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              size: 3.0,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                    currentUserDocument
                                                                        ?.completed1,
                                                                    false))
                                                                  AuthUserStreamWidget(
                                                                    builder:
                                                                        (context) =>
                                                                            Container(
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          142.0,
                                                                      child:
                                                                          Stack(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.00, 0.00),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                20.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              size: 3.0,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                20.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              size: 3.0,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                120.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              size: 3.0,
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.00, 0.00),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 140.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                40.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              size: 3.0,
                                                                            ),
                                                                          ),
                                                                          FaIcon(
                                                                            FontAwesomeIcons.solidCircle,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            size:
                                                                                3.0,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                40.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              size: 3.0,
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.00, 0.00),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.00, 0.00),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.00, 0.00),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 120.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                60.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              size: 3.0,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                80.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              size: 3.0,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                100.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              size: 3.0,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.78,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.16,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      3.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondarySystemBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.006,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.49,
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.transparent,
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    height: 25.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: AutoSizeText(
                                                                                      expandableDailyPracticeVideosRecord!.practiceName,
                                                                                      maxLines: 1,
                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: FlutterFlowTheme.of(context).label,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    height: 18.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.headphonesAlt,
                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                          size: 14.0,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                          child: AutoSizeText(
                                                                                            valueOrDefault<String>(
                                                                                              expandableDailyPracticeVideosRecord?.practiceDescription,
                                                                                              'Worship Video',
                                                                                            ).maybeHandleOverflow(
                                                                                              maxChars: 25,
                                                                                              replacement: '…',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                                  fontSize: 12.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    height: 18.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.clock,
                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                          size: 14.0,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                          child: AutoSizeText(
                                                                                            valueOrDefault<String>(
                                                                                              expandableDailyPracticeVideosRecord?.practiceLength,
                                                                                              '5 minutes',
                                                                                            ).maybeHandleOverflow(
                                                                                              maxChars: 25,
                                                                                              replacement: '…',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                                  fontSize: 12.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.2,
                                                                                height: MediaQuery.sizeOf(context).height * 0.06,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: Container(
                                                                                  width: 100.0,
                                                                                  height: 50.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).tertiarySystemBackground,
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                    child: Container(
                                                                                      width: 40.0,
                                                                                      height: 40.0,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).worshipRing,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          if (Theme.of(context).brightness == Brightness.dark)
                                                                                            SvgPicture.asset(
                                                                                              'assets/images/flame-fill.svg',
                                                                                              width: 22.0,
                                                                                              height: 22.0,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          if (!(Theme.of(context).brightness == Brightness.dark))
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                              child: SvgPicture.asset(
                                                                                                'assets/images/flame-fill_(2).svg',
                                                                                                width: 22.0,
                                                                                                height: 25.0,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              40.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceEvenly,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.32,
                                                                                height: MediaQuery.sizeOf(context).height * 0.048,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).tertiarySystemBackground,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      barrierColor: Color(0x80000000),
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return WebViewAware(
                                                                                            child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: Container(
                                                                                            height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                            child: WorshipPracticeBSWidget(
                                                                                              dailyPractice: expandableDailyPracticeVideosRecord,
                                                                                            ),
                                                                                          ),
                                                                                        ));
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));
                                                                                  },
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.play_arrow_rounded,
                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                        size: 28.0,
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.00, 0.00),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'v5201155' /* START */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                                fontSize: 14.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (!valueOrDefault<bool>(currentUserDocument?.admin, false))
                                                                                AuthUserStreamWidget(
                                                                                  builder: (context) => Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.32,
                                                                                    height: MediaQuery.sizeOf(context).height * 0.048,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).tertiarySystemBackground,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    child: Builder(
                                                                                      builder: (context) => InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          await Share.share(
                                                                                            'Checkout today\'s worship journal: ${'lawndalestudents://lawndalestudents.com${GoRouter.of(context).location}'}',
                                                                                            sharePositionOrigin: getWidgetBoundingBox(context),
                                                                                          );
                                                                                        },
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                          children: [
                                                                                            FaIcon(
                                                                                              FontAwesomeIcons.share,
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'pd2tuzi3' /* SHARE */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                                      fontSize: 14.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (valueOrDefault<bool>(currentUserDocument?.admin, false))
                                                                                AuthUserStreamWidget(
                                                                                  builder: (context) => Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.32,
                                                                                    height: MediaQuery.sizeOf(context).height * 0.048,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).tertiarySystemBackground,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        await showModalBottomSheet(
                                                                                          isScrollControlled: true,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          barrierColor: FlutterFlowTheme.of(context).systemGray6,
                                                                                          context: context,
                                                                                          builder: (context) {
                                                                                            return WebViewAware(
                                                                                                child: Padding(
                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                              child: Container(
                                                                                                height: MediaQuery.sizeOf(context).height * 0.92,
                                                                                                child: WorshipUpdateWidget(
                                                                                                  worshipVideo: expandableDailyPracticeVideosRecord,
                                                                                                ),
                                                                                              ),
                                                                                            ));
                                                                                          },
                                                                                        ).then((value) => safeSetState(() {}));
                                                                                      },
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.refresh_rounded,
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            size: 20.0,
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.00, 0.00),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'j2kzeiw9' /* UPDATE */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                    fontSize: 14.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                theme: ExpandableThemeData(
                                                  tapHeaderToExpand: true,
                                                  tapBodyToExpand: true,
                                                  tapBodyToCollapse: true,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .top,
                                                  hasIcon: false,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        constraints: BoxConstraints(
                                          maxWidth: double.infinity,
                                        ),
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: StreamBuilder<
                                              List<DailyPracticeVideosRecord>>(
                                            stream:
                                                queryDailyPracticeVideosRecord(
                                              queryBuilder:
                                                  (dailyPracticeVideosRecord) =>
                                                      dailyPracticeVideosRecord
                                                          .where(
                                                            'scripturePractice',
                                                            isEqualTo: true,
                                                          )
                                                          .where(
                                                            'timeToLaunch',
                                                            isLessThanOrEqualTo:
                                                                getCurrentTimestamp,
                                                          )
                                                          .orderBy(
                                                              'timeToLaunch',
                                                              descending: true),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 75.0,
                                                    height: 75.0,
                                                    child: SpinKitRipple(
                                                      color: Color(0xFF7F95AD),
                                                      size: 75.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<DailyPracticeVideosRecord>
                                                  expandableDailyPracticeVideosRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final expandableDailyPracticeVideosRecord =
                                                  expandableDailyPracticeVideosRecordList
                                                          .isNotEmpty
                                                      ? expandableDailyPracticeVideosRecordList
                                                          .first
                                                      : null;
                                              return ExpandableNotifier(
                                                controller: _model
                                                    .expandableController2,
                                                child: ExpandablePanel(
                                                  header: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Container(
                                                          width: 40.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFF6D6DAE),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              if (Theme.of(
                                                                          context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          5.0),
                                                                  child:
                                                                      SvgPicture
                                                                          .asset(
                                                                    'assets/images/bookmarks-simple-fill_(4).svg',
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        16.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              if (!(Theme.of(
                                                                          context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark))
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          5.0),
                                                                  child:
                                                                      SvgPicture
                                                                          .asset(
                                                                    'assets/images/bookmarks-simple-fill_(2).svg',
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        18.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'containerOnPageLoadAnimation6']!),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '6nsyq01p' /* Scripture */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lightSecondaryText,
                                                                fontSize: 14.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  collapsed: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width: 30.0,
                                                                    height:
                                                                        82.0,
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.00,
                                                                              0.00),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                60.0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              builder: (context) => FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: valueOrDefault<bool>(currentUserDocument?.completed2, false) ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                                size: 3.0,
                                                                              ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation9']!),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              20.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: valueOrDefault<bool>(currentUserDocument?.completed2, false) ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                              size: 3.0,
                                                                            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation10']!),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              20.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: valueOrDefault<bool>(currentUserDocument?.completed2, false) ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                              size: 3.0,
                                                                            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation11']!),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              60.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: valueOrDefault<bool>(currentUserDocument?.completed2, false) ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                              size: 3.0,
                                                                            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation12']!),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.00,
                                                                              0.00),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                80.0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              builder: (context) => FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: valueOrDefault<bool>(currentUserDocument?.completed2, false) ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                                size: 3.0,
                                                                              ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation13']!),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              40.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: valueOrDefault<bool>(currentUserDocument?.completed2, false) ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                              size: 3.0,
                                                                            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation14']!),
                                                                          ),
                                                                        ),
                                                                        AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              FaIcon(
                                                                            FontAwesomeIcons.solidCircle,
                                                                            color: valueOrDefault<bool>(currentUserDocument?.completed2, false)
                                                                                ? FlutterFlowTheme.of(context).tertiary
                                                                                : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                            size:
                                                                                3.0,
                                                                          ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation15']!),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              40.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: valueOrDefault<bool>(currentUserDocument?.completed2, false) ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                              size: 3.0,
                                                                            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation16']!),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.78,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondarySystemBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.006,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              10.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.49,
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.transparent,
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      height: 25.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: AutoSizeText(
                                                                                        expandableDailyPracticeVideosRecord!.practiceName,
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).label,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      height: 18.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          FaIcon(
                                                                                            FontAwesomeIcons.headphonesAlt,
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            size: 14.0,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                expandableDailyPracticeVideosRecord?.practiceDescription,
                                                                                                'Scripture Video',
                                                                                              ).maybeHandleOverflow(
                                                                                                maxChars: 25,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                                    fontSize: 12.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      height: 18.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Colors.transparent,
                                                                                      ),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          FaIcon(
                                                                                            FontAwesomeIcons.clock,
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            size: 14.0,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                expandableDailyPracticeVideosRecord?.practiceLength,
                                                                                                '5 minutes',
                                                                                              ).maybeHandleOverflow(
                                                                                                maxChars: 25,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                                    fontSize: 12.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                                                                  height: MediaQuery.sizeOf(context).height * 0.06,
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    height: 50.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).tertiarySystemBackground,
                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.00, 0.00),
                                                                                      child: Icon(
                                                                                        Icons.play_arrow_rounded,
                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                        size: 40.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.006,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation7']!),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  expanded: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  if (!valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.completed2,
                                                                      false))
                                                                    AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              Container(
                                                                        width:
                                                                            30.0,
                                                                        height:
                                                                            142.0,
                                                                        child:
                                                                            Stack(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.solidCircle,
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  size: 3.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 120.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 140.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.solidCircle,
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  size: 3.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              size: 3.0,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.solidCircle,
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  size: 3.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.solidCircle,
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  size: 3.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 120.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.solidCircle,
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  size: 3.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.completed2,
                                                                      false))
                                                                    AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              Container(
                                                                        width:
                                                                            30.0,
                                                                        height:
                                                                            142.0,
                                                                        child:
                                                                            Stack(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.solidCircle,
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  size: 3.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 120.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 140.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.solidCircle,
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  size: 3.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              size: 3.0,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.solidCircle,
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  size: 3.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.solidCircle,
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  size: 3.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 120.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.solidCircle,
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  size: 3.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.78,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.16,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondarySystemBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.006,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              10.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.49,
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.transparent,
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      height: 25.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: AutoSizeText(
                                                                                        expandableDailyPracticeVideosRecord!.practiceName,
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).label,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      height: 18.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          FaIcon(
                                                                                            FontAwesomeIcons.headphonesAlt,
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            size: 14.0,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                expandableDailyPracticeVideosRecord?.practiceDescription,
                                                                                                'Scripture Video',
                                                                                              ).maybeHandleOverflow(
                                                                                                maxChars: 25,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                                    fontSize: 12.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      height: 18.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          FaIcon(
                                                                                            FontAwesomeIcons.clock,
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            size: 14.0,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                expandableDailyPracticeVideosRecord?.practiceLength,
                                                                                                '5 minutes',
                                                                                              ).maybeHandleOverflow(
                                                                                                maxChars: 25,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                                    fontSize: 12.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                                                                  height: MediaQuery.sizeOf(context).height * 0.06,
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    height: 50.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).tertiarySystemBackground,
                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                      child: Container(
                                                                                        width: 40.0,
                                                                                        height: 40.0,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).scriptureRing,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            if (Theme.of(context).brightness == Brightness.dark)
                                                                                              SvgPicture.asset(
                                                                                                'assets/images/bookmarks-simple-fill_(4).svg',
                                                                                                width: 22.0,
                                                                                                height: 22.0,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            if (!(Theme.of(context).brightness == Brightness.dark))
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                                child: SvgPicture.asset(
                                                                                                  'assets/images/bookmarks-simple-fill_(2).svg',
                                                                                                  width: 22.0,
                                                                                                  height: 25.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              10.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                40.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                Container(
                                                                                  width: 120.0,
                                                                                  height: 38.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).tertiarySystemBackground,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      await showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return WebViewAware(
                                                                                              child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: Container(
                                                                                              height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                              child: ScripturePracticeBSWidget(
                                                                                                dailyPractice: expandableDailyPracticeVideosRecord,
                                                                                              ),
                                                                                            ),
                                                                                          ));
                                                                                        },
                                                                                      ).then((value) => safeSetState(() {}));
                                                                                    },
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                      children: [
                                                                                        Icon(
                                                                                          Icons.play_arrow_rounded,
                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                          size: 28.0,
                                                                                        ),
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0.00, 0.00),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '1vct4loq' /* START */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                  fontSize: 14.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                if (!valueOrDefault<bool>(currentUserDocument?.admin, false))
                                                                                  AuthUserStreamWidget(
                                                                                    builder: (context) => Container(
                                                                                      width: 120.0,
                                                                                      height: 38.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).tertiarySystemBackground,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      child: Builder(
                                                                                        builder: (context) => InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            await Share.share(
                                                                                              'Checkout today\'s scripture journal: ${'lawndalestudents://lawndalestudents.com${GoRouter.of(context).location}'}',
                                                                                              sharePositionOrigin: getWidgetBoundingBox(context),
                                                                                            );
                                                                                          },
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                            children: [
                                                                                              FaIcon(
                                                                                                FontAwesomeIcons.share,
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                size: 16.0,
                                                                                              ),
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.00, 0.00),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '25pzst71' /* SHARE */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Inter',
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        fontSize: 14.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (valueOrDefault<bool>(currentUserDocument?.admin, false))
                                                                                  AuthUserStreamWidget(
                                                                                    builder: (context) => Container(
                                                                                      width: 120.0,
                                                                                      height: 38.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).tertiarySystemBackground,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          await showModalBottomSheet(
                                                                                            isScrollControlled: true,
                                                                                            backgroundColor: Colors.transparent,
                                                                                            barrierColor: FlutterFlowTheme.of(context).systemGray6,
                                                                                            context: context,
                                                                                            builder: (context) {
                                                                                              return WebViewAware(
                                                                                                  child: Padding(
                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                child: Container(
                                                                                                  height: MediaQuery.sizeOf(context).height * 0.92,
                                                                                                  child: ScriptureUpdateWidget(
                                                                                                    scriptureVideo: expandableDailyPracticeVideosRecord,
                                                                                                  ),
                                                                                                ),
                                                                                              ));
                                                                                            },
                                                                                          ).then((value) => safeSetState(() {}));
                                                                                        },
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                          children: [
                                                                                            Icon(
                                                                                              Icons.refresh_rounded,
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'vgf7hsev' /* UPDATE */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                                      fontSize: 14.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  theme: ExpandableThemeData(
                                                    tapHeaderToExpand: true,
                                                    tapBodyToExpand: true,
                                                    tapBodyToCollapse: true,
                                                    headerAlignment:
                                                        ExpandablePanelHeaderAlignment
                                                            .top,
                                                    hasIcon: false,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        constraints: BoxConstraints(
                                          maxWidth: double.infinity,
                                        ),
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: StreamBuilder<
                                              List<DailyPracticeVideosRecord>>(
                                            stream:
                                                queryDailyPracticeVideosRecord(
                                              queryBuilder:
                                                  (dailyPracticeVideosRecord) =>
                                                      dailyPracticeVideosRecord
                                                          .where(
                                                            'prayerPractice',
                                                            isEqualTo: true,
                                                          )
                                                          .where(
                                                            'timeToLaunch',
                                                            isLessThanOrEqualTo:
                                                                getCurrentTimestamp,
                                                          )
                                                          .orderBy(
                                                              'timeToLaunch',
                                                              descending: true),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 75.0,
                                                    height: 75.0,
                                                    child: SpinKitRipple(
                                                      color: Color(0xFF7F95AD),
                                                      size: 75.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<DailyPracticeVideosRecord>
                                                  expandableDailyPracticeVideosRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final expandableDailyPracticeVideosRecord =
                                                  expandableDailyPracticeVideosRecordList
                                                          .isNotEmpty
                                                      ? expandableDailyPracticeVideosRecordList
                                                          .first
                                                      : null;
                                              return ExpandableNotifier(
                                                controller: _model
                                                    .expandableController3,
                                                child: ExpandablePanel(
                                                  header: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      wrapWithModel(
                                                        model: _model
                                                            .prayerRingSmallModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            PrayerRingSmallWidget(),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '20z7wy4c' /* Prayer */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lightSecondaryText,
                                                                fontSize: 14.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  collapsed: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width: 30.0,
                                                                    height:
                                                                        90.0,
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.00,
                                                                              0.00),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                60.0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              builder: (context) => FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: valueOrDefault<bool>(currentUserDocument?.complete3, false) ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                                size: 3.0,
                                                                              ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation17']!),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              20.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: valueOrDefault<bool>(currentUserDocument?.complete3, false) ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                              size: 3.0,
                                                                            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation18']!),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              20.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: valueOrDefault<bool>(currentUserDocument?.complete3, false) ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                              size: 3.0,
                                                                            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation19']!),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              60.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: valueOrDefault<bool>(currentUserDocument?.complete3, false) ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                              size: 3.0,
                                                                            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation20']!),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.00,
                                                                              0.00),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                80.0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              builder: (context) => FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: valueOrDefault<bool>(currentUserDocument?.complete3, false) ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                                size: 3.0,
                                                                              ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation21']!),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              40.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: valueOrDefault<bool>(currentUserDocument?.complete3, false) ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                              size: 3.0,
                                                                            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation22']!),
                                                                          ),
                                                                        ),
                                                                        AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              FaIcon(
                                                                            FontAwesomeIcons.solidCircle,
                                                                            color: valueOrDefault<bool>(currentUserDocument?.complete3, false)
                                                                                ? FlutterFlowTheme.of(context).tertiary
                                                                                : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                            size:
                                                                                3.0,
                                                                          ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation23']!),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              40.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: valueOrDefault<bool>(currentUserDocument?.complete3, false) ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).textFieldColorSecondary,
                                                                              size: 3.0,
                                                                            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation24']!),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.78,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondarySystemBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.006,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              10.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.49,
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.transparent,
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      height: 25.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: AutoSizeText(
                                                                                        expandableDailyPracticeVideosRecord!.practiceName,
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).label,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      height: 18.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          FaIcon(
                                                                                            FontAwesomeIcons.headphonesAlt,
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            size: 14.0,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                expandableDailyPracticeVideosRecord?.practiceDescription,
                                                                                                'Guided Prayer',
                                                                                              ).maybeHandleOverflow(
                                                                                                maxChars: 25,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                                    fontSize: 12.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      height: 18.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          FaIcon(
                                                                                            FontAwesomeIcons.clock,
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            size: 14.0,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                expandableDailyPracticeVideosRecord?.practiceLength,
                                                                                                '5 minutes',
                                                                                              ).maybeHandleOverflow(
                                                                                                maxChars: 25,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                                    fontSize: 12.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                                                                  height: MediaQuery.sizeOf(context).height * 0.06,
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    height: 50.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).tertiarySystemBackground,
                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.00, 0.00),
                                                                                      child: Icon(
                                                                                        Icons.play_arrow_rounded,
                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                        size: 40.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.006,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation8']!),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  expanded: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  if (!valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.complete3,
                                                                      false))
                                                                    AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              Container(
                                                                        width:
                                                                            30.0,
                                                                        height:
                                                                            150.0,
                                                                        child:
                                                                            Stack(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.solidCircle,
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  size: 3.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 120.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 140.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.solidCircle,
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  size: 3.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              size: 3.0,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.solidCircle,
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  size: 3.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.solidCircle,
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  size: 3.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 120.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.solidCircle,
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  size: 3.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.complete3,
                                                                      false))
                                                                    AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              Container(
                                                                        width:
                                                                            30.0,
                                                                        height:
                                                                            150.0,
                                                                        child:
                                                                            Stack(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.solidCircle,
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  size: 3.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 120.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 140.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.solidCircle,
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  size: 3.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            FaIcon(
                                                                              FontAwesomeIcons.solidCircle,
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              size: 3.0,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.solidCircle,
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  size: 3.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.solidCircle,
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  size: 3.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 120.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.solidCircle,
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  size: 3.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                size: 3.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.78,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.16,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        3.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondarySystemBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.006,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              10.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.49,
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.transparent,
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      height: 25.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: AutoSizeText(
                                                                                        expandableDailyPracticeVideosRecord!.practiceName,
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).label,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      height: 18.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          FaIcon(
                                                                                            FontAwesomeIcons.headphonesAlt,
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            size: 14.0,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                expandableDailyPracticeVideosRecord?.practiceDescription,
                                                                                                'Guided Prayer',
                                                                                              ).maybeHandleOverflow(
                                                                                                maxChars: 25,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                                    fontSize: 12.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      height: 18.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          FaIcon(
                                                                                            FontAwesomeIcons.clock,
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            size: 14.0,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                expandableDailyPracticeVideosRecord?.practiceLength,
                                                                                                '5 minutes',
                                                                                              ).maybeHandleOverflow(
                                                                                                maxChars: 25,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                                    fontSize: 12.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                                                                  height: MediaQuery.sizeOf(context).height * 0.06,
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    height: 50.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).tertiarySystemBackground,
                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                      child: Container(
                                                                                        width: 40.0,
                                                                                        height: 40.0,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).prayerRing,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            if (Theme.of(context).brightness == Brightness.dark)
                                                                                              SvgPicture.asset(
                                                                                                'assets/images/handsclapping(dark_mode).svg',
                                                                                                width: 22.0,
                                                                                                height: 22.0,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            if (!(Theme.of(context).brightness == Brightness.dark))
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                                child: SvgPicture.asset(
                                                                                                  'assets/images/handsclapping(light_mode).svg',
                                                                                                  width: 22.0,
                                                                                                  height: 25.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              10.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                40.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                Container(
                                                                                  width: 120.0,
                                                                                  height: 38.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).tertiarySystemBackground,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      await showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return WebViewAware(
                                                                                              child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: Container(
                                                                                              height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                              child: PrayerPracticeBSWidget(
                                                                                                dailyPractice: expandableDailyPracticeVideosRecord,
                                                                                              ),
                                                                                            ),
                                                                                          ));
                                                                                        },
                                                                                      ).then((value) => safeSetState(() {}));
                                                                                    },
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                      children: [
                                                                                        Icon(
                                                                                          Icons.play_arrow_rounded,
                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                          size: 28.0,
                                                                                        ),
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0.00, 0.00),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'r5ahwu4x' /* START */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                  fontSize: 14.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                if (!valueOrDefault<bool>(currentUserDocument?.admin, false))
                                                                                  AuthUserStreamWidget(
                                                                                    builder: (context) => Container(
                                                                                      width: 120.0,
                                                                                      height: 38.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).tertiarySystemBackground,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      child: Builder(
                                                                                        builder: (context) => InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            await Share.share(
                                                                                              'Checkout today\'s prayer journal: ${'lawndalestudents://lawndalestudents.com${GoRouter.of(context).location}'}',
                                                                                              sharePositionOrigin: getWidgetBoundingBox(context),
                                                                                            );
                                                                                          },
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                            children: [
                                                                                              FaIcon(
                                                                                                FontAwesomeIcons.share,
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                size: 16.0,
                                                                                              ),
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.00, 0.00),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'aafwupfx' /* SHARE */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Inter',
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        fontSize: 14.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (valueOrDefault<bool>(currentUserDocument?.admin, false))
                                                                                  AuthUserStreamWidget(
                                                                                    builder: (context) => Container(
                                                                                      width: 120.0,
                                                                                      height: 38.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).tertiarySystemBackground,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          await showModalBottomSheet(
                                                                                            isScrollControlled: true,
                                                                                            backgroundColor: Colors.transparent,
                                                                                            barrierColor: FlutterFlowTheme.of(context).systemGray6,
                                                                                            context: context,
                                                                                            builder: (context) {
                                                                                              return WebViewAware(
                                                                                                  child: Padding(
                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                child: Container(
                                                                                                  height: MediaQuery.sizeOf(context).height * 0.92,
                                                                                                  child: PrayerUpdateWidget(
                                                                                                    prayerVideo: expandableDailyPracticeVideosRecord,
                                                                                                  ),
                                                                                                ),
                                                                                              ));
                                                                                            },
                                                                                          ).then((value) => safeSetState(() {}));
                                                                                        },
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                          children: [
                                                                                            Icon(
                                                                                              Icons.refresh_rounded,
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'lox936tl' /* UPDATE */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                                      fontSize: 14.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  theme: ExpandableThemeData(
                                                    tapHeaderToExpand: true,
                                                    tapBodyToExpand: true,
                                                    tapBodyToCollapse: true,
                                                    headerAlignment:
                                                        ExpandablePanelHeaderAlignment
                                                            .top,
                                                    hasIcon: false,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 0.2,
                                decoration: BoxDecoration(),
                              ),
                            ],
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation1']!),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 1.00),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.125,
                      decoration: BoxDecoration(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context)
                              .secondarySystemBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondayGrey5,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (Theme.of(context).brightness ==
                                                Brightness.dark)
                                              SvgPicture.asset(
                                                'assets/images/house-fill_(3).svg',
                                                width: 28.0,
                                                height: 28.0,
                                                fit: BoxFit.cover,
                                              ),
                                            if (!(Theme.of(context)
                                                    .brightness ==
                                                Brightness.dark))
                                              SvgPicture.asset(
                                                'assets/images/house-fill_(5).svg',
                                                width: 28.0,
                                                height: 28.0,
                                                fit: BoxFit.cover,
                                              ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            HapticFeedback.lightImpact();
                                            if (Navigator.of(context)
                                                .canPop()) {
                                              context.pop();
                                            }
                                            context.pushNamed(
                                              'GrowPage',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (Theme.of(context)
                                                        .brightness ==
                                                    Brightness.dark)
                                                  Image.asset(
                                                    'assets/images/leaf-fill_(1).png',
                                                    width: 28.0,
                                                    height: 28.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                if (!(Theme.of(context)
                                                        .brightness ==
                                                    Brightness.dark))
                                                  SvgPicture.asset(
                                                    'assets/images/leaf-fill_(5).svg',
                                                    width: 28.0,
                                                    height: 28.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      wrapWithModel(
                                        model:
                                            _model.chatTabIconUnselectedModel,
                                        updateCallback: () => setState(() {}),
                                        child: ChatTabIconUnselectedWidget(),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            HapticFeedback.lightImpact();
                                            if (Navigator.of(context)
                                                .canPop()) {
                                              context.pop();
                                            }
                                            context.pushNamed(
                                              'CommunityPrayerPage',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (Theme.of(context)
                                                        .brightness ==
                                                    Brightness.dark)
                                                  SvgPicture.asset(
                                                    'assets/images/hands-clapping-fill_(8).svg',
                                                    width: 28.0,
                                                    height: 28.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                if (!(Theme.of(context)
                                                        .brightness ==
                                                    Brightness.dark))
                                                  SvgPicture.asset(
                                                    'assets/images/hands-clapping-fill_(7).svg',
                                                    width: 28.0,
                                                    height: 28.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model
                                            .profileTabIconUnselectedModel,
                                        updateCallback: () => setState(() {}),
                                        child: ProfileTabIconUnselectedWidget(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
