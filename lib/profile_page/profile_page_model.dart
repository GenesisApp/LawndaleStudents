import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/badge_sheet100_widget.dart';
import '/components/badge_sheet200_widget.dart';
import '/components/badge_sheet30_widget.dart';
import '/components/badge_sheet365_widget.dart';
import '/components/badge_sheet7_widget.dart';
import '/components/badge_sheet_prayer_widget.dart';
import '/components/badge_sheet_widget.dart';
import '/components/chat_tab_icon_unselected_widget.dart';
import '/components/friend_requests_widget.dart';
import '/components/heart_check_widget.dart';
import '/components/journal_archive_b_s_widget.dart';
import '/components/profile_tab_icon_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for chatTabIconUnselected component.
  late ChatTabIconUnselectedModel chatTabIconUnselectedModel;
  // Model for profileTabIcon component.
  late ProfileTabIconModel profileTabIconModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    chatTabIconUnselectedModel =
        createModel(context, () => ChatTabIconUnselectedModel());
    profileTabIconModel = createModel(context, () => ProfileTabIconModel());
  }

  void dispose() {
    chatTabIconUnselectedModel.dispose();
    profileTabIconModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
