import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/journal_preview_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scripture_journals_other_model.dart';
export 'scripture_journals_other_model.dart';

class ScriptureJournalsOtherWidget extends StatefulWidget {
  const ScriptureJournalsOtherWidget({
    Key? key,
    this.selectedUser,
    this.selectedUserRef,
  }) : super(key: key);

  final UsersRecord? selectedUser;
  final DocumentReference? selectedUserRef;

  @override
  _ScriptureJournalsOtherWidgetState createState() =>
      _ScriptureJournalsOtherWidgetState();
}

class _ScriptureJournalsOtherWidgetState
    extends State<ScriptureJournalsOtherWidget> with TickerProviderStateMixin {
  late ScriptureJournalsOtherModel _model;

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
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScriptureJournalsOtherModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<PersonalJournalsRecord>>(
      future: queryPersonalJournalsRecordOnce(
        queryBuilder: (personalJournalsRecord) => personalJournalsRecord
            .where(
              'journalTwo',
              isEqualTo: true,
            )
            .where(
              'journalUser',
              isEqualTo: currentUserReference,
            )
            .orderBy('journalDate', descending: true),
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
        List<PersonalJournalsRecord> containerPersonalJournalsRecordList =
            snapshot.data!;
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary,
          ),
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
                                Navigator.pop(context);
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
                              '86c6qw97' /* Hello, */,
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
                          Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0xFF6D6DAE),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (Theme.of(context).brightness ==
                                      Brightness.dark)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 5.0, 5.0, 5.0),
                                      child: SvgPicture.asset(
                                        'assets/images/bookmarks-simple-fill_(4).svg',
                                        width: double.infinity,
                                        height: 16.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  if (!(Theme.of(context).brightness ==
                                      Brightness.dark))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 5.0, 5.0, 5.0),
                                      child: SvgPicture.asset(
                                        'assets/images/bookmarks-simple-fill_(2).svg',
                                        width: double.infinity,
                                        height: 18.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ).animateOnPageLoad(
                          animationsMap['rowOnPageLoadAnimation']!),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 8.0, 0.0, 35.0),
                        child: Text(
                          'Here\'s the archive of scripture journals from ${widget.selectedUser?.displayName}',
                          maxLines: 2,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).systemGray,
                              ),
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation']!),
                      ),
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
                                  });
                                  FFAppState().update(() {
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
                                        's3q7a663' /* Newest */,
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
                                      .secondarySystemBackground,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'rdpy6jcy' /* Newest */,
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
                                    });
                                    FFAppState().update(() {
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
                                          '7wogx8v8' /* Oldest */,
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
                                      .secondarySystemBackground,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'esfozms2' /* Oldest */,
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
                                  });
                                  FFAppState().update(() {
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
                                        'y0sbeiei' /* Likes */,
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
                                      .secondarySystemBackground,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'teez41z7' /* Likes */,
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
                                  });
                                  FFAppState().update(() {
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
                                        'wnhu6jr5' /* Replies */,
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
                                      .secondarySystemBackground,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'yd8h52ch' /* Replies */,
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
                        animationsMap['columnOnPageLoadAnimation4']!),
                  ],
                ),
              ),
              if (FFAppState().OneWeekAdmin)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.75,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 45.0),
                          child: StreamBuilder<List<PersonalJournalsRecord>>(
                            stream: queryPersonalJournalsRecord(
                              queryBuilder: (personalJournalsRecord) =>
                                  personalJournalsRecord
                                      .where(
                                        'journalTwo',
                                        isEqualTo: true,
                                      )
                                      .where(
                                        'journalUser',
                                        isEqualTo:
                                            widget.selectedUser?.reference,
                                      )
                                      .orderBy('journalDate', descending: true),
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
                              List<PersonalJournalsRecord>
                                  columnPersonalJournalsRecordList =
                                  snapshot.data!;
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      columnPersonalJournalsRecordList.length,
                                      (columnIndex) {
                                    final columnPersonalJournalsRecord =
                                        columnPersonalJournalsRecordList[
                                            columnIndex];
                                    return JournalPreviewWidget(
                                      key: Key(
                                          'Keydhs_${columnIndex}_of_${columnPersonalJournalsRecordList.length}'),
                                      chosenJournalRef:
                                          columnPersonalJournalsRecord
                                              .reference,
                                      chosenJournalDoc:
                                          columnPersonalJournalsRecord,
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (FFAppState().OneMonthAdmin)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.75,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 45.0),
                          child: StreamBuilder<List<PersonalJournalsRecord>>(
                            stream: queryPersonalJournalsRecord(
                              queryBuilder: (personalJournalsRecord) =>
                                  personalJournalsRecord
                                      .where(
                                        'journalTwo',
                                        isEqualTo: true,
                                      )
                                      .where(
                                        'journalUser',
                                        isEqualTo:
                                            widget.selectedUser?.reference,
                                      )
                                      .orderBy('journalDate'),
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
                              List<PersonalJournalsRecord>
                                  columnPersonalJournalsRecordList =
                                  snapshot.data!;
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      columnPersonalJournalsRecordList.length,
                                      (columnIndex) {
                                    final columnPersonalJournalsRecord =
                                        columnPersonalJournalsRecordList[
                                            columnIndex];
                                    return JournalPreviewWidget(
                                      key: Key(
                                          'Key2p5_${columnIndex}_of_${columnPersonalJournalsRecordList.length}'),
                                      chosenJournalRef:
                                          columnPersonalJournalsRecord
                                              .reference,
                                      chosenJournalDoc:
                                          columnPersonalJournalsRecord,
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (FFAppState().SixMonthsAdmin)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.75,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 45.0),
                          child: StreamBuilder<List<PersonalJournalsRecord>>(
                            stream: queryPersonalJournalsRecord(
                              queryBuilder: (personalJournalsRecord) =>
                                  personalJournalsRecord
                                      .where(
                                        'journalTwo',
                                        isEqualTo: true,
                                      )
                                      .where(
                                        'journalUser',
                                        isEqualTo:
                                            widget.selectedUser?.reference,
                                      )
                                      .orderBy('publicLikes', descending: true),
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
                              List<PersonalJournalsRecord>
                                  columnPersonalJournalsRecordList =
                                  snapshot.data!;
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      columnPersonalJournalsRecordList.length,
                                      (columnIndex) {
                                    final columnPersonalJournalsRecord =
                                        columnPersonalJournalsRecordList[
                                            columnIndex];
                                    return JournalPreviewWidget(
                                      key: Key(
                                          'Keymjo_${columnIndex}_of_${columnPersonalJournalsRecordList.length}'),
                                      chosenJournalRef:
                                          columnPersonalJournalsRecord
                                              .reference,
                                      chosenJournalDoc:
                                          columnPersonalJournalsRecord,
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (FFAppState().OneYearAdmin)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.75,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 45.0),
                          child: StreamBuilder<List<PersonalJournalsRecord>>(
                            stream: queryPersonalJournalsRecord(
                              queryBuilder: (personalJournalsRecord) =>
                                  personalJournalsRecord
                                      .where(
                                        'journalTwo',
                                        isEqualTo: true,
                                      )
                                      .where(
                                        'journalUser',
                                        isEqualTo:
                                            widget.selectedUser?.reference,
                                      )
                                      .orderBy('journalRepliesNum',
                                          descending: true),
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
                              List<PersonalJournalsRecord>
                                  columnPersonalJournalsRecordList =
                                  snapshot.data!;
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      columnPersonalJournalsRecordList.length,
                                      (columnIndex) {
                                    final columnPersonalJournalsRecord =
                                        columnPersonalJournalsRecordList[
                                            columnIndex];
                                    return JournalPreviewWidget(
                                      key: Key(
                                          'Key2na_${columnIndex}_of_${columnPersonalJournalsRecordList.length}'),
                                      chosenJournalRef:
                                          columnPersonalJournalsRecord
                                              .reference,
                                      chosenJournalDoc:
                                          columnPersonalJournalsRecord,
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
