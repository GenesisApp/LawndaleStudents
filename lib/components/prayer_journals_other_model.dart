import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/journal_preview_widget.dart';
import '/components/prayer_ring_small_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'prayer_journals_other_widget.dart' show PrayerJournalsOtherWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PrayerJournalsOtherModel
    extends FlutterFlowModel<PrayerJournalsOtherWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PrayerRingSmall component.
  late PrayerRingSmallModel prayerRingSmallModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    prayerRingSmallModel = createModel(context, () => PrayerRingSmallModel());
  }

  @override
  void dispose() {
    prayerRingSmallModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
