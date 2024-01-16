import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/account_denied_admin_widget.dart';
import '/components/account_waiting_widget.dart';
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
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
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

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  List<MessageChatsRecord>? homePagePreviousSnapshot;
  InstantTimer? instantTimer;
  // State field(s) for Timer widget.
  int timerMilliseconds = 500;
  String timerValue = StopWatchTimer.getDisplayTime(
    500,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Custom Action - appBadge] action in Timer widget.
  int? badgeCount;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController3;

  // Model for PrayerRingSmall component.
  late PrayerRingSmallModel prayerRingSmallModel;
  // Model for chatTabIconUnselected component.
  late ChatTabIconUnselectedModel chatTabIconUnselectedModel;
  // Model for profileTabIconUnselected component.
  late ProfileTabIconUnselectedModel profileTabIconUnselectedModel;
  // State field(s) for Switch widget.
  bool? switchValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    prayerRingSmallModel = createModel(context, () => PrayerRingSmallModel());
    chatTabIconUnselectedModel =
        createModel(context, () => ChatTabIconUnselectedModel());
    profileTabIconUnselectedModel =
        createModel(context, () => ProfileTabIconUnselectedModel());
  }

  void dispose() {
    instantTimer?.cancel();
    timerController.dispose();
    expandableController1.dispose();
    expandableController2.dispose();
    expandableController3.dispose();
    prayerRingSmallModel.dispose();
    chatTabIconUnselectedModel.dispose();
    profileTabIconUnselectedModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
