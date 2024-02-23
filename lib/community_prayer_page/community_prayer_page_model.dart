import '/backend/backend.dart';
import '/components/chat_tab_icon_unselected_widget.dart';
import '/components/community_prayer_request_widget.dart';
import '/components/create_prayer_widget.dart';
import '/components/empty_state_p_r_widget.dart';
import '/components/profile_tab_icon_unselected_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'community_prayer_page_widget.dart' show CommunityPrayerPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CommunityPrayerPageModel
    extends FlutterFlowModel<CommunityPrayerPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for communityPrayerRequest component.
  late CommunityPrayerRequestModel communityPrayerRequestModel1;
  // Model for chatTabIconUnselected component.
  late ChatTabIconUnselectedModel chatTabIconUnselectedModel;
  // Model for profileTabIconUnselected component.
  late ProfileTabIconUnselectedModel profileTabIconUnselectedModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    communityPrayerRequestModel1 =
        createModel(context, () => CommunityPrayerRequestModel());
    chatTabIconUnselectedModel =
        createModel(context, () => ChatTabIconUnselectedModel());
    profileTabIconUnselectedModel =
        createModel(context, () => ProfileTabIconUnselectedModel());
  }

  @override
  void dispose() {
    communityPrayerRequestModel1.dispose();
    chatTabIconUnselectedModel.dispose();
    profileTabIconUnselectedModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
