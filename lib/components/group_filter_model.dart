import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'group_filter_widget.dart' show GroupFilterWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GroupFilterModel extends FlutterFlowModel<GroupFilterWidget> {
  ///  Local state fields for this component.

  bool ageAll = false;

  bool categoryAll = false;

  ///  State fields for stateful widgets in this component.

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

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
