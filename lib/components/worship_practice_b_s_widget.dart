import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_state_journals_widget.dart';
import '/components/journal_response_preview_widget.dart';
import '/components/language_report_widget.dart';
import '/components/percentage_completed1_widget.dart';
import '/components/read_scripture_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'worship_practice_b_s_model.dart';
export 'worship_practice_b_s_model.dart';

class WorshipPracticeBSWidget extends StatefulWidget {
  const WorshipPracticeBSWidget({
    Key? key,
    this.dailyPractice,
  }) : super(key: key);

  final DailyPracticeVideosRecord? dailyPractice;

  @override
  _WorshipPracticeBSWidgetState createState() =>
      _WorshipPracticeBSWidgetState();
}

class _WorshipPracticeBSWidgetState extends State<WorshipPracticeBSWidget>
    with TickerProviderStateMixin {
  late WorshipPracticeBSModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = {
    'youtubePlayerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 2000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: Offset(0.0, -100.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 1.0),
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
    _model = createModel(context, () => WorshipPracticeBSModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation();
      setState(() {
        FFAppState().newestFirst = true;
      });
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textField1Controller ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.dailyPractice?.practiceResponse,
      'What did God speak to you?',
    ));
    _model.textField1FocusNode ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.07,
                  decoration: BoxDecoration(),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: FlutterFlowYoutubePlayer(
                    url: widget.dailyPractice!.dailyPracticeVideoURL,
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    autoPlay: false,
                    looping: false,
                    mute: false,
                    showControls: true,
                    showFullScreen: true,
                  ).animateOnPageLoad(
                      animationsMap['youtubePlayerOnPageLoadAnimation']!),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 4.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.95,
                    child: TextFormField(
                      controller: _model.textField1Controller,
                      focusNode: _model.textField1FocusNode,
                      textCapitalization: TextCapitalization.sentences,
                      readOnly: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'an5s8fih' /* Worship Journal Prompt */,
                        ),
                        labelStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).worshipRing,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context)
                                .textFieldColorSecondary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context)
                            .secondarySystemBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).label,
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      minLines: 1,
                      validator: _model.textField1ControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FutureBuilder<List<AdminDataRecord>>(
                          future: queryAdminDataRecordOnce(
                            queryBuilder: (adminDataRecord) => adminDataRecord
                                .orderBy('day', descending: true),
                            singleRecord: true,
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
                            List<AdminDataRecord> containerAdminDataRecordList =
                                snapshot.data!;
                            final containerAdminDataRecord =
                                containerAdminDataRecordList.isNotEmpty
                                    ? containerAdminDataRecordList.first
                                    : null;
                            return Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '7fvkrive' /* Responses */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lightSecondaryText,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(),
                                        child: FlutterFlowTimer(
                                          initialTime: _model.timerMilliseconds,
                                          getDisplayTime: (value) =>
                                              StopWatchTimer.getDisplayTime(
                                                  value,
                                                  milliSecond: false),
                                          controller: _model.timerController,
                                          onChanged: (value, displayTime,
                                              shouldUpdate) {
                                            _model.timerMilliseconds = value;
                                            _model.timerValue = displayTime;
                                            if (shouldUpdate) setState(() {});
                                          },
                                          onEnded: () async {
                                            var _shouldSetState = false;
                                            final firestoreBatch =
                                                FirebaseFirestore.instance
                                                    .batch();
                                            try {
                                              if (FFAppState().timerStarted) {
                                                _model.scanResults =
                                                    await actions.scanLanguage(
                                                  _model.textController2.text,
                                                );
                                                _shouldSetState = true;
                                                if (_model.scanResults!) {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    barrierColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .opagueSeparator,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                          child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            LanguageReportWidget(),
                                                      ));
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                } else {
                                                  var personalJournalsRecordReference =
                                                      PersonalJournalsRecord
                                                          .collection
                                                          .doc();
                                                  firestoreBatch.set(
                                                      personalJournalsRecordReference,
                                                      createPersonalJournalsRecordData(
                                                        journalDate:
                                                            getCurrentTimestamp,
                                                        journalUser:
                                                            currentUserReference,
                                                        journalText: _model
                                                            .textController2
                                                            .text,
                                                        journalOne: true,
                                                        journalResponseQuestion:
                                                            widget.dailyPractice
                                                                ?.practiceResponse,
                                                        videoURL: widget
                                                            .dailyPractice
                                                            ?.dailyPracticeVideoURL,
                                                        dailyPractice: widget
                                                            .dailyPractice
                                                            ?.reference,
                                                        journalDayDate:
                                                            functions
                                                                .getDayDate(),
                                                      ));
                                                  _model.newJournal =
                                                      PersonalJournalsRecord
                                                          .getDocumentFromData(
                                                              createPersonalJournalsRecordData(
                                                                journalDate:
                                                                    getCurrentTimestamp,
                                                                journalUser:
                                                                    currentUserReference,
                                                                journalText: _model
                                                                    .textController2
                                                                    .text,
                                                                journalOne:
                                                                    true,
                                                                journalResponseQuestion: widget
                                                                    .dailyPractice
                                                                    ?.practiceResponse,
                                                                videoURL: widget
                                                                    .dailyPractice
                                                                    ?.dailyPracticeVideoURL,
                                                                dailyPractice: widget
                                                                    .dailyPractice
                                                                    ?.reference,
                                                                journalDayDate:
                                                                    functions
                                                                        .getDayDate(),
                                                              ),
                                                              personalJournalsRecordReference);
                                                  _shouldSetState = true;
                                                  if (valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.complete3,
                                                          false) &&
                                                      valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.completed2,
                                                          false)) {
                                                    if (functions.checkYesterdayDate(
                                                            currentUserDocument
                                                                ?.dateofCompletion)! ||
                                                        functions.checkTodayDate(
                                                            currentUserDocument
                                                                ?.dateofCompletion)!) {
                                                      firestoreBatch.update(
                                                          currentUserReference!,
                                                          {
                                                            ...mapToFirestore(
                                                              {
                                                                'dailyStreak':
                                                                    FieldValue
                                                                        .increment(
                                                                            1),
                                                              },
                                                            ),
                                                          });
                                                    } else {
                                                      firestoreBatch.update(
                                                          currentUserReference!,
                                                          createUsersRecordData(
                                                            dailyStreak: 1,
                                                          ));
                                                    }

                                                    firestoreBatch.update(
                                                        currentUserReference!, {
                                                      ...createUsersRecordData(
                                                        dateofCompletion:
                                                            functions
                                                                .getDayDate(),
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'completionNumber':
                                                              FieldValue
                                                                  .increment(1),
                                                        },
                                                      ),
                                                    });
                                                  }
                                                  setState(() {
                                                    _model.textController2
                                                        ?.clear();
                                                  });

                                                  firestoreBatch.update(
                                                      widget.dailyPractice!
                                                          .reference,
                                                      {
                                                        ...mapToFirestore(
                                                          {
                                                            'personalJournalRef':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              _model.newJournal
                                                                  ?.reference
                                                            ]),
                                                            'personalJournalCount':
                                                                FieldValue
                                                                    .increment(
                                                                        1),
                                                          },
                                                        ),
                                                      });

                                                  firestoreBatch.update(
                                                      currentUserReference!, {
                                                    ...createUsersRecordData(
                                                      completed1: true,
                                                      percentageCompleted1: 1,
                                                      completedtime1:
                                                          getCurrentTimestamp,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'timesCompletedJournal':
                                                            FieldValue
                                                                .increment(1),
                                                      },
                                                    ),
                                                  });
                                                  if (dateTimeFormat(
                                                        'yMMMd',
                                                        getCurrentTimestamp,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ) !=
                                                      dateTimeFormat(
                                                        'yMMMd',
                                                        containerAdminDataRecord
                                                            ?.currentDay,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )) {
                                                    var adminDataRecordReference =
                                                        AdminDataRecord
                                                            .collection
                                                            .doc();
                                                    firestoreBatch.set(
                                                        adminDataRecordReference,
                                                        createAdminDataRecordData(
                                                          day:
                                                              containerAdminDataRecord
                                                                  ?.day,
                                                          currentDay:
                                                              getCurrentTimestamp,
                                                          times1Completed: 1,
                                                          times2Completed: 0,
                                                          times3Completed: 0,
                                                        ));
                                                    _model.newAdminData = AdminDataRecord
                                                        .getDocumentFromData(
                                                            createAdminDataRecordData(
                                                              day:
                                                                  containerAdminDataRecord
                                                                      ?.day,
                                                              currentDay:
                                                                  getCurrentTimestamp,
                                                              times1Completed:
                                                                  1,
                                                              times2Completed:
                                                                  0,
                                                              times3Completed:
                                                                  0,
                                                            ),
                                                            adminDataRecordReference);
                                                    _shouldSetState = true;

                                                    firestoreBatch.update(
                                                        _model.newAdminData!
                                                            .reference,
                                                        {
                                                          ...mapToFirestore(
                                                            {
                                                              'day': FieldValue
                                                                  .increment(1),
                                                            },
                                                          ),
                                                        });
                                                  } else {
                                                    firestoreBatch.update(
                                                        containerAdminDataRecord!
                                                            .reference,
                                                        {
                                                          ...mapToFirestore(
                                                            {
                                                              'times_1Completed':
                                                                  FieldValue
                                                                      .increment(
                                                                          1),
                                                            },
                                                          ),
                                                        });
                                                  }
                                                }

                                                setState(() {
                                                  FFAppState().timerStarted =
                                                      false;
                                                });
                                                showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  barrierColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .opagueSeparator,
                                                  isDismissible: false,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return WebViewAware(
                                                        child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          PercentageCompleted1Widget(),
                                                    ));
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              } else {
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            } finally {
                                              await firestoreBatch.commit();
                                            }

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                        ),
                                      ),
                                    ),
                                    if (widget.dailyPractice
                                                ?.scriptureReference !=
                                            null &&
                                        widget.dailyPractice
                                                ?.scriptureReference !=
                                            '')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 12.0, 0.0),
                                        child: Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                barrierColor:
                                                    FlutterFlowTheme.of(context)
                                                        .opagueSeparator,
                                                context: context,
                                                builder: (context) {
                                                  return WebViewAware(
                                                      child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: ReadScriptureWidget(
                                                      pdfImageSelected:
                                                          widget.dailyPractice,
                                                      pdfImageSelectedRef:
                                                          widget.dailyPractice
                                                              ?.reference,
                                                    ),
                                                  ));
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(
                                                        context)
                                                    .secondarySystemBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Icon(
                                                  Icons.menu_book_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 25.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondarySystemBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState().update(() {
                                                FFAppState().showOptions = true;
                                              });
                                            },
                                            child: Icon(
                                              Icons.filter_list_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondarySystemBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.close_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 26.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        if (FFAppState().newestFirst)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: StreamBuilder<List<PersonalJournalsRecord>>(
                              stream: queryPersonalJournalsRecord(
                                queryBuilder: (personalJournalsRecord) =>
                                    personalJournalsRecord
                                        .where(
                                          'dailyPractice',
                                          isEqualTo:
                                              widget.dailyPractice?.reference,
                                        )
                                        .where(
                                          'journalDayDate',
                                          isEqualTo: functions.getDayDate(),
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
                                if (columnPersonalJournalsRecordList.isEmpty) {
                                  return Center(
                                    child: EmptyStateJournalsWidget(),
                                  );
                                }
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: List.generate(
                                        columnPersonalJournalsRecordList.length,
                                        (columnIndex) {
                                      final columnPersonalJournalsRecord =
                                          columnPersonalJournalsRecordList[
                                              columnIndex];
                                      return JournalResponsePreviewWidget(
                                        key: Key(
                                            'Keycue_${columnIndex}_of_${columnPersonalJournalsRecordList.length}'),
                                        journalInListRef:
                                            columnPersonalJournalsRecord
                                                .reference,
                                        journalInListDoc:
                                            columnPersonalJournalsRecord,
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ),
                        if (!FFAppState().newestFirst)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 16.0, 0.0),
                            child: StreamBuilder<List<PersonalJournalsRecord>>(
                              stream: queryPersonalJournalsRecord(
                                queryBuilder: (personalJournalsRecord) =>
                                    personalJournalsRecord
                                        .where(
                                          'dailyPractice',
                                          isEqualTo:
                                              widget.dailyPractice?.reference,
                                        )
                                        .where(
                                          'journalDayDate',
                                          isEqualTo: functions.getDayDate(),
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
                                    mainAxisSize: MainAxisSize.min,
                                    children: List.generate(
                                        columnPersonalJournalsRecordList.length,
                                        (columnIndex) {
                                      final columnPersonalJournalsRecord =
                                          columnPersonalJournalsRecordList[
                                              columnIndex];
                                      return JournalResponsePreviewWidget(
                                        key: Key(
                                            'Keyq9v_${columnIndex}_of_${columnPersonalJournalsRecordList.length}'),
                                        journalInListRef:
                                            columnPersonalJournalsRecord
                                                .reference,
                                        journalInListDoc:
                                            columnPersonalJournalsRecord,
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                if (!(isWeb
                    ? MediaQuery.viewInsetsOf(context).bottom > 0
                    : _isKeyboardVisible))
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.12,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                if (isWeb
                    ? MediaQuery.viewInsetsOf(context).bottom > 0
                    : _isKeyboardVisible)
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.1,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
              ],
            ),
          ),
          if (responsiveVisibility(
            context: context,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          ))
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (isWeb
                      ? MediaQuery.viewInsetsOf(context).bottom > 0
                      : _isKeyboardVisible)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await actions.dismissKeyboard();
                      },
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.08,
                        decoration: BoxDecoration(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 3.0,
                              sigmaY: 3.0,
                            ),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if ((dateTimeFormat(
                                    'yMMMd',
                                    currentUserDocument?.completedtime1,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ) ==
                                  dateTimeFormat(
                                    'yMMMd',
                                    getCurrentTimestamp,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )) &&
                              !(isWeb
                                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                                  : _isKeyboardVisible))
                            AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.12,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).worshipRing,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: Colors.white,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 8.0, 20.0, 8.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'qx4hw8z2' /* Completed! */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            Color(0xFFFEFDEC),
                                                        fontSize: 16.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if (dateTimeFormat(
                                'yMMMd',
                                currentUserDocument?.completedtime1,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ) !=
                              dateTimeFormat(
                                'yMMMd',
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ))
                            AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.95,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.96,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondarySystemBackground,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 2.0, 8.0, 2.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textController2,
                                                      focusNode: _model
                                                          .textFieldFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.textController2',
                                                        Duration(
                                                            milliseconds: 0),
                                                        () => setState(() {}),
                                                      ),
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .sentences,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'fnj1vf3v' /* Write your response here */,
                                                        ),
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                ),
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'zc097da8' /* Typing... */,
                                                        ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lightSecondaryText,
                                                                ),
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                              ),
                                                      maxLines: 6,
                                                      minLines: 1,
                                                      keyboardType:
                                                          TextInputType
                                                              .multiline,
                                                      validator: _model
                                                          .textController2Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    if (_model.textController2
                                                                .text ==
                                                            null ||
                                                        _model.textController2
                                                                .text ==
                                                            '')
                                                      Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .arrowCircleUp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .systemGray,
                                                                size: 26.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    if (_model.textController2
                                                                .text !=
                                                            null &&
                                                        _model.textController2
                                                                .text !=
                                                            '')
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (_model.textController2
                                                                      .text !=
                                                                  null &&
                                                              _model.textController2
                                                                      .text !=
                                                                  '') {
                                                            setState(() {
                                                              FFAppState()
                                                                      .timerStarted =
                                                                  true;
                                                            });
                                                            HapticFeedback
                                                                .lightImpact();
                                                            _model
                                                                .timerController
                                                                .onStartTimer();
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .arrowCircleUp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .worshipRing,
                                                                  size: 26.0,
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
                                        ),
                                      ),
                                    ),
                                    if (!(isWeb
                                        ? MediaQuery.viewInsetsOf(context)
                                                .bottom >
                                            0
                                        : _isKeyboardVisible))
                                      Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.06,
                                        decoration: BoxDecoration(),
                                      ),
                                    if (isWeb
                                        ? MediaQuery.viewInsetsOf(context)
                                                .bottom >
                                            0
                                        : _isKeyboardVisible)
                                      Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.02,
                                        decoration: BoxDecoration(),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          if (FFAppState().showOptions)
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                FFAppState().update(() {
                  FFAppState().showOptions = false;
                });
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0.7, -0.48),
                  child: Container(
                    width: 140.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 10.0,
                          height: MediaQuery.sizeOf(context).height * 0.36,
                          decoration: BoxDecoration(),
                        ),
                        Material(
                          color: Colors.transparent,
                          elevation: 10.0,
                          child: Container(
                            width: 140.0,
                            height: 100.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().update(() {
                                            FFAppState().newestFirst = false;
                                            FFAppState().showOptions = false;
                                          });
                                        },
                                        child: Container(
                                          width: 100.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondarySystemBackground,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(8.0),
                                              topRight: Radius.circular(8.0),
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'piuhzysy' /* Top comments */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 16.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().update(() {
                                            FFAppState().newestFirst = true;
                                            FFAppState().showOptions = false;
                                          });
                                        },
                                        child: Container(
                                          width: 100.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondarySystemBackground,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8.0),
                                              bottomRight: Radius.circular(8.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ist0r4wj' /* Newest first */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 16.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
