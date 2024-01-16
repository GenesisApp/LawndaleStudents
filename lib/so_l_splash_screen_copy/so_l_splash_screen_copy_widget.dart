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
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'so_l_splash_screen_copy_model.dart';
export 'so_l_splash_screen_copy_model.dart';

class SoLSplashScreenCopyWidget extends StatefulWidget {
  const SoLSplashScreenCopyWidget({Key? key}) : super(key: key);

  @override
  _SoLSplashScreenCopyWidgetState createState() =>
      _SoLSplashScreenCopyWidgetState();
}

class _SoLSplashScreenCopyWidgetState extends State<SoLSplashScreenCopyWidget>
    with TickerProviderStateMixin {
  late SoLSplashScreenCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1800.ms),
        FadeEffect(
          curve: Curves.easeIn,
          delay: 1800.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 1800.ms,
          duration: 800.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 2200.ms),
        FadeEffect(
          curve: Curves.easeIn,
          delay: 2200.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 2200.ms,
          duration: 800.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1800.ms),
        FadeEffect(
          curve: Curves.easeIn,
          delay: 1800.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 1800.ms,
          duration: 800.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 2200.ms),
        FadeEffect(
          curve: Curves.easeIn,
          delay: 2200.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 2200.ms,
          duration: 800.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 750.ms,
          begin: 0.0,
          end: 1.0,
        ),
        FadeEffect(
          curve: Curves.easeOut,
          delay: 750.ms,
          duration: 1500.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 750.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 750.ms,
          duration: 750.ms,
          begin: 0.0,
          end: 1.0,
        ),
        FadeEffect(
          curve: Curves.easeOut,
          delay: 1000.ms,
          duration: 1500.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SoLSplashScreenCopyModel());

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
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

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
        List<GroupsRecord> soLSplashScreenCopyGroupsRecordList = snapshot.data!;
        final soLSplashScreenCopyGroupsRecord =
            soLSplashScreenCopyGroupsRecordList.isNotEmpty
                ? soLSplashScreenCopyGroupsRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).systemBackground,
            body: FutureBuilder<List<ChurchLocationsRecord>>(
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
                List<ChurchLocationsRecord> containerChurchLocationsRecordList =
                    snapshot.data!;
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
                    if (soLSplashScreenCopyGroupsRecord != null
                        ? true
                        : false) {
                      await currentUserReference!.update(createUsersRecordData(
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
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                'https://youtu.be/6LizOqifu78',
                              ).image,
                            ),
                          ),
                          child: Lottie.asset(
                            'assets/lottie_animations/ULoE0u6Blr.json',
                            width: 150.0,
                            height: 130.0,
                            fit: BoxFit.cover,
                            animate: true,
                          ),
                        ),
                        if (valueOrDefault(
                                    currentUserDocument?.splashPageVerse, '') !=
                                null &&
                            valueOrDefault(
                                    currentUserDocument?.splashPageVerse, '') !=
                                '')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 100.0),
                            child: AuthUserStreamWidget(
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
                                  final columnSeasonsRecord = snapshot.data!;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
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
                                                  columnSeasonsRecord.verse,
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts.getFont(
                                                    'Montserrat',
                                                    color: Color(0xFF46546C),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 22.0,
                                                  ),
                                                ),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation1']!),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  columnSeasonsRecord
                                                      .verseReference,
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts.getFont(
                                                    'Montserrat',
                                                    color: Color(0xFF46546C),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 18.0,
                                                  ),
                                                ),
                                              ],
                                            ).animateOnPageLoad(animationsMap[
                                                'rowOnPageLoadAnimation1']!),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        if (valueOrDefault(
                                    currentUserDocument?.splashPageVerse, '') ==
                                null ||
                            valueOrDefault(
                                    currentUserDocument?.splashPageVerse, '') ==
                                '')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 100.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 35.0),
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.sizeOf(context)
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
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xFF46546C),
                                                    fontSize: 22.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation2']!),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Row(
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
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xFF46546C),
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ],
                                        ).animateOnPageLoad(animationsMap[
                                            'rowOnPageLoadAnimation2']!),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '4hudf74v' /* Hello, */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF46546C),
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation1']!),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      currentUserDisplayName,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF46546C),
                                          ),
                                    ).animateOnPageLoad(animationsMap[
                                        'textOnPageLoadAnimation2']!),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: FlutterFlowTimer(
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
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
