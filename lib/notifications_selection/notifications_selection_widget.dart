import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_push_notification_widget.dart';
import '/components/delete_tag_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'notifications_selection_model.dart';
export 'notifications_selection_model.dart';

class NotificationsSelectionWidget extends StatefulWidget {
  const NotificationsSelectionWidget({Key? key}) : super(key: key);

  @override
  _NotificationsSelectionWidgetState createState() =>
      _NotificationsSelectionWidgetState();
}

class _NotificationsSelectionWidgetState
    extends State<NotificationsSelectionWidget> with TickerProviderStateMixin {
  late NotificationsSelectionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'gridViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsSelectionModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: BoxDecoration(),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pop();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 22.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'cod0qg0n' /* Hello, */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).label,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              currentUserDisplayName,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).label,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 10.0,
                            decoration: BoxDecoration(),
                          ),
                        ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['rowOnPageLoadAnimation']!),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 50.0, 25.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '7s85xy4e' /* Click the tag below that you w... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).systemGray,
                          ),
                    ).animateOnPageLoad(
                        animationsMap['textOnPageLoadAnimation']!),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.89,
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color:
                        FlutterFlowTheme.of(context).secondarySystemBackground,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              onFieldSubmitted: (_) async {
                                await queryProfileTagsRecordOnce()
                                    .then(
                                      (records) => _model
                                          .simpleSearchResults = TextSearch(
                                        records
                                            .map(
                                              (record) =>
                                                  TextSearchItem.fromTerms(
                                                      record,
                                                      [record.tagName!]),
                                            )
                                            .toList(),
                                      )
                                          .search(_model.textController.text)
                                          .map((r) => r.object)
                                          .take(50)
                                          .toList(),
                                    )
                                    .onError((_, __) =>
                                        _model.simpleSearchResults = [])
                                    .whenComplete(() => setState(() {}));

                                if (_model.textController.text != null &&
                                    _model.textController.text != '') {
                                  FFAppState().update(() {
                                    FFAppState().showFullList = false;
                                  });
                                }
                              },
                              textCapitalization: TextCapitalization.words,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: FFLocalizations.of(context).getText(
                                  'wrgd8l0n' /* Search Tags... */,
                                ),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .lightSecondaryText,
                                      fontSize: 16.0,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .lightSecondaryText,
                                      fontSize: 16.0,
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: FlutterFlowTheme.of(context)
                                      .lightSecondaryText,
                                  size: 18.0,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .lightSecondaryText,
                                    fontSize: 16.0,
                                  ),
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 40.0,
                        height: double.infinity,
                        decoration: BoxDecoration(),
                        child: Visibility(
                          visible: !FFAppState().showFullList,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().update(() {
                                FFAppState().showFullList = true;
                              });
                              setState(() {
                                _model.textController?.clear();
                              });
                            },
                            child: Icon(
                              Icons.clear_rounded,
                              color: FlutterFlowTheme.of(context)
                                  .lightSecondaryText,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (FFAppState().showFullList)
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(22.0, 30.0, 22.0, 20.0),
                  child: StreamBuilder<List<ProfileTagsRecord>>(
                    stream: queryProfileTagsRecord(
                      queryBuilder: (profileTagsRecord) => profileTagsRecord
                          .orderBy('tagName', descending: true),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 75.0,
                            height: 75.0,
                            child: SpinKitRipple(
                              color: Color(0xFF7F95AD),
                              size: 75.0,
                            ),
                          ),
                        );
                      }
                      List<ProfileTagsRecord> gridViewProfileTagsRecordList =
                          snapshot.data!;
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0,
                          childAspectRatio: 2.0,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: gridViewProfileTagsRecordList.length,
                        itemBuilder: (context, gridViewIndex) {
                          final gridViewProfileTagsRecord =
                              gridViewProfileTagsRecordList[gridViewIndex];
                          return Container(
                            height: 75.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: FlutterFlowTheme.of(context)
                                      .opagueSeparator,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                        child: GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: CustomPushNotificationWidget(
                                          userGroupChosen:
                                              gridViewProfileTagsRecord
                                                  .usersWithTag,
                                        ),
                                      ),
                                    ));
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              onLongPress: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: FlutterFlowTheme.of(context)
                                      .secondarySystemBackground,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                        child: GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: DeleteTagWidget(
                                          tagSelected: gridViewProfileTagsRecord
                                              .reference,
                                        ),
                                      ),
                                    ));
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondarySystemBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 25.0,
                                        decoration: BoxDecoration(),
                                        child: AutoSizeText(
                                          gridViewProfileTagsRecord.tagName,
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                fontSize: 16.0,
                                              ),
                                        ),
                                      ),
                                      if (gridViewProfileTagsRecord
                                              .usersWithTag.length <=
                                          1)
                                        Text(
                                          '${gridViewProfileTagsRecord.usersWithTag.length.toString()} Person',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                        ),
                                      if (gridViewProfileTagsRecord
                                              .usersWithTag.length >
                                          1)
                                        Text(
                                          '${gridViewProfileTagsRecord.usersWithTag.length.toString()} People',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ).animateOnPageLoad(
                          animationsMap['gridViewOnPageLoadAnimation']!);
                    },
                  ),
                ),
              ),
            if (!FFAppState().showFullList)
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(22.0, 30.0, 22.0, 20.0),
                  child: Builder(
                    builder: (context) {
                      final searchResults = _model.simpleSearchResults.toList();
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0,
                          childAspectRatio: 2.0,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: searchResults.length,
                        itemBuilder: (context, searchResultsIndex) {
                          final searchResultsItem =
                              searchResults[searchResultsIndex];
                          return Container(
                            height: 75.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: FlutterFlowTheme.of(context)
                                      .opagueSeparator,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                        child: GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: CustomPushNotificationWidget(
                                          userGroupChosen:
                                              searchResultsItem.usersWithTag,
                                        ),
                                      ),
                                    ));
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              onLongPress: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Color(0x00000000),
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                        child: GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: DeleteTagWidget(
                                          tagSelected:
                                              searchResultsItem.reference,
                                        ),
                                      ),
                                    ));
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondarySystemBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 25.0,
                                        decoration: BoxDecoration(),
                                        child: AutoSizeText(
                                          searchResultsItem.tagName,
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                fontSize: 16.0,
                                              ),
                                        ),
                                      ),
                                      if (searchResultsItem
                                              .usersWithTag.length <=
                                          1)
                                        Text(
                                          '${searchResultsItem.usersWithTag.length.toString()} Person',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                        ),
                                      if (searchResultsItem
                                              .usersWithTag.length >
                                          1)
                                        Text(
                                          '${searchResultsItem.usersWithTag.length.toString()} People',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
