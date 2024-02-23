import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/prayer_ring_small_widget.dart';
import '/components/prayer_update_future_widget.dart';
import '/components/scripture_update_future_widget.dart';
import '/components/worship_update_future_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'practice_preview_widget.dart' show PracticePreviewWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PracticePreviewModel extends FlutterFlowModel<PracticePreviewWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableController;

  // Model for PrayerRingSmall component.
  late PrayerRingSmallModel prayerRingSmallModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    prayerRingSmallModel = createModel(context, () => PrayerRingSmallModel());
  }

  @override
  void dispose() {
    expandableController.dispose();
    prayerRingSmallModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
