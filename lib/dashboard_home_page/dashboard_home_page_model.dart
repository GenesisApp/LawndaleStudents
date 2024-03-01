import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/chat_tab_unselected_dashboard_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dashboard_home_page_widget.dart' show DashboardHomePageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class DashboardHomePageModel extends FlutterFlowModel<DashboardHomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for chatTabUnselectedDashboard component.
  late ChatTabUnselectedDashboardModel chatTabUnselectedDashboardModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    chatTabUnselectedDashboardModel =
        createModel(context, () => ChatTabUnselectedDashboardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    chatTabUnselectedDashboardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
