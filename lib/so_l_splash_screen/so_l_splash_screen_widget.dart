import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'so_l_splash_screen_model.dart';
export 'so_l_splash_screen_model.dart';

class SoLSplashScreenWidget extends StatefulWidget {
  const SoLSplashScreenWidget({super.key});

  @override
  State<SoLSplashScreenWidget> createState() => _SoLSplashScreenWidgetState();
}

class _SoLSplashScreenWidgetState extends State<SoLSplashScreenWidget>
    with TickerProviderStateMixin {
  late SoLSplashScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(0.0, 25.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 700.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 700.ms,
          begin: Offset(0.0, 25.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(0.0, 25.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 700.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 700.ms,
          begin: Offset(0.0, 25.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1000.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.25,
          end: 1.0,
        ),
      ],
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 1000.ms,
          begin: Offset(0.0, 25.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 1200.ms,
          begin: Offset(0.0, 25.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SoLSplashScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          await actions.lockOrientation();
        }(),
      );
      if ((valueOrDefault(currentUserDocument?.dailyStreak, 0) == 0) ||
          (valueOrDefault(currentUserDocument?.dailyStreak, 0) == null)) {
        await currentUserReference!.update(createUsersRecordData(
          dateofCompletion: getCurrentTimestamp,
        ));
      }
      if (valueOrDefault<bool>(currentUserDocument?.completed1, false) ==
          true) {
        if (dateTimeFormat(
              'yMMMd',
              currentUserDocument?.completedtime1,
              locale: FFLocalizations.of(context).languageCode,
            ) !=
            dateTimeFormat(
              'yMMMd',
              getCurrentTimestamp,
              locale: FFLocalizations.of(context).languageCode,
            )) {
          await currentUserReference!.update(createUsersRecordData(
            completed1: false,
            percentageCompleted1: 0,
          ));
        }
      }
      if (valueOrDefault<bool>(currentUserDocument?.completed2, false) ==
          true) {
        if (dateTimeFormat(
              'yMMMd',
              currentUserDocument?.completedtime2,
              locale: FFLocalizations.of(context).languageCode,
            ) !=
            dateTimeFormat(
              'yMMMd',
              getCurrentTimestamp,
              locale: FFLocalizations.of(context).languageCode,
            )) {
          await currentUserReference!.update(createUsersRecordData(
            completed2: false,
            percentageCompleted2: 0,
          ));
        }
      }
      if (valueOrDefault<bool>(currentUserDocument?.complete3, false) == true) {
        if (dateTimeFormat(
              'yMMMd',
              currentUserDocument?.completedtime3,
              locale: FFLocalizations.of(context).languageCode,
            ) !=
            dateTimeFormat(
              'yMMMd',
              getCurrentTimestamp,
              locale: FFLocalizations.of(context).languageCode,
            )) {
          await currentUserReference!.update(createUsersRecordData(
            complete3: false,
            percentageCompleted3: 0,
          ));
        }
      }
      if (dateTimeFormat(
            'LLLL',
            currentUserDocument?.lastHeartCheckDate,
            locale: FFLocalizations.of(context).languageCode,
          ) ==
          dateTimeFormat(
            'LLLL',
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          )) {
        await currentUserReference!.update(createUsersRecordData(
          lastLoggedIn: getCurrentTimestamp,
        ));
      } else {
        await currentUserReference!.update(createUsersRecordData(
          lastLoggedIn: getCurrentTimestamp,
          heartCheckActive: false,
        ));
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<GroupsRecord>>(
      future: queryGroupsRecordOnce(
        queryBuilder: (groupsRecord) => groupsRecord.where(
          'members',
          arrayContains: currentUserReference,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).systemBackground,
            body: Center(
              child: SizedBox(
                width: 75.0,
                height: 75.0,
                child: SpinKitRipple(
                  color: Color(0xFF7F95AD),
                  size: 75.0,
                ),
              ),
            ),
          );
        }
        List<GroupsRecord> soLSplashScreenGroupsRecordList = snapshot.data!;
        final soLSplashScreenGroupsRecord =
            soLSplashScreenGroupsRecordList.isNotEmpty
                ? soLSplashScreenGroupsRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).systemBackground,
            body: SafeArea(
              top: true,
              child: FutureBuilder<List<ChurchLocationsRecord>>(
                future: queryChurchLocationsRecordOnce(
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
                  List<ChurchLocationsRecord>
                      containerChurchLocationsRecordList = snapshot.data!;
                  final containerChurchLocationsRecord =
                      containerChurchLocationsRecordList.isNotEmpty
                          ? containerChurchLocationsRecordList.first
                          : null;
                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      currentUserLocationValue = await getCurrentUserLocation(
                          defaultLocation: LatLng(0.0, 0.0));
                      if (soLSplashScreenGroupsRecord != null ? true : false) {
                        await currentUserReference!
                            .update(createUsersRecordData(
                          inaGroup: true,
                        ));
                      }

                      await currentUserReference!.update(createUsersRecordData(
                        distanceFromChurch:
                            functions.returnDistanceBetweenTwoPoints(
                                containerChurchLocationsRecord?.campusLocation,
                                currentUserLocationValue),
                      ));
                      _model.timer5Controller.onStartTimer();

                      context.goNamed(
                        'HomePage',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).systemBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 100.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (valueOrDefault(
                                            currentUserDocument
                                                ?.splashPageVerse,
                                            '') ==
                                        null ||
                                    valueOrDefault(
                                            currentUserDocument
                                                ?.splashPageVerse,
                                            '') ==
                                        '')
                                  AuthUserStreamWidget(
                                    builder: (context) => Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 35.0),
                                              child: Container(
                                                constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.9,
                                                  maxHeight: double.infinity,
                                                ),
                                                decoration: BoxDecoration(),
                                                child: Container(
                                                  decoration: BoxDecoration(),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '1lo8ihxf' /* "So do not fear, for I am with... */,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .label,
                                                          fontSize: 22.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'textOnPageLoadAnimation1']!),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '1ezsj7t3' /* Isaiah 41:10 */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .label,
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'textOnPageLoadAnimation2']!),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                if (valueOrDefault(
                                            currentUserDocument
                                                ?.splashPageVerse,
                                            '') !=
                                        null &&
                                    valueOrDefault(
                                            currentUserDocument
                                                ?.splashPageVerse,
                                            '') !=
                                        '')
                                  AuthUserStreamWidget(
                                    builder: (context) =>
                                        FutureBuilder<SeasonsRecord>(
                                      future: SeasonsRecord.getDocumentOnce(
                                          currentUserDocument!.currentSeason!),
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
                                        final columnSeasonsRecord =
                                            snapshot.data!;
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 35.0),
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                      maxWidth:
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.9,
                                                      maxHeight:
                                                          double.infinity,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        columnSeasonsRecord
                                                            .verse,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .label,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 22.0,
                                                        ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'textOnPageLoadAnimation3']!),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      columnSeasonsRecord
                                                          .verseReference,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 18.0,
                                                              ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'textOnPageLoadAnimation4']!),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: SvgPicture.asset(
                                Theme.of(context).brightness == Brightness.dark
                                    ? 'assets/images/hand-tap_(dark_mode).svg'
                                    : 'assets/images/hand-tap_(light_mode).svg',
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation']!),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation']!),
                          FlutterFlowTimer(
                            initialTime: _model.timer5Milliseconds,
                            getDisplayTime: (value) =>
                                StopWatchTimer.getDisplayTime(
                              value,
                              hours: false,
                              milliSecond: false,
                            ),
                            controller: _model.timer5Controller,
                            updateStateInterval: Duration(milliseconds: 4000),
                            onChanged: (value, displayTime, shouldUpdate) {
                              _model.timer5Milliseconds = value;
                              _model.timer5Value = displayTime;
                              if (shouldUpdate) setState(() {});
                            },
                            onEnded: () async {
                              context.goNamed('SignupPage');
                            },
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.transparent,
                                ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'k2j7zy2p' /* from */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .label,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ],
                                ).animateOnPageLoad(
                                    animationsMap['rowOnPageLoadAnimation1']!),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Genesis_Logo_(Transparent).png',
                                        width: 75.0,
                                        height: 30.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ],
                                ).animateOnPageLoad(
                                    animationsMap['rowOnPageLoadAnimation2']!),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
