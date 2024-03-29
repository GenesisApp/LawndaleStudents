import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/delete_chat_poll_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'current_poll_viewing_model.dart';
export 'current_poll_viewing_model.dart';

class CurrentPollViewingWidget extends StatefulWidget {
  const CurrentPollViewingWidget({
    super.key,
    this.currentPoll,
    this.pollReference,
    required this.chatChosen,
  });

  final ChatPollRecord? currentPoll;
  final DocumentReference? pollReference;
  final DocumentReference? chatChosen;

  @override
  State<CurrentPollViewingWidget> createState() =>
      _CurrentPollViewingWidgetState();
}

class _CurrentPollViewingWidgetState extends State<CurrentPollViewingWidget> {
  late CurrentPollViewingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CurrentPollViewingModel());
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
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.92,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 35.0, 12.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    constraints: BoxConstraints(
                      maxHeight: double.infinity,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context)
                            .secondarySystemBackground,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: FaIcon(
                              FontAwesomeIcons.poll,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 35.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Text(
                      widget.currentPoll!.pollName,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Text(
                      widget.currentPoll!.pollDescription,
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color:
                                FlutterFlowTheme.of(context).lightSecondaryText,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                    child: Text(
                      'Created by: ${valueOrDefault<String>(
                        widget.currentPoll?.creatorName,
                        'Guest User',
                      )}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color:
                                FlutterFlowTheme.of(context).lightSecondaryText,
                            fontSize: 12.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.92,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondarySystemBackground,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      widget.currentPoll!.optionA
                                          .maybeHandleOverflow(
                                        maxChars: 35,
                                        replacement: '…',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontSize: 16.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 12.0, 20.0, 12.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      if (valueOrDefault<bool>(
                                        widget.currentPoll?.answersPublic,
                                        true,
                                      ))
                                        StreamBuilder<List<UsersRecord>>(
                                          stream: queryUsersRecord(
                                            queryBuilder: (usersRecord) =>
                                                usersRecord.where(
                                              'pollAnswersChosen',
                                              arrayContains:
                                                  widget.pollReference,
                                            ),
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
                                            List<UsersRecord>
                                                rowUsersRecordList =
                                                snapshot.data!;
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  rowUsersRecordList.length,
                                                  (rowIndex) {
                                                final rowUsersRecord =
                                                    rowUsersRecordList[
                                                        rowIndex];
                                                return Visibility(
                                                  visible: valueOrDefault<bool>(
                                                    widget.currentPoll
                                                        ?.optionAusers
                                                        ?.contains(
                                                            rowUsersRecord
                                                                .reference),
                                                    false,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -0.98, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  2.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:
                                                                CachedNetworkImageProvider(
                                                              valueOrDefault<
                                                                  String>(
                                                                rowUsersRecord
                                                                    .photoUrl,
                                                                'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                                                              ),
                                                            ),
                                                          ),
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.8, 0.0),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      if (!valueOrDefault<bool>(
                                        widget.currentPoll?.answersPublic,
                                        false,
                                      ))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            widget.currentPoll!.optionAusers
                                                .length
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lightSecondaryText,
                                                  fontSize: 12.0,
                                                ),
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            () {
                                              if (widget.currentPoll
                                                      ?.optionAusers?.length ==
                                                  0) {
                                                return 'None have chosen!';
                                              } else if (widget.currentPoll
                                                      ?.optionAusers?.length ==
                                                  1) {
                                                return 'has chosen!';
                                              } else if (widget.currentPoll!
                                                      .optionAusers.length >
                                                  1) {
                                                return 'have chosen!';
                                              } else {
                                                return null;
                                              }
                                            }(),
                                            'None have chosen!',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lightSecondaryText,
                                                fontSize: 12.0,
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
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.92,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondarySystemBackground,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      widget.currentPoll!.optionB
                                          .maybeHandleOverflow(
                                        maxChars: 35,
                                        replacement: '…',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontSize: 16.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 12.0, 20.0, 12.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      if (widget.currentPoll?.answersPublic ??
                                          true)
                                        StreamBuilder<List<UsersRecord>>(
                                          stream: queryUsersRecord(
                                            queryBuilder: (usersRecord) =>
                                                usersRecord.where(
                                              'pollAnswersChosen',
                                              arrayContains:
                                                  widget.pollReference,
                                            ),
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
                                            List<UsersRecord>
                                                rowUsersRecordList =
                                                snapshot.data!;
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  rowUsersRecordList.length,
                                                  (rowIndex) {
                                                final rowUsersRecord =
                                                    rowUsersRecordList[
                                                        rowIndex];
                                                return Visibility(
                                                  visible: widget.currentPoll
                                                          ?.optionBusers
                                                          ?.contains(
                                                              rowUsersRecord
                                                                  .reference) ??
                                                      true,
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -0.98, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  2.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:
                                                                CachedNetworkImageProvider(
                                                              valueOrDefault<
                                                                  String>(
                                                                rowUsersRecord
                                                                    .photoUrl,
                                                                'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                                                              ),
                                                            ),
                                                          ),
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.8, 0.0),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      if (!valueOrDefault<bool>(
                                        widget.currentPoll?.answersPublic,
                                        true,
                                      ))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            widget.currentPoll!.optionBusers
                                                .length
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lightSecondaryText,
                                                  fontSize: 12.0,
                                                ),
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            () {
                                              if (widget.currentPoll
                                                      ?.optionBusers?.length ==
                                                  0) {
                                                return 'None have chosen!';
                                              } else if (widget.currentPoll
                                                      ?.optionBusers?.length ==
                                                  1) {
                                                return 'has chosen!';
                                              } else if (widget.currentPoll!
                                                      .optionBusers.length >
                                                  1) {
                                                return 'have chosen!';
                                              } else {
                                                return null;
                                              }
                                            }(),
                                            'have chosen!',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lightSecondaryText,
                                                fontSize: 12.0,
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
                    if (widget.currentPoll?.optionC != null &&
                        widget.currentPoll?.optionC != '')
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.92,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondarySystemBackground,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (widget.currentPoll?.optionC != null &&
                                    widget.currentPoll?.optionC != '')
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          widget.currentPoll!.optionC
                                              .maybeHandleOverflow(
                                            maxChars: 35,
                                            replacement: '…',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                fontSize: 16.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                if (widget.currentPoll?.optionC != null &&
                                    widget.currentPoll?.optionC != '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        25.0, 12.0, 20.0, 12.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          if (widget
                                                  .currentPoll?.answersPublic ??
                                              true)
                                            StreamBuilder<List<UsersRecord>>(
                                              stream: queryUsersRecord(
                                                queryBuilder: (usersRecord) =>
                                                    usersRecord.where(
                                                  'pollAnswersChosen',
                                                  arrayContains:
                                                      widget.pollReference,
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 75.0,
                                                      height: 75.0,
                                                      child: SpinKitRipple(
                                                        color:
                                                            Color(0xFF7F95AD),
                                                        size: 75.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UsersRecord>
                                                    rowUsersRecordList =
                                                    snapshot.data!;
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      rowUsersRecordList.length,
                                                      (rowIndex) {
                                                    final rowUsersRecord =
                                                        rowUsersRecordList[
                                                            rowIndex];
                                                    return Visibility(
                                                      visible: widget
                                                              .currentPoll
                                                              ?.optionCusers
                                                              ?.contains(
                                                                  rowUsersRecord
                                                                      .reference) ??
                                                          true,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.98, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      2.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    rowUsersRecord
                                                                        .photoUrl,
                                                                    'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                                                                  ),
                                                                ),
                                                              ),
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.8, 0.0),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          if (!valueOrDefault<bool>(
                                            widget.currentPoll?.answersPublic,
                                            true,
                                          ))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                widget.currentPoll!.optionCusers
                                                    .length
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lightSecondaryText,
                                                          fontSize: 12.0,
                                                        ),
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                () {
                                                  if (widget
                                                          .currentPoll
                                                          ?.optionCusers
                                                          ?.length ==
                                                      0) {
                                                    return 'None have chosen!';
                                                  } else if (widget
                                                          .currentPoll
                                                          ?.optionCusers
                                                          ?.length ==
                                                      1) {
                                                    return 'has chosen!';
                                                  } else if (widget.currentPoll!
                                                          .optionCusers.length >
                                                      1) {
                                                    return 'have chosen!';
                                                  } else {
                                                    return null;
                                                  }
                                                }(),
                                                'have chosen!',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .lightSecondaryText,
                                                        fontSize: 12.0,
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
                    if (widget.currentPoll?.optionD != null &&
                        widget.currentPoll?.optionD != '')
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.92,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondarySystemBackground,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (widget.currentPoll?.optionD != null &&
                                    widget.currentPoll?.optionD != '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 8.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          widget.currentPoll!.optionD
                                              .maybeHandleOverflow(
                                            maxChars: 35,
                                            replacement: '…',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                fontSize: 16.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (widget.currentPoll?.optionD != null &&
                                    widget.currentPoll?.optionD != '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        25.0, 12.0, 20.0, 12.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          if (widget
                                                  .currentPoll?.answersPublic ??
                                              true)
                                            StreamBuilder<List<UsersRecord>>(
                                              stream: queryUsersRecord(
                                                queryBuilder: (usersRecord) =>
                                                    usersRecord.where(
                                                  'pollAnswersChosen',
                                                  arrayContains:
                                                      widget.pollReference,
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 75.0,
                                                      height: 75.0,
                                                      child: SpinKitRipple(
                                                        color:
                                                            Color(0xFF7F95AD),
                                                        size: 75.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UsersRecord>
                                                    rowUsersRecordList =
                                                    snapshot.data!;
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      rowUsersRecordList.length,
                                                      (rowIndex) {
                                                    final rowUsersRecord =
                                                        rowUsersRecordList[
                                                            rowIndex];
                                                    return Visibility(
                                                      visible: widget
                                                              .currentPoll
                                                              ?.optionDusers
                                                              ?.contains(
                                                                  rowUsersRecord
                                                                      .reference) ??
                                                          true,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.98, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      2.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    rowUsersRecord
                                                                        .photoUrl,
                                                                    'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                                                                  ),
                                                                ),
                                                              ),
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.8, 0.0),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          if (!widget
                                              .currentPoll!.answersPublic)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                widget.currentPoll!.optionDusers
                                                    .length
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lightSecondaryText,
                                                          fontSize: 12.0,
                                                        ),
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                () {
                                                  if (widget
                                                          .currentPoll
                                                          ?.optionDusers
                                                          ?.length ==
                                                      0) {
                                                    return 'None have chosen!';
                                                  } else if (widget
                                                          .currentPoll
                                                          ?.optionDusers
                                                          ?.length ==
                                                      1) {
                                                    return 'has chosen!';
                                                  } else if (widget.currentPoll!
                                                          .optionDusers.length >
                                                      1) {
                                                    return 'have chosen!';
                                                  } else {
                                                    return null;
                                                  }
                                                }(),
                                                'have chosen!',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .lightSecondaryText,
                                                        fontSize: 12.0,
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
                    if (widget.currentPoll?.optionE != null &&
                        widget.currentPoll?.optionE != '')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.92,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondarySystemBackground,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (widget.currentPoll?.optionE != null &&
                                    widget.currentPoll?.optionE != '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 8.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          widget.currentPoll!.optionE
                                              .maybeHandleOverflow(
                                            maxChars: 35,
                                            replacement: '…',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                fontSize: 16.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (widget.currentPoll?.optionE != null &&
                                    widget.currentPoll?.optionE != '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        25.0, 12.0, 20.0, 12.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          if (widget
                                                  .currentPoll?.answersPublic ??
                                              true)
                                            StreamBuilder<List<UsersRecord>>(
                                              stream: queryUsersRecord(
                                                queryBuilder: (usersRecord) =>
                                                    usersRecord.where(
                                                  'pollAnswersChosen',
                                                  arrayContains:
                                                      widget.pollReference,
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 75.0,
                                                      height: 75.0,
                                                      child: SpinKitRipple(
                                                        color:
                                                            Color(0xFF7F95AD),
                                                        size: 75.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UsersRecord>
                                                    rowUsersRecordList =
                                                    snapshot.data!;
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      rowUsersRecordList.length,
                                                      (rowIndex) {
                                                    final rowUsersRecord =
                                                        rowUsersRecordList[
                                                            rowIndex];
                                                    return Visibility(
                                                      visible: widget
                                                              .currentPoll
                                                              ?.optionEusers
                                                              ?.contains(
                                                                  rowUsersRecord
                                                                      .reference) ??
                                                          true,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.98, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      2.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    rowUsersRecord
                                                                        .photoUrl,
                                                                    'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                                                                  ),
                                                                ),
                                                              ),
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.8, 0.0),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          if (!widget
                                              .currentPoll!.answersPublic)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                widget.currentPoll!.optionEusers
                                                    .length
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lightSecondaryText,
                                                          fontSize: 12.0,
                                                        ),
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                () {
                                                  if (widget
                                                          .currentPoll
                                                          ?.optionEusers
                                                          ?.length ==
                                                      0) {
                                                    return 'None have chosen!';
                                                  } else if (widget
                                                          .currentPoll
                                                          ?.optionEusers
                                                          ?.length ==
                                                      1) {
                                                    return 'has chosen!';
                                                  } else if (widget.currentPoll!
                                                          .optionEusers.length >
                                                      1) {
                                                    return 'have chosen!';
                                                  } else {
                                                    return null;
                                                  }
                                                }(),
                                                'have chosen!',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .lightSecondaryText,
                                                        fontSize: 12.0,
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
            ),
            if (widget.currentPoll?.creator == currentUserReference)
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await widget.currentPoll!.reference.update({
                          ...mapToFirestore(
                            {
                              'optionAusers': FieldValue.delete(),
                              'optionBusers': FieldValue.delete(),
                              'optionCusers': FieldValue.delete(),
                              'optionDusers': FieldValue.delete(),
                              'optionEusers': FieldValue.delete(),
                              'usersVoted': FieldValue.delete(),
                            },
                          ),
                        });

                        var messagesRecordReference =
                            MessagesRecord.collection.doc();
                        await messagesRecordReference
                            .set(createMessagesRecordData(
                          messageText: '${valueOrDefault<String>(
                            currentUserDisplayName,
                            'Guest User',
                          )} just created a poll!',
                          timeSent: getCurrentTimestamp,
                          userName: 'System Message',
                          chatReference: widget.chatChosen,
                          user: currentUserReference,
                        ));
                        _model.systemMessageCopy =
                            MessagesRecord.getDocumentFromData(
                                createMessagesRecordData(
                                  messageText: '${valueOrDefault<String>(
                                    currentUserDisplayName,
                                    'Guest User',
                                  )} just created a poll!',
                                  timeSent: getCurrentTimestamp,
                                  userName: 'System Message',
                                  chatReference: widget.chatChosen,
                                  user: currentUserReference,
                                ),
                                messagesRecordReference);

                        await widget.chatChosen!
                            .update(createMessageChatsRecordData(
                          lastMessageTime: getCurrentTimestamp,
                          lastMessage: _model.systemMessageCopy?.messageText,
                          lastMessageSentByName: 'System Message',
                        ));
                        Navigator.pop(context);

                        setState(() {});
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'k772vh9o' /* Reset Poll Answers */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.refresh_rounded,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 26.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    barrierColor: FlutterFlowTheme.of(context).opagueSeparator,
                    context: context,
                    builder: (context) {
                      return WebViewAware(
                        child: Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: DeleteChatPollWidget(
                            currentPoll: widget.currentPoll,
                            pollReference: widget.pollReference,
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor:
                              FlutterFlowTheme.of(context).opagueSeparator,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: DeleteChatPollWidget(
                                  currentPoll: widget.currentPoll,
                                  pollReference: widget.pollReference,
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'pa276cs2' /* End Poll? */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).secondary,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Icon(
                        Icons.cancel_rounded,
                        color: FlutterFlowTheme.of(context).secondary,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 75.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        HapticFeedback.lightImpact();
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context)
                              .secondarySystemBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '48312wxt' /* Done */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
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
    );
  }
}
