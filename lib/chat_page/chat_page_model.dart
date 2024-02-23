import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/chat_event_choosing_widget.dart';
import '/components/chat_event_creation_widget.dart';
import '/components/chat_event_viewing_widget.dart';
import '/components/chat_poll_creation_widget.dart';
import '/components/community_prayer_request_chat_widget.dart';
import '/components/create_prayer_chat_widget.dart';
import '/components/current_poll_choosing_widget.dart';
import '/components/current_poll_viewing_widget.dart';
import '/components/edit_message_widget.dart';
import '/components/group_chat_settings_widget.dart';
import '/components/language_report_widget.dart';
import '/components/p_d_f_viewer_widget.dart';
import '/components/user_reactions_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'chat_page_widget.dart' show ChatPageWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ChatPageModel extends FlutterFlowModel<ChatPageWidget> {
  ///  Local state fields for this page.

  bool? resetDate = true;

  DateTime? dateResetTime;

  int? messageCount = 0;

  bool? linkAdded = false;

  bool? eventCreated = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TimerUpload1 widget.
  int timerUpload1Milliseconds = 500;
  String timerUpload1Value =
      StopWatchTimer.getDisplayTime(500, milliSecond: false);
  FlutterFlowTimerController timerUpload1Controller =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for TimerUpload2 widget.
  int timerUpload2Milliseconds = 500;
  String timerUpload2Value =
      StopWatchTimer.getDisplayTime(500, milliSecond: false);
  FlutterFlowTimerController timerUpload2Controller =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for Timer widget.
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(0, milliSecond: false);
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for TimeronLoad widget.
  int timeronLoadMilliseconds = 0;
  String timeronLoadValue =
      StopWatchTimer.getDisplayTime(0, milliSecond: false);
  FlutterFlowTimerController timeronLoadController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for TextFieldText widget.
  FocusNode? textFieldTextFocusNode;
  TextEditingController? textFieldTextController;
  String? Function(BuildContext, String?)? textFieldTextControllerValidator;
  // Stores action output result for [Custom Action - scanLanguage] action in Container widget.
  bool? scanResults5;
  // Stores action output result for [Custom Action - scanMessageForLink] action in Container widget.
  String? linkChecked;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    timerUpload1Controller.dispose();
    timerUpload2Controller.dispose();
    timerController.dispose();
    timeronLoadController.dispose();
    textFieldTextFocusNode?.dispose();
    textFieldTextController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
