import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/person_blocked_widget.dart';
import '/components/under13_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_new_chat_widget.dart' show CreateNewChatWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CreateNewChatModel extends FlutterFlowModel<CreateNewChatWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  MessageChatsRecord? newGroup1;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  MessageChatsRecord? newGroup;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  MessageChatsRecord? newGroup1Copy;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  MessageChatsRecord? newGroupCopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
