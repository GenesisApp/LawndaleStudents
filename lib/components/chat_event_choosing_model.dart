import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/answer_needed_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_event_choosing_widget.dart' show ChatEventChoosingWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ChatEventChoosingModel extends FlutterFlowModel<ChatEventChoosingWidget> {
  ///  Local state fields for this component.

  bool? confirmedSelected = false;

  bool? declinedSelected = false;

  bool? maybeSelected = false;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
