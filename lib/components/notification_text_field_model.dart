import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notification_text_field_widget.dart' show NotificationTextFieldWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationTextFieldModel
    extends FlutterFlowModel<NotificationTextFieldWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField1 widget.
  FocusNode? textField1FocusNode;
  TextEditingController? textField1Controller;
  String? Function(BuildContext, String?)? textField1ControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textField1FocusNode?.dispose();
    textField1Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
