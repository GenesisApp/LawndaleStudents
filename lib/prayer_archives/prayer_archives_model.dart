import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/journal_preview_widget.dart';
import '/components/prayer_ring_small_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'prayer_archives_widget.dart' show PrayerArchivesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PrayerArchivesModel extends FlutterFlowModel<PrayerArchivesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PrayerRingSmall component.
  late PrayerRingSmallModel prayerRingSmallModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    prayerRingSmallModel = createModel(context, () => PrayerRingSmallModel());
  }

  void dispose() {
    unfocusNode.dispose();
    prayerRingSmallModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
