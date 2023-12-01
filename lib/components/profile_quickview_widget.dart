import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'profile_quickview_model.dart';
export 'profile_quickview_model.dart';

class ProfileQuickviewWidget extends StatefulWidget {
  const ProfileQuickviewWidget({
    Key? key,
    required this.userInListRef,
    required this.userInListDoc,
  }) : super(key: key);

  final DocumentReference? userInListRef;
  final UsersRecord? userInListDoc;

  @override
  _ProfileQuickviewWidgetState createState() => _ProfileQuickviewWidgetState();
}

class _ProfileQuickviewWidgetState extends State<ProfileQuickviewWidget>
    with TickerProviderStateMixin {
  late ProfileQuickviewModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(-50.0, 0.0),
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
    _model = createModel(context, () => ProfileQuickviewModel());

    _model.expandableController = ExpandableController(initialExpanded: false);
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 18.0, 0.0),
        child: Container(
          color: FlutterFlowTheme.of(context).primary,
          child: ExpandableNotifier(
            controller: _model.expandableController,
            child: ExpandablePanel(
              header: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    'OtherUserProfile',
                    queryParameters: {
                      'selectedUser': serializeParam(
                        widget.userInListDoc,
                        ParamType.Document,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      'selectedUser': widget.userInListDoc,
                    },
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                              valueOrDefault<String>(
                                widget.userInListDoc?.photoUrl,
                                'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                              ),
                            ),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.userInListDoc?.displayName,
                          'Guest User',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).tertiary,
                              fontSize: 14.0,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 20.0,
                        decoration: BoxDecoration(),
                      ),
                    ),
                  ],
                ),
              ),
              collapsed: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (!valueOrDefault<bool>(
                                  currentUserDocument?.completed1, false))
                                AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: 30.0,
                                    height: 82.0,
                                    child: Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
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
                                                  0.0, 60.0, 0.0, 0.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 3.0,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
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
                                      ],
                                    ),
                                  ),
                                ),
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.completed1, false))
                                AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: 30.0,
                                    height: 82.0,
                                    child: Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
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
                                                  0.0, 60.0, 0.0, 0.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            size: 3.0,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
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
                                        if (valueOrDefault<bool>(
                                            currentUserDocument?.completed1,
                                            false))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 40.0, 0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.solidCircle,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                10.0, 0.0, 0.0, 5.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.75,
                              height: 75.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 3.0,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondarySystemBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.14,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.14,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondarySystemBackground,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: CircularPercentIndicator(
                                                  percent: widget.userInListDoc!
                                                      .percentageCompleted1
                                                      .toDouble(),
                                                  radius:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.07,
                                                  lineWidth: 4.0,
                                                  animation: true,
                                                  animateFromLastPercent: true,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .worshipRing,
                                                  backgroundColor: FlutterFlowTheme
                                                          .of(context)
                                                      .tertiarySystemBackground,
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (widget.userInListDoc
                                                          ?.completed1 ??
                                                      true)
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.11,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.05,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          if (Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark)
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.00,
                                                                      0.00),
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/images/flame-fill_(3).svg',
                                                                width: 20.0,
                                                                height: 20.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          if (!(Theme.of(
                                                                      context)
                                                                  .brightness ==
                                                              Brightness.dark))
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.00,
                                                                      0.00),
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/images/flame-fill_(1).svg',
                                                                width: 20.0,
                                                                height: 20.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (!widget.userInListDoc!
                                                      .completed1)
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.11,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.05,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.00, 0.00),
                                                        child: SvgPicture.asset(
                                                          'assets/images/flame-fill_(4).svg',
                                                          width: 20.0,
                                                          height: 20.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.14,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.14,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondarySystemBackground,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child:
                                                      CircularPercentIndicator(
                                                    percent: widget
                                                        .userInListDoc!
                                                        .percentageCompleted2
                                                        .toDouble(),
                                                    radius: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.07,
                                                    lineWidth: 4.0,
                                                    animation: true,
                                                    animateFromLastPercent:
                                                        true,
                                                    progressColor:
                                                        Color(0xFF6D6DAE),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .tertiarySystemBackground,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (widget.userInListDoc
                                                            ?.completed2 ??
                                                        true)
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.11,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.05,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .transparent,
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
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.00),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/images/bookmarks-simple-fill_(1).svg',
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            if (!(Theme.of(
                                                                        context)
                                                                    .brightness ==
                                                                Brightness
                                                                    .dark))
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.00),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/images/bookmarks-simple-fill.svg',
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    if (!widget.userInListDoc!
                                                        .completed2)
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.11,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.05,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/bookmarks-simple-fill_(5).svg',
                                                            width: 20.0,
                                                            height: 20.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.14,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.14,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child:
                                                      CircularPercentIndicator(
                                                    percent: widget
                                                        .userInListDoc!
                                                        .percentageCompleted3
                                                        .toDouble(),
                                                    radius: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.07,
                                                    lineWidth: 4.0,
                                                    animation: true,
                                                    animateFromLastPercent:
                                                        true,
                                                    progressColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .prayerRing,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .tertiarySystemBackground,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (widget.userInListDoc
                                                            ?.complete3 ??
                                                        true)
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.11,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.05,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .transparent,
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
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.00),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/images/hands-clapping-fill_(6).svg',
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            if (!(Theme.of(
                                                                        context)
                                                                    .brightness ==
                                                                Brightness
                                                                    .dark))
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.00),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/images/hands-clapping-fill_(5).svg',
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    if (!widget.userInListDoc!
                                                        .complete3)
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.11,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.05,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/hands-clapping-fill_(7).svg',
                                                            width: 20.0,
                                                            height: 20.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['containerOnPageLoadAnimation']!),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              expanded: Container(),
              theme: ExpandableThemeData(
                tapHeaderToExpand: false,
                tapBodyToExpand: false,
                tapBodyToCollapse: false,
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
