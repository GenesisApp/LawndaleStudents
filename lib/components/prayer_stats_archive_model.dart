import '/auth/firebase_auth/auth_util.dart';
import '/components/prayer_ring_small_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'prayer_stats_archive_widget.dart' show PrayerStatsArchiveWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PrayerStatsArchiveModel
    extends FlutterFlowModel<PrayerStatsArchiveWidget> {
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
