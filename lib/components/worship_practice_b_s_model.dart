import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_state_journals_widget.dart';
import '/components/journal_response_preview_widget.dart';
import '/components/language_report_widget.dart';
import '/components/percentage_completed1_widget.dart';
import '/components/read_scripture_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'worship_practice_b_s_widget.dart' show WorshipPracticeBSWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class WorshipPracticeBSModel extends FlutterFlowModel<WorshipPracticeBSWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField1 widget.
  FocusNode? textField1FocusNode;
  TextEditingController? textField1Controller;
  String? Function(BuildContext, String?)? textField1ControllerValidator;
  // State field(s) for Timer widget.
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(0, milliSecond: false);
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Custom Action - scanLanguage] action in Timer widget.
  bool? scanResults;
  // Stores action output result for [Backend Call - Create Document] action in Timer widget.
  PersonalJournalsRecord? newJournal;
  // Stores action output result for [Backend Call - Create Document] action in Timer widget.
  AdminDataRecord? newAdminData;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textField1FocusNode?.dispose();
    textField1Controller?.dispose();

    timerController.dispose();
    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
