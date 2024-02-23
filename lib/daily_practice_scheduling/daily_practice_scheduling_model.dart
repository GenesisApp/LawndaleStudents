import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/practice_preview_widget.dart';
import '/components/prayer_ring_small_widget.dart';
import '/components/worship_create_future_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'daily_practice_scheduling_widget.dart'
    show DailyPracticeSchedulingWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DailyPracticeSchedulingModel
    extends FlutterFlowModel<DailyPracticeSchedulingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PrayerRingSmall component.
  late PrayerRingSmallModel prayerRingSmallModel1;
  // Model for PrayerRingSmall component.
  late PrayerRingSmallModel prayerRingSmallModel2;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    prayerRingSmallModel1 = createModel(context, () => PrayerRingSmallModel());
    prayerRingSmallModel2 = createModel(context, () => PrayerRingSmallModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    prayerRingSmallModel1.dispose();
    prayerRingSmallModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
