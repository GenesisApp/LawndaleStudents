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
  FormFieldController<List<String>>? categoryChipsNotAllValueController;
  String? get categoryChipsNotAllValue =>
      categoryChipsNotAllValueController?.value?.firstOrNull;
  set categoryChipsNotAllValue(String? val) =>
      categoryChipsNotAllValueController?.value = val != null ? [val] : [];
  // State field(s) for CategoryChipsAll widget.
  FormFieldController<List<String>>? categoryChipsAllValueController;
  String? get categoryChipsAllValue =>
      categoryChipsAllValueController?.value?.firstOrNull;
  set categoryChipsAllValue(String? val) =>
      categoryChipsAllValueController?.value = val != null ? [val] : [];
  // State field(s) for DayoftheWeekChips widget.
  FormFieldController<List<String>>? dayoftheWeekChipsValueController;
  String? get dayoftheWeekChipsValue =>
      dayoftheWeekChipsValueController?.value?.firstOrNull;
  set dayoftheWeekChipsValue(String? val) =>
      dayoftheWeekChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for ToDChips widget.
  FormFieldController<List<String>>? toDChipsValueController;
  String? get toDChipsValue => toDChipsValueController?.value?.firstOrNull;
  set toDChipsValue(String? val) =>
      toDChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for AgeRangeChipsAll widget.
  FormFieldController<List<String>>? ageRangeChipsAllValueController;
  String? get ageRangeChipsAllValue =>
      ageRangeChipsAllValueController?.value?.firstOrNull;
  set ageRangeChipsAllValue(String? val) =>
      ageRangeChipsAllValueController?.value = val != null ? [val] : [];
  // State field(s) for AgeRangeChipsNotAll widget.
  FormFieldController<List<String>>? ageRangeChipsNotAllValueController;
  String? get ageRangeChipsNotAllValue =>
      ageRangeChipsNotAllValueController?.value?.firstOrNull;
  set ageRangeChipsNotAllValue(String? val) =>
      ageRangeChipsNotAllValueController?.value = val != null ? [val] : [];
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
