import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/featured_notification_groups_widget.dart';
import '/components/group_leaders_set_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'group_upload_only_widget.dart' show GroupUploadOnlyWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class GroupUploadOnlyModel extends FlutterFlowModel<GroupUploadOnlyWidget> {
  ///  Local state fields for this component.

  bool ageAll = false;

  bool categoryAll = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qjf136g4' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'u3m5bm6p' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for CategoryChipsNotAll widget.
  String? categoryChipsNotAllValue;
  FormFieldController<List<String>>? categoryChipsNotAllValueController;
  // State field(s) for CategoryChipsAll widget.
  String? categoryChipsAllValue;
  FormFieldController<List<String>>? categoryChipsAllValueController;
  // State field(s) for DayoftheWeekChips widget.
  String? dayoftheWeekChipsValue;
  FormFieldController<List<String>>? dayoftheWeekChipsValueController;
  // State field(s) for ToDChips widget.
  String? toDChipsValue;
  FormFieldController<List<String>>? toDChipsValueController;
  // State field(s) for AgeRangeChipsAll widget.
  String? ageRangeChipsAllValue;
  FormFieldController<List<String>>? ageRangeChipsAllValueController;
  // State field(s) for AgeRangeChipsNotAll widget.
  String? ageRangeChipsNotAllValue;
  FormFieldController<List<String>>? ageRangeChipsNotAllValueController;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for GroupPrivateSelector widget.
  bool? groupPrivateSelectorValue;
  // State field(s) for TimerSecondPage widget.
  int timerSecondPageMilliseconds = 10;
  String timerSecondPageValue =
      StopWatchTimer.getDisplayTime(10, milliSecond: false);
  FlutterFlowTimerController timerSecondPageController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  GroupsRecord? newResource3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
  }

  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    timerSecondPageController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
