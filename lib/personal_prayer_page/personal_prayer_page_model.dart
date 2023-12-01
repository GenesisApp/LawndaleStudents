import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/chat_tab_icon_unselected_widget.dart';
import '/components/create_prayer_widget.dart';
import '/components/empty_state_p_r_widget.dart';
import '/components/personal_prayer_request_widget.dart';
import '/components/profile_tab_icon_unselected_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'personal_prayer_page_widget.dart' show PersonalPrayerPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PersonalPrayerPageModel
    extends FlutterFlowModel<PersonalPrayerPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, PrayerRequestsRecord>?
      listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Model for chatTabIconUnselected component.
  late ChatTabIconUnselectedModel chatTabIconUnselectedModel;
  // Model for profileTabIconUnselected component.
  late ProfileTabIconUnselectedModel profileTabIconUnselectedModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    chatTabIconUnselectedModel =
        createModel(context, () => ChatTabIconUnselectedModel());
    profileTabIconUnselectedModel =
        createModel(context, () => ProfileTabIconUnselectedModel());
  }

  void dispose() {
    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();

    chatTabIconUnselectedModel.dispose();
    profileTabIconUnselectedModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, PrayerRequestsRecord>
      setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, PrayerRequestsRecord>
      _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, PrayerRequestsRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryPrayerRequestsRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
