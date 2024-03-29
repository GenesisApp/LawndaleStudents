import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_guest_widget.dart';
import '/components/delete_guest_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'groups_attendance_widget.dart' show GroupsAttendanceWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class GroupsAttendanceModel extends FlutterFlowModel<GroupsAttendanceWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CheckboxListTile widget.

  Map<UsersRecord, bool> checkboxListTileValueMap1 = {};
  List<UsersRecord> get checkboxListTileCheckedItems1 =>
      checkboxListTileValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Backend Call - Create Document] action in CheckboxListTile widget.
  GlobalGroupsDataRecord? newDay;
  // Stores action output result for [Backend Call - Create Document] action in CheckboxListTile widget.
  GlobalGroupsDataRecord? newDayCopy;
  // State field(s) for CheckboxListTile widget.

  Map<GuestsRecord, bool> checkboxListTileValueMap2 = {};
  List<GuestsRecord> get checkboxListTileCheckedItems2 =>
      checkboxListTileValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Backend Call - Create Document] action in CheckboxListTile widget.
  GlobalGroupsDataRecord? newDayCopy1;
  // Stores action output result for [Backend Call - Create Document] action in CheckboxListTile widget.
  GlobalGroupsDataRecord? newDayCopy2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
