import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/journal_preview_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scripture_archives_model.dart';
export 'scripture_archives_model.dart';

class ScriptureArchivesWidget extends StatefulWidget {
  const ScriptureArchivesWidget({super.key});

  @override
  State<ScriptureArchivesWidget> createState() =>
      _ScriptureArchivesWidgetState();
}

class _ScriptureArchivesWidgetState extends State<ScriptureArchivesWidget> {
  late ScriptureArchivesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScriptureArchivesModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: FutureBuilder<List<PersonalJournalsRecord>>(
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
                                    context.pop();
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 10.0, 22.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '38ynkyob' /* Hello, */,
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
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .label,
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
                                          padding: EdgeInsets.all(5.0),
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
                                          padding: EdgeInsets.all(5.0),
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
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 8.0, 0.0, 35.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'x7zqtc0a' /* Here's the archive of your scr... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color:
                                      FlutterFlowTheme.of(context).systemGray,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'qmi8xaq5' /* Newest */,
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
                            if (FFAppState().OneWeekAdmin)
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0x1C000000),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryGrey12,
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '1sabpsql' /* Newest */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontSize: 14.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'a4wy5ndm' /* Oldest */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                  color: Color(0x1C000000),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryGrey12,
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'rbhic3ic' /* Oldest */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontSize: 14.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '0pg70ris' /* Likes */,
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
                            if (FFAppState().SixMonthsAdmin)
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0x1C000000),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryGrey12,
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'a4u6suax' /* Likes */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontSize: 14.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'nprhflhm' /* Replies */,
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
                            if (FFAppState().OneYearAdmin)
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0x1C000000),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryGrey12,
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'acvz119r' /* Replies */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontSize: 14.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (FFAppState().OneWeekAdmin)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                              child:
                                  StreamBuilder<List<PersonalJournalsRecord>>(
                                stream: queryPersonalJournalsRecord(
                                  queryBuilder: (personalJournalsRecord) =>
                                      personalJournalsRecord
                                          .where(
                                            'journalTwo',
                                            isEqualTo: true,
                                          )
                                          .where(
                                            'journalUser',
                                            isEqualTo: currentUserReference,
                                          )
                                          .orderBy('journalDate',
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
                                          columnPersonalJournalsRecordList
                                              .length, (columnIndex) {
                                        final columnPersonalJournalsRecord =
                                            columnPersonalJournalsRecordList[
                                                columnIndex];
                                        return JournalPreviewWidget(
                                          key: Key(
                                              'Keyef2_${columnIndex}_of_${columnPersonalJournalsRecordList.length}'),
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                              child:
                                  StreamBuilder<List<PersonalJournalsRecord>>(
                                stream: queryPersonalJournalsRecord(
                                  queryBuilder: (personalJournalsRecord) =>
                                      personalJournalsRecord
                                          .where(
                                            'journalTwo',
                                            isEqualTo: true,
                                          )
                                          .where(
                                            'journalUser',
                                            isEqualTo: currentUserReference,
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
                                          columnPersonalJournalsRecordList
                                              .length, (columnIndex) {
                                        final columnPersonalJournalsRecord =
                                            columnPersonalJournalsRecordList[
                                                columnIndex];
                                        return JournalPreviewWidget(
                                          key: Key(
                                              'Keyolh_${columnIndex}_of_${columnPersonalJournalsRecordList.length}'),
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                              child:
                                  StreamBuilder<List<PersonalJournalsRecord>>(
                                stream: queryPersonalJournalsRecord(
                                  queryBuilder: (personalJournalsRecord) =>
                                      personalJournalsRecord
                                          .where(
                                            'journalTwo',
                                            isEqualTo: true,
                                          )
                                          .where(
                                            'journalUser',
                                            isEqualTo: currentUserReference,
                                          )
                                          .orderBy('publicLikes',
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
                                          columnPersonalJournalsRecordList
                                              .length, (columnIndex) {
                                        final columnPersonalJournalsRecord =
                                            columnPersonalJournalsRecordList[
                                                columnIndex];
                                        return JournalPreviewWidget(
                                          key: Key(
                                              'Key9si_${columnIndex}_of_${columnPersonalJournalsRecordList.length}'),
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                              child:
                                  StreamBuilder<List<PersonalJournalsRecord>>(
                                stream: queryPersonalJournalsRecord(
                                  queryBuilder: (personalJournalsRecord) =>
                                      personalJournalsRecord
                                          .where(
                                            'journalTwo',
                                            isEqualTo: true,
                                          )
                                          .where(
                                            'journalUser',
                                            isEqualTo: currentUserReference,
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
                                          columnPersonalJournalsRecordList
                                              .length, (columnIndex) {
                                        final columnPersonalJournalsRecord =
                                            columnPersonalJournalsRecordList[
                                                columnIndex];
                                        return JournalPreviewWidget(
                                          key: Key(
                                              'Keyorf_${columnIndex}_of_${columnPersonalJournalsRecordList.length}'),
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
        ),
      ),
    );
  }
}
