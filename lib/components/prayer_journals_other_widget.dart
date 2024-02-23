import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/journal_preview_widget.dart';
import '/components/prayer_ring_small_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'prayer_journals_other_model.dart';
export 'prayer_journals_other_model.dart';

class PrayerJournalsOtherWidget extends StatefulWidget {
  const PrayerJournalsOtherWidget({
    super.key,
    this.selectedUser,
    this.selectedUserRef,
  });

  final UsersRecord? selectedUser;
  final DocumentReference? selectedUserRef;

  @override
  State<PrayerJournalsOtherWidget> createState() =>
      _PrayerJournalsOtherWidgetState();
}

class _PrayerJournalsOtherWidgetState extends State<PrayerJournalsOtherWidget> {
  late PrayerJournalsOtherModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrayerJournalsOtherModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
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
                          '2o1kb5iw' /* Hello, */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context)
                                  .lightSecondaryText,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            currentUserDisplayName,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).tertiary,
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
                      wrapWithModel(
                        model: _model.prayerRingSmallModel,
                        updateCallback: () => setState(() {}),
                        child: PrayerRingSmallWidget(),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 0.0, 35.0),
                    child: Text(
                      'Here\'s the prayer journal archives from ${widget.selectedUser?.displayName}',
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color:
                                FlutterFlowTheme.of(context).lightSecondaryText,
                          ),
                    ),
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
                                    'ritkbi25' /* Newest */,
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
                                  'l3ipobx5' /* Newest */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '8tpri0b5' /* Oldest */,
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
                                  'wdfoutqq' /* Oldest */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '3oich8io' /* Likes */,
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
                                  'qu49cm97' /* Likes */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'zqas3paj' /* Replies */,
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
                                  'p49yl5vf' /* Replies */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 45.0),
                      child: StreamBuilder<List<PersonalJournalsRecord>>(
                        stream: queryPersonalJournalsRecord(
                          queryBuilder: (personalJournalsRecord) =>
                              personalJournalsRecord
                                  .where(
                                    'journalThree',
                                    isEqualTo: true,
                                  )
                                  .where(
                                    'journalUser',
                                    isEqualTo: widget.selectedUser?.reference,
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
                              columnPersonalJournalsRecordList = snapshot.data!;
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
                                      'Keywry_${columnIndex}_of_${columnPersonalJournalsRecordList.length}'),
                                  chosenJournalRef:
                                      columnPersonalJournalsRecord.reference,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 45.0),
                      child: StreamBuilder<List<PersonalJournalsRecord>>(
                        stream: queryPersonalJournalsRecord(
                          queryBuilder: (personalJournalsRecord) =>
                              personalJournalsRecord
                                  .where(
                                    'journalThree',
                                    isEqualTo: true,
                                  )
                                  .where(
                                    'journalUser',
                                    isEqualTo: widget.selectedUser?.reference,
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
                              columnPersonalJournalsRecordList = snapshot.data!;
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
                                      'Keyz5i_${columnIndex}_of_${columnPersonalJournalsRecordList.length}'),
                                  chosenJournalRef:
                                      columnPersonalJournalsRecord.reference,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 45.0),
                      child: StreamBuilder<List<PersonalJournalsRecord>>(
                        stream: queryPersonalJournalsRecord(
                          queryBuilder: (personalJournalsRecord) =>
                              personalJournalsRecord
                                  .where(
                                    'journalThree',
                                    isEqualTo: true,
                                  )
                                  .where(
                                    'journalUser',
                                    isEqualTo: widget.selectedUser?.reference,
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
                              columnPersonalJournalsRecordList = snapshot.data!;
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
                                      'Key060_${columnIndex}_of_${columnPersonalJournalsRecordList.length}'),
                                  chosenJournalRef:
                                      columnPersonalJournalsRecord.reference,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 45.0),
                      child: StreamBuilder<List<PersonalJournalsRecord>>(
                        stream: queryPersonalJournalsRecord(
                          queryBuilder: (personalJournalsRecord) =>
                              personalJournalsRecord
                                  .where(
                                    'journalThree',
                                    isEqualTo: true,
                                  )
                                  .where(
                                    'journalUser',
                                    isEqualTo: widget.selectedUser?.reference,
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
                              columnPersonalJournalsRecordList = snapshot.data!;
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
                                      'Key5aj_${columnIndex}_of_${columnPersonalJournalsRecordList.length}'),
                                  chosenJournalRef:
                                      columnPersonalJournalsRecord.reference,
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
  }
}
