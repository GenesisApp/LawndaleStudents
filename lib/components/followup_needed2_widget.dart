import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'followup_needed2_model.dart';
export 'followup_needed2_model.dart';

class FollowupNeeded2Widget extends StatefulWidget {
  const FollowupNeeded2Widget({
    super.key,
    required this.userInListRef,
    required this.userInListDoc,
  });

  final DocumentReference? userInListRef;
  final UsersRecord? userInListDoc;

  @override
  State<FollowupNeeded2Widget> createState() => _FollowupNeeded2WidgetState();
}

class _FollowupNeeded2WidgetState extends State<FollowupNeeded2Widget> {
  late FollowupNeeded2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FollowupNeeded2Model());

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
                child: InkWell(
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
                        'selectedUserRef': serializeParam(
                          widget.userInListRef,
                          ParamType.DocumentReference,
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
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
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
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.32,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await widget.userInListRef!
                                                      .update(
                                                          createUsersRecordData(
                                                    lastAttendance:
                                                        getCurrentTimestamp,
                                                  ));
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiarySystemBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Container(
                                                          width: 30.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Container(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .worshipRing,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .check_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .worshipRing,
                                                                  size: 22.0,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '72tmwmfu' /* Refresh Attendance */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 12.0,
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
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.32,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await widget.userInListRef!
                                                      .update({
                                                    ...createUsersRecordData(
                                                      inaGroup: false,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'groups':
                                                            FieldValue.delete(),
                                                      },
                                                    ),
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiarySystemBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Container(
                                                          width: 40.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFF6D6DAE),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'hd42t2xh' /* X */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .scriptureRing,
                                                                      fontSize:
                                                                          18.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'u8bxf8f3' /* Remove from Group */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 12.0,
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
                                      ],
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
