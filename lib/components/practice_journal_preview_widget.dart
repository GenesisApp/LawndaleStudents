import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/prayer_ring_small_widget.dart';
import '/components/scripture_practice_b_s_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'practice_journal_preview_model.dart';
export 'practice_journal_preview_model.dart';

class PracticeJournalPreviewWidget extends StatefulWidget {
  const PracticeJournalPreviewWidget({
    Key? key,
    required this.dailyVideoRef,
    required this.dailyVideoDoc,
  }) : super(key: key);

  final DocumentReference? dailyVideoRef;
  final DailyPracticeVideosRecord? dailyVideoDoc;

  @override
  _PracticeJournalPreviewWidgetState createState() =>
      _PracticeJournalPreviewWidgetState();
}

class _PracticeJournalPreviewWidgetState
    extends State<PracticeJournalPreviewWidget> with TickerProviderStateMixin {
  late PracticeJournalPreviewModel _model;

  final animationsMap = {
    'iconOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1050.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1050.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1150.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1150.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1250.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1250.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1350.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1350.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1000.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1100.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1100.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1200.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation8': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1300.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1300.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
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
    _model = createModel(context, () => PracticeJournalPreviewModel());

    _model.expandableController = ExpandableController(initialExpanded: false);
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
      width: MediaQuery.sizeOf(context).width * 0.9,
      constraints: BoxConstraints(
        maxWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
        child: Container(
          color: FlutterFlowTheme.of(context).primary,
          child: ExpandableNotifier(
            controller: _model.expandableController,
            child: ExpandablePanel(
              header: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (widget.dailyVideoDoc?.worshipPractice ?? true)
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).worshipRing,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (Theme.of(context).brightness == Brightness.dark)
                              Padding(
                                padding: EdgeInsets.all(6.0),
                                child: SvgPicture.asset(
                                  'assets/images/flame-fill.svg',
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
                                  'assets/images/flame-fill_(2).svg',
                                  width: double.infinity,
                                  height: 18.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  if (widget.dailyVideoDoc?.worshipPractice ?? true)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'iukjur6g' /* Worship */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context)
                                  .lightSecondaryText,
                              fontSize: 14.0,
                            ),
                      ),
                    ),
                  if (widget.dailyVideoDoc?.scripturePractice ?? true)
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
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
                            if (Theme.of(context).brightness == Brightness.dark)
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
                  if (widget.dailyVideoDoc?.scripturePractice ?? true)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '36gzfiix' /* Scripture */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context)
                                  .lightSecondaryText,
                              fontSize: 14.0,
                            ),
                      ),
                    ),
                  if (widget.dailyVideoDoc?.prayerPractice ?? true)
                    wrapWithModel(
                      model: _model.prayerRingSmallModel,
                      updateCallback: () => setState(() {}),
                      child: PrayerRingSmallWidget(),
                    ),
                  if (widget.dailyVideoDoc?.prayerPractice ?? true)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '2dpqw4ej' /* Prayer */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context)
                                  .lightSecondaryText,
                              fontSize: 14.0,
                            ),
                      ),
                    ),
                ],
              ),
              collapsed: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 30.0,
                                height: 82.0,
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 60.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.completed2,
                                                    false)
                                                ? FlutterFlowTheme.of(context)
                                                    .tertiary
                                                : FlutterFlowTheme.of(context)
                                                    .textFieldColorSecondary,
                                            size: 3.0,
                                          ).animateOnPageLoad(animationsMap[
                                              'iconOnPageLoadAnimation1']!),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 20.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => FaIcon(
                                          FontAwesomeIcons.solidCircle,
                                          color: valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.completed2,
                                                  false)
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : FlutterFlowTheme.of(context)
                                                  .textFieldColorSecondary,
                                          size: 3.0,
                                        ).animateOnPageLoad(animationsMap[
                                            'iconOnPageLoadAnimation2']!),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => FaIcon(
                                          FontAwesomeIcons.solidCircle,
                                          color: valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.completed2,
                                                  false)
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : FlutterFlowTheme.of(context)
                                                  .textFieldColorSecondary,
                                          size: 3.0,
                                        ).animateOnPageLoad(animationsMap[
                                            'iconOnPageLoadAnimation3']!),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 60.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => FaIcon(
                                          FontAwesomeIcons.solidCircle,
                                          color: valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.completed2,
                                                  false)
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : FlutterFlowTheme.of(context)
                                                  .textFieldColorSecondary,
                                          size: 3.0,
                                        ).animateOnPageLoad(animationsMap[
                                            'iconOnPageLoadAnimation4']!),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 80.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.completed2,
                                                    false)
                                                ? FlutterFlowTheme.of(context)
                                                    .tertiary
                                                : FlutterFlowTheme.of(context)
                                                    .textFieldColorSecondary,
                                            size: 3.0,
                                          ).animateOnPageLoad(animationsMap[
                                              'iconOnPageLoadAnimation5']!),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 40.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => FaIcon(
                                          FontAwesomeIcons.solidCircle,
                                          color: valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.completed2,
                                                  false)
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : FlutterFlowTheme.of(context)
                                                  .textFieldColorSecondary,
                                          size: 3.0,
                                        ).animateOnPageLoad(animationsMap[
                                            'iconOnPageLoadAnimation6']!),
                                      ),
                                    ),
                                    AuthUserStreamWidget(
                                      builder: (context) => FaIcon(
                                        FontAwesomeIcons.solidCircle,
                                        color: valueOrDefault<bool>(
                                                currentUserDocument?.completed2,
                                                false)
                                            ? FlutterFlowTheme.of(context)
                                                .tertiary
                                            : FlutterFlowTheme.of(context)
                                                .textFieldColorSecondary,
                                        size: 3.0,
                                      ).animateOnPageLoad(animationsMap[
                                          'iconOnPageLoadAnimation7']!),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 40.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => FaIcon(
                                          FontAwesomeIcons.solidCircle,
                                          color: valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.completed2,
                                                  false)
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : FlutterFlowTheme.of(context)
                                                  .textFieldColorSecondary,
                                          size: 3.0,
                                        ).animateOnPageLoad(animationsMap[
                                            'iconOnPageLoadAnimation8']!),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 8.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.78,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondarySystemBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.006,
                                      decoration: BoxDecoration(),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.49,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 25.0,
                                                  decoration: BoxDecoration(),
                                                  child: AutoSizeText(
                                                    valueOrDefault<String>(
                                                      widget.dailyVideoDoc
                                                          ?.practiceName,
                                                      'Practice Video Name',
                                                    ),
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .label,
                                                        ),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 18.0,
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      FaIcon(
                                                        FontAwesomeIcons
                                                            .headphonesAlt,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        size: 14.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            widget.dailyVideoDoc
                                                                ?.practiceDescription,
                                                            'Practice Description',
                                                          ).maybeHandleOverflow(
                                                            maxChars: 25,
                                                            replacement: '…',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lightSecondaryText,
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 18.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      FaIcon(
                                                        FontAwesomeIcons.clock,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        size: 14.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            widget.dailyVideoDoc
                                                                ?.practiceLength,
                                                            '5 Minutes',
                                                          ).maybeHandleOverflow(
                                                            maxChars: 25,
                                                            replacement: '…',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lightSecondaryText,
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 4.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.2,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.06,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Container(
                                                width: 100.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiarySystemBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    Icons.play_arrow_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.006,
                                      decoration: BoxDecoration(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              expanded: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (!valueOrDefault<bool>(
                                  currentUserDocument?.completed2, false))
                                AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: 30.0,
                                    height: 142.0,
                                    child: Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 60.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.solidCircle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 3.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 20.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 3.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 3.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 120.0, 0.0, 0.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 3.0,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 140.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.solidCircle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 3.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 40.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 3.0,
                                          ),
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.solidCircle,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 3.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 40.0, 0.0, 0.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 3.0,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 80.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.solidCircle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 3.0,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 100.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.solidCircle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 3.0,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 120.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.solidCircle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 3.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 60.0, 0.0, 0.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 3.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 80.0, 0.0, 0.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 3.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 100.0, 0.0, 0.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 3.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.completed2, false))
                                AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: 30.0,
                                    height: 142.0,
                                    child: Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 60.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.solidCircle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 3.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 20.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            size: 3.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            size: 3.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 120.0, 0.0, 0.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            size: 3.0,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 140.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.solidCircle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 3.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 40.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            size: 3.0,
                                          ),
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.solidCircle,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          size: 3.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 40.0, 0.0, 0.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            size: 3.0,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 80.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.solidCircle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 3.0,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 100.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.solidCircle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 3.0,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 120.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.solidCircle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 3.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 60.0, 0.0, 0.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            size: 3.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 80.0, 0.0, 0.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            size: 3.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 100.0, 0.0, 0.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            size: 3.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 8.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.78,
                              height: MediaQuery.sizeOf(context).height * 0.16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondarySystemBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.006,
                                      decoration: BoxDecoration(),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.49,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 25.0,
                                                  decoration: BoxDecoration(),
                                                  child: AutoSizeText(
                                                    valueOrDefault<String>(
                                                      widget.dailyVideoDoc
                                                          ?.practiceName,
                                                      'Practice Name',
                                                    ),
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .label,
                                                        ),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 18.0,
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      FaIcon(
                                                        FontAwesomeIcons
                                                            .headphonesAlt,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        size: 14.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            widget.dailyVideoDoc
                                                                ?.practiceDescription,
                                                            'Practice Description',
                                                          ).maybeHandleOverflow(
                                                            maxChars: 25,
                                                            replacement: '…',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lightSecondaryText,
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 18.0,
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      FaIcon(
                                                        FontAwesomeIcons.clock,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        size: 14.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            widget.dailyVideoDoc
                                                                ?.practiceLength,
                                                            '5 Minutes',
                                                          ).maybeHandleOverflow(
                                                            maxChars: 25,
                                                            replacement: '…',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lightSecondaryText,
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 4.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.2,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.06,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Container(
                                                width: 100.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiarySystemBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    if (widget.dailyVideoDoc
                                                            ?.scripturePractice ??
                                                        true)
                                                      Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .scriptureRing,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            if (Theme.of(
                                                                        context)
                                                                    .brightness ==
                                                                Brightness.dark)
                                                              SvgPicture.asset(
                                                                'assets/images/bookmarks-simple-fill_(4).svg',
                                                                width: 22.0,
                                                                height: 22.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            if (!(Theme.of(
                                                                        context)
                                                                    .brightness ==
                                                                Brightness
                                                                    .dark))
                                                              SvgPicture.asset(
                                                                'assets/images/bookmarks-simple-fill_(2).svg',
                                                                width: 22.0,
                                                                height: 22.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    if (widget.dailyVideoDoc
                                                            ?.worshipPractice ??
                                                        true)
                                                      Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .worshipRing,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            if (Theme.of(
                                                                        context)
                                                                    .brightness ==
                                                                Brightness.dark)
                                                              SvgPicture.asset(
                                                                'assets/images/flame-fill.svg',
                                                                width: 22.0,
                                                                height: 22.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            if (!(Theme.of(
                                                                        context)
                                                                    .brightness ==
                                                                Brightness
                                                                    .dark))
                                                              SvgPicture.asset(
                                                                'assets/images/flame-fill_(2).svg',
                                                                width: 22.0,
                                                                height: 22.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    if (widget.dailyVideoDoc
                                                            ?.prayerPractice ??
                                                        true)
                                                      Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .prayerRing,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            if (Theme.of(
                                                                        context)
                                                                    .brightness ==
                                                                Brightness.dark)
                                                              SvgPicture.asset(
                                                                'assets/images/hands-clapping-fill_(2).svg',
                                                                width: 22.0,
                                                                height: 22.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            if (!(Theme.of(
                                                                        context)
                                                                    .brightness ==
                                                                Brightness
                                                                    .dark))
                                                              SvgPicture.asset(
                                                                'assets/images/hands-clapping-fill_(4).svg',
                                                                width: 22.0,
                                                                height: 22.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 40.0,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: 120.0,
                                              height: 38.0,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(
                                                        context)
                                                    .tertiarySystemBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                          child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: Container(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  1.0,
                                                          child:
                                                              ScripturePracticeBSWidget(
                                                            dailyPractice: widget
                                                                .dailyVideoDoc,
                                                          ),
                                                        ),
                                                      ));
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Icon(
                                                      Icons.play_arrow_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 28.0,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'aw8cn4uc' /* START */,
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
                                                                  fontSize:
                                                                      14.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 120.0,
                                              height: 38.0,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(
                                                        context)
                                                    .tertiarySystemBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Builder(
                                                builder: (context) => InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await Share.share(
                                                      'Checkout this journal: ${'lawndalestudents2://lawndalestudents2.com${GoRouter.of(context).location}'}',
                                                      sharePositionOrigin:
                                                          getWidgetBoundingBox(
                                                              context),
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      FaIcon(
                                                        FontAwesomeIcons.share,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        size: 16.0,
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'qmhcu20d' /* SHARE */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                fontSize: 14.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              theme: ExpandableThemeData(
                tapHeaderToExpand: true,
                tapBodyToExpand: true,
                tapBodyToCollapse: true,
                headerAlignment: ExpandablePanelHeaderAlignment.top,
                hasIcon: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
