import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/practice_journal_preview_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'all_journals_model.dart';
export 'all_journals_model.dart';

class AllJournalsWidget extends StatefulWidget {
  const AllJournalsWidget({Key? key}) : super(key: key);

  @override
  _AllJournalsWidgetState createState() => _AllJournalsWidgetState();
}

class _AllJournalsWidgetState extends State<AllJournalsWidget>
    with TickerProviderStateMixin {
  late AllJournalsModel _model;

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
    'columnOnPageLoadAnimation1': AnimationInfo(
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
    'columnOnPageLoadAnimation2': AnimationInfo(
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
          begin: Offset(50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation3': AnimationInfo(
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
          begin: Offset(50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllJournalsModel());
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
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
                                FFAppState().update(() {
                                  FFAppState().OneWeekAdmin = true;
                                  FFAppState().OneMonthAdmin = false;
                                  FFAppState().SixMonthsAdmin = false;
                                  FFAppState().OneYearAdmin = false;
                                });
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
                              'cw0780z5' /* Hello, */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                          EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 0.0, 35.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '03oywy9c' /* Here's the overview of your da... */,
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
                padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().OneWeekAdmin)
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondarySystemBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  HapticFeedback.lightImpact();
                                  FFAppState().update(() {
                                    FFAppState().OneWeekAdmin = true;
                                    FFAppState().OneMonthAdmin = false;
                                    FFAppState().SixMonthsAdmin = false;
                                    FFAppState().OneYearAdmin = false;
                                  });
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'gs9dhllc' /* Newest */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            fontSize: 14.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if (FFAppState().OneWeekAdmin)
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryGrey12,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'egm7o3xq' /* Newest */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          fontSize: 14.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['columnOnPageLoadAnimation1']!),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().OneMonthAdmin)
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondarySystemBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Visibility(
                                visible: !FFAppState().OneMonthAdmin,
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    HapticFeedback.lightImpact();
                                    FFAppState().update(() {
                                      FFAppState().OneWeekAdmin = false;
                                      FFAppState().OneMonthAdmin = true;
                                      FFAppState().SixMonthsAdmin = false;
                                      FFAppState().OneYearAdmin = false;
                                    });
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'p0dpe2ci' /* Oldest */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: 14.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (FFAppState().OneMonthAdmin)
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryGrey12,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'z2ybt1nz' /* Oldest */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          fontSize: 14.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['columnOnPageLoadAnimation2']!),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().SixMonthsAdmin)
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondarySystemBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  HapticFeedback.lightImpact();
                                  FFAppState().update(() {
                                    FFAppState().OneWeekAdmin = false;
                                    FFAppState().OneMonthAdmin = false;
                                    FFAppState().SixMonthsAdmin = true;
                                    FFAppState().OneYearAdmin = false;
                                  });
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'pj8ah44u' /* Most
Responses */
                                        ,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            fontSize: 13.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if (FFAppState().SixMonthsAdmin)
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryGrey12,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '97z1tmyt' /* Most
Responses */
                                      ,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          fontSize: 13.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['columnOnPageLoadAnimation3']!),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().OneYearAdmin)
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondarySystemBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  HapticFeedback.lightImpact();
                                  FFAppState().update(() {
                                    FFAppState().OneWeekAdmin = false;
                                    FFAppState().OneMonthAdmin = false;
                                    FFAppState().SixMonthsAdmin = false;
                                    FFAppState().OneYearAdmin = true;
                                  });
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'pe5xwqwf' /* Least
Responses */
                                        ,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            fontSize: 13.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if (FFAppState().OneYearAdmin)
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryGrey12,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '7uak5bw9' /* Least
Responses */
                                      ,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          fontSize: 13.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['columnOnPageLoadAnimation4']!),
                  ],
                ),
              ),
              if (FFAppState().OneWeekAdmin)
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.75,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
                    child: PagedListView<DocumentSnapshot<Object?>?,
                        DailyPracticeVideosRecord>(
                      pagingController: _model.setListViewController1(
                        DailyPracticeVideosRecord.collection
                            .where(
                              'timeToLaunch',
                              isLessThanOrEqualTo: functions.getDayDate(),
                            )
                            .orderBy('timeToLaunch', descending: true),
                      ),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      builderDelegate:
                          PagedChildBuilderDelegate<DailyPracticeVideosRecord>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 75.0,
                            height: 75.0,
                            child: SpinKitRipple(
                              color: Color(0xFF7F95AD),
                              size: 75.0,
                            ),
                          ),
                        ),
                        // Customize what your widget looks like when it's loading another page.
                        newPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 75.0,
                            height: 75.0,
                            child: SpinKitRipple(
                              color: Color(0xFF7F95AD),
                              size: 75.0,
                            ),
                          ),
                        ),

                        itemBuilder: (context, _, listViewIndex) {
                          final listViewDailyPracticeVideosRecord = _model
                              .listViewPagingController1!
                              .itemList![listViewIndex];
                          return PracticeJournalPreviewWidget(
                            key: Key(
                                'Keyogf_${listViewIndex}_of_${_model.listViewPagingController1!.itemList!.length}'),
                            dailyVideoRef:
                                listViewDailyPracticeVideosRecord.reference,
                            dailyVideoDoc: listViewDailyPracticeVideosRecord,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              if (FFAppState().OneMonthAdmin)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.75,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
                      child: PagedListView<DocumentSnapshot<Object?>?,
                          DailyPracticeVideosRecord>(
                        pagingController: _model.setListViewController2(
                          DailyPracticeVideosRecord.collection
                              .where(
                                'timeToLaunch',
                                isLessThanOrEqualTo: functions.getDayDate(),
                              )
                              .orderBy('timeToLaunch'),
                        ),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        reverse: false,
                        scrollDirection: Axis.vertical,
                        builderDelegate: PagedChildBuilderDelegate<
                            DailyPracticeVideosRecord>(
                          // Customize what your widget looks like when it's loading the first page.
                          firstPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 75.0,
                              height: 75.0,
                              child: SpinKitRipple(
                                color: Color(0xFF7F95AD),
                                size: 75.0,
                              ),
                            ),
                          ),
                          // Customize what your widget looks like when it's loading another page.
                          newPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 75.0,
                              height: 75.0,
                              child: SpinKitRipple(
                                color: Color(0xFF7F95AD),
                                size: 75.0,
                              ),
                            ),
                          ),

                          itemBuilder: (context, _, listViewIndex) {
                            final listViewDailyPracticeVideosRecord = _model
                                .listViewPagingController2!
                                .itemList![listViewIndex];
                            return PracticeJournalPreviewWidget(
                              key: Key(
                                  'Key6ka_${listViewIndex}_of_${_model.listViewPagingController2!.itemList!.length}'),
                              dailyVideoRef:
                                  listViewDailyPracticeVideosRecord.reference,
                              dailyVideoDoc: listViewDailyPracticeVideosRecord,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              if (FFAppState().SixMonthsAdmin)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.75,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
                      child: PagedListView<DocumentSnapshot<Object?>?,
                          DailyPracticeVideosRecord>(
                        pagingController: _model.setListViewController3(
                          DailyPracticeVideosRecord.collection.orderBy(
                              'personalJournalCount',
                              descending: true),
                        ),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        reverse: false,
                        scrollDirection: Axis.vertical,
                        builderDelegate: PagedChildBuilderDelegate<
                            DailyPracticeVideosRecord>(
                          // Customize what your widget looks like when it's loading the first page.
                          firstPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 75.0,
                              height: 75.0,
                              child: SpinKitRipple(
                                color: Color(0xFF7F95AD),
                                size: 75.0,
                              ),
                            ),
                          ),
                          // Customize what your widget looks like when it's loading another page.
                          newPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 75.0,
                              height: 75.0,
                              child: SpinKitRipple(
                                color: Color(0xFF7F95AD),
                                size: 75.0,
                              ),
                            ),
                          ),

                          itemBuilder: (context, _, listViewIndex) {
                            final listViewDailyPracticeVideosRecord = _model
                                .listViewPagingController3!
                                .itemList![listViewIndex];
                            return PracticeJournalPreviewWidget(
                              key: Key(
                                  'Keyxc2_${listViewIndex}_of_${_model.listViewPagingController3!.itemList!.length}'),
                              dailyVideoRef:
                                  listViewDailyPracticeVideosRecord.reference,
                              dailyVideoDoc: listViewDailyPracticeVideosRecord,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              if (FFAppState().OneYearAdmin)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.75,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
                      child: PagedListView<DocumentSnapshot<Object?>?,
                          DailyPracticeVideosRecord>(
                        pagingController: _model.setListViewController4(
                          DailyPracticeVideosRecord.collection
                              .orderBy('personalJournalCount'),
                        ),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        reverse: false,
                        scrollDirection: Axis.vertical,
                        builderDelegate: PagedChildBuilderDelegate<
                            DailyPracticeVideosRecord>(
                          // Customize what your widget looks like when it's loading the first page.
                          firstPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 75.0,
                              height: 75.0,
                              child: SpinKitRipple(
                                color: Color(0xFF7F95AD),
                                size: 75.0,
                              ),
                            ),
                          ),
                          // Customize what your widget looks like when it's loading another page.
                          newPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 75.0,
                              height: 75.0,
                              child: SpinKitRipple(
                                color: Color(0xFF7F95AD),
                                size: 75.0,
                              ),
                            ),
                          ),

                          itemBuilder: (context, _, listViewIndex) {
                            final listViewDailyPracticeVideosRecord = _model
                                .listViewPagingController4!
                                .itemList![listViewIndex];
                            return PracticeJournalPreviewWidget(
                              key: Key(
                                  'Keyoe3_${listViewIndex}_of_${_model.listViewPagingController4!.itemList!.length}'),
                              dailyVideoRef:
                                  listViewDailyPracticeVideosRecord.reference,
                              dailyVideoDoc: listViewDailyPracticeVideosRecord,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
