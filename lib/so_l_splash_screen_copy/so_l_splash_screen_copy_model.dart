import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'so_l_splash_screen_copy_widget.dart' show SoLSplashScreenCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SoLSplashScreenCopyModel
    extends FlutterFlowModel<SoLSplashScreenCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Timer5 widget.
  int timer5Milliseconds = 2600;
  String timer5Value = StopWatchTimer.getDisplayTime(
    2600,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timer5Controller =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    timer5Controller.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
