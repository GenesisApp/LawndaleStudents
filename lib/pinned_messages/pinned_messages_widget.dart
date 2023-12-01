import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/edit_message_widget.dart';
import '/components/p_d_f_viewer_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'pinned_messages_model.dart';
export 'pinned_messages_model.dart';

class PinnedMessagesWidget extends StatefulWidget {
  const PinnedMessagesWidget({
    Key? key,
    this.chatChosen,
    this.chatUsers,
    this.otherUserDoc,
    this.otherUserRef,
  }) : super(key: key);

  final MessageChatsRecord? chatChosen;
  final DocumentReference? chatUsers;
  final UsersRecord? otherUserDoc;
  final DocumentReference? otherUserRef;

  @override
  _PinnedMessagesWidgetState createState() => _PinnedMessagesWidgetState();
}

class _PinnedMessagesWidgetState extends State<PinnedMessagesWidget>
    with TickerProviderStateMixin {
  late PinnedMessagesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 250.ms,
          begin: Offset(-10.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 250.ms,
          begin: Offset(-20.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 250.ms,
          begin: Offset(-40.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 250.ms,
          begin: Offset(40.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 250.ms,
          begin: Offset(20.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 250.ms,
          begin: Offset(10.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PinnedMessagesModel());
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).systemBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 12.0),
                        child: Container(
                          width: double.infinity,
                          child: Stack(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '9syw2ig5' /* Pinned Messages */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 10.0, 0.0),
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
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 22.0,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.00, 0.00),
                                child: Container(
                                  width: 45.0,
                                  height: 45.0,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 0.2,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondary,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: StreamBuilder<List<MessagesRecord>>(
                      stream: queryMessagesRecord(
                        queryBuilder: (messagesRecord) => messagesRecord
                            .where(
                              'chatReference',
                              isEqualTo: widget.chatChosen?.reference,
                            )
                            .where(
                              'pin',
                              isEqualTo: true,
                            )
                            .orderBy('timeSent', descending: true),
                        limit: 100,
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
                        List<MessagesRecord> listViewMessagesRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewMessagesRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewMessagesRecord =
                                listViewMessagesRecordList[listViewIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (listViewMessagesRecord.user !=
                                    currentUserReference)
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 15.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: FutureBuilder<UsersRecord>(
                                                future:
                                                    UsersRecord.getDocumentOnce(
                                                        listViewMessagesRecord
                                                            .user!),
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
                                                  final circleImageUsersRecord =
                                                      snapshot.data!;
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'OtherUserProfile',
                                                        queryParameters: {
                                                          'selectedUser':
                                                              serializeParam(
                                                            circleImageUsersRecord,
                                                            ParamType.Document,
                                                          ),
                                                          'selectedUserRef':
                                                              serializeParam(
                                                            circleImageUsersRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'selectedUser':
                                                              circleImageUsersRecord,
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 35.0,
                                                      height: 35.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: CachedNetworkImage(
                                                        fadeInDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        fadeOutDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        imageUrl:
                                                            valueOrDefault<
                                                                String>(
                                                          circleImageUsersRecord
                                                              .photoUrl,
                                                          'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (widget.chatChosen!.users
                                                        .length >
                                                    2)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 6.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        listViewMessagesRecord
                                                            .userName,
                                                        'Guest User',
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
                                                                    .lightSecondaryText,
                                                                fontSize: 11.0,
                                                              ),
                                                    ),
                                                  ),
                                                if (listViewMessagesRecord
                                                            .textImagePath !=
                                                        null &&
                                                    listViewMessagesRecord
                                                            .textImagePath !=
                                                        '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 8.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  CachedNetworkImage(
                                                                fadeInDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            500),
                                                                fadeOutDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            500),
                                                                imageUrl:
                                                                    listViewMessagesRecord
                                                                        .textImagePath,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: listViewMessagesRecord
                                                                  .textImagePath,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag:
                                                            listViewMessagesRecord
                                                                .textImagePath,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                listViewMessagesRecord
                                                                    .textImagePath,
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.5,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.2,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (listViewMessagesRecord
                                                            .pdfImage !=
                                                        null &&
                                                    listViewMessagesRecord
                                                            .pdfImage !=
                                                        '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 8.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Color(0xFFB8B8B8),
                                                          barrierColor:
                                                              Color(0x00000000),
                                                          context: context,
                                                          builder: (context) {
                                                            return WebViewAware(
                                                                child:
                                                                    GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      1.0,
                                                                  child:
                                                                      PDFViewerWidget(
                                                                    pdfImageSelected:
                                                                        listViewMessagesRecord,
                                                                    pdfImageSelectedRef:
                                                                        listViewMessagesRecord
                                                                            .reference,
                                                                  ),
                                                                ),
                                                              ),
                                                            ));
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.35,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .textBoxBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'xsua9ogw' /* PDF File */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        fontSize:
                                                                            16.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'bg5ortxu' /* Click to View */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          fontSize:
                                                                              12.0,
                                                                        ),
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .open_in_new_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    size: 18.0,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (!listViewMessagesRecord
                                                        .reactionsVisible &&
                                                    (listViewMessagesRecord
                                                                .messageText !=
                                                            null &&
                                                        listViewMessagesRecord
                                                                .messageText !=
                                                            ''))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.7,
                                                                maxHeight: double
                                                                    .infinity,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          12.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          12.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          12.0),
                                                                ),
                                                              ),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  await listViewMessagesRecord
                                                                      .reference
                                                                      .update(
                                                                          createMessagesRecordData(
                                                                    reactionsVisible:
                                                                        true,
                                                                  ));
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondarySystemBackground,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              12.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              12.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              12.0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await listViewMessagesRecord
                                                                            .reference
                                                                            .update(createMessagesRecordData(
                                                                          reactionsVisible:
                                                                              true,
                                                                        ));
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        listViewMessagesRecord
                                                                            .messageText,
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).label,
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            if ((listViewMessagesRecord.messageLaughedBy.length > 0) ||
                                                                (listViewMessagesRecord
                                                                        .messageCriedBy
                                                                        .length >
                                                                    0) ||
                                                                (listViewMessagesRecord
                                                                        .messageLikedBy
                                                                        .length >
                                                                    0))
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            6.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  height: 25.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      if (listViewMessagesRecord
                                                                              .messageLikedBy
                                                                              .length >
                                                                          0)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              0.0,
                                                                              4.0,
                                                                              0.0),
                                                                          child:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.solidThumbsUp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).worshipRing,
                                                                            size:
                                                                                18.0,
                                                                          ),
                                                                        ),
                                                                      if (listViewMessagesRecord
                                                                              .messageCriedBy
                                                                              .length >
                                                                          0)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              0.0,
                                                                              4.0,
                                                                              0.0),
                                                                          child:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.solidSadCry,
                                                                            color:
                                                                                Color(0xFF6D6DAE),
                                                                            size:
                                                                                18.0,
                                                                          ),
                                                                        ),
                                                                      if (listViewMessagesRecord
                                                                              .messageLaughedBy
                                                                              .length >
                                                                          0)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              0.0,
                                                                              4.0,
                                                                              0.0),
                                                                          child:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.solidLaughSquint,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).worshipRing,
                                                                            size:
                                                                                18.0,
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (listViewMessagesRecord
                                                                    .pin)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .thumbtack,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                  ),
                                                                if (listViewMessagesRecord
                                                                    .edited)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'kj5zt4ih' /* (edited) */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            fontSize:
                                                                                10.0,
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
                                                if (listViewMessagesRecord
                                                        .reactionsVisible &&
                                                    (listViewMessagesRecord
                                                                .messageText !=
                                                            null &&
                                                        listViewMessagesRecord
                                                                .messageText !=
                                                            ''))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.7,
                                                                maxHeight: double
                                                                    .infinity,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          12.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          12.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          12.0),
                                                                ),
                                                              ),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  await listViewMessagesRecord
                                                                      .reference
                                                                      .update(
                                                                          createMessagesRecordData(
                                                                    reactionsVisible:
                                                                        false,
                                                                  ));
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondarySystemBackground,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              12.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              12.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              12.0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await listViewMessagesRecord
                                                                            .reference
                                                                            .update(createMessagesRecordData(
                                                                          reactionsVisible:
                                                                              false,
                                                                        ));
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        listViewMessagesRecord
                                                                            .messageText,
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).label,
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            if ((listViewMessagesRecord.messageLaughedBy.length > 0) ||
                                                                (listViewMessagesRecord
                                                                        .messageCriedBy
                                                                        .length >
                                                                    0) ||
                                                                (listViewMessagesRecord
                                                                        .messageLikedBy
                                                                        .length >
                                                                    0))
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.00),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        25.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        if (listViewMessagesRecord.messageLikedBy.length >
                                                                            0)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidThumbsUp,
                                                                              color: FlutterFlowTheme.of(context).worshipRing,
                                                                              size: 18.0,
                                                                            ),
                                                                          ),
                                                                        if (listViewMessagesRecord.messageCriedBy.length >
                                                                            0)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidSadCry,
                                                                              color: Color(0xFF6D6DAE),
                                                                              size: 18.0,
                                                                            ),
                                                                          ),
                                                                        if (listViewMessagesRecord.messageLaughedBy.length >
                                                                            0)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidLaughSquint,
                                                                              color: FlutterFlowTheme.of(context).worshipRing,
                                                                              size: 18.0,
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
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (listViewMessagesRecord
                                                                    .pin)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .thumbtack,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                  ),
                                                                if (listViewMessagesRecord
                                                                    .edited)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        've1s1nay' /* (edited) */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            fontSize:
                                                                                10.0,
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
                                                if (listViewMessagesRecord
                                                        .reactionsVisible ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2.0,
                                                                        2.0,
                                                                        2.0,
                                                                        2.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            2.0,
                                                                            8.0,
                                                                            2.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          0.00,
                                                                          0.00),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            6.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              if (listViewMessagesRecord.messageLikedBy.contains(currentUserReference))
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      HapticFeedback.lightImpact();
                                                                                      if (listViewMessagesRecord.messageLikedBy.contains(currentUserReference) == true) {
                                                                                        await listViewMessagesRecord.reference.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'messageLikedBy': FieldValue.arrayRemove([
                                                                                                currentUserReference
                                                                                              ]),
                                                                                            },
                                                                                          ),
                                                                                        });
                                                                                      }
                                                                                    },
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.solidThumbsUp,
                                                                                          color: FlutterFlowTheme.of(context).worshipRing,
                                                                                          size: 22.0,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            listViewMessagesRecord.messageLikedBy.length.toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (!listViewMessagesRecord.messageLikedBy.contains(currentUserReference))
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      HapticFeedback.lightImpact();
                                                                                      if (listViewMessagesRecord.messageLikedBy.contains(currentUserReference) == true) {
                                                                                        return;
                                                                                      }

                                                                                      await listViewMessagesRecord.reference.update({
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'messageLikedBy': FieldValue.arrayUnion([
                                                                                              currentUserReference
                                                                                            ]),
                                                                                          },
                                                                                        ),
                                                                                      });
                                                                                    },
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.thumbsUp,
                                                                                          color: FlutterFlowTheme.of(context).worshipRing,
                                                                                          size: 22.0,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            listViewMessagesRecord.messageLikedBy.length.toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          6.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            if (listViewMessagesRecord.messageCriedBy.contains(currentUserReference))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    HapticFeedback.lightImpact();
                                                                                    if (listViewMessagesRecord.messageCriedBy.contains(currentUserReference) == true) {
                                                                                      await listViewMessagesRecord.reference.update({
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'messageCriedBy': FieldValue.arrayRemove([
                                                                                              currentUserReference
                                                                                            ]),
                                                                                          },
                                                                                        ),
                                                                                      });
                                                                                    }
                                                                                  },
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      FaIcon(
                                                                                        FontAwesomeIcons.solidSadCry,
                                                                                        color: Color(0xFF6D6DAE),
                                                                                        size: 22.0,
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          listViewMessagesRecord.messageCriedBy.length.toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (!listViewMessagesRecord.messageCriedBy.contains(currentUserReference))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    HapticFeedback.lightImpact();
                                                                                    if (listViewMessagesRecord.messageCriedBy.contains(currentUserReference) == true) {
                                                                                      return;
                                                                                    }

                                                                                    await listViewMessagesRecord.reference.update({
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'messageCriedBy': FieldValue.arrayUnion([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                  },
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      FaIcon(
                                                                                        FontAwesomeIcons.sadCry,
                                                                                        color: Color(0xFF6D6DAE),
                                                                                        size: 22.0,
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          listViewMessagesRecord.messageCriedBy.length.toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ).animateOnPageLoad(
                                                                              animationsMap['containerOnPageLoadAnimation2']!),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (listViewMessagesRecord
                                                                              .messageLaughedBy
                                                                              .contains(currentUserReference))
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  HapticFeedback.lightImpact();
                                                                                  if (listViewMessagesRecord.messageLaughedBy.contains(currentUserReference) == true) {
                                                                                    await listViewMessagesRecord.reference.update({
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'messageLaughedBy': FieldValue.arrayRemove([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                  }
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    FaIcon(
                                                                                      FontAwesomeIcons.solidLaughSquint,
                                                                                      color: FlutterFlowTheme.of(context).worshipRing,
                                                                                      size: 22.0,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        listViewMessagesRecord.messageLaughedBy.length.toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (!listViewMessagesRecord
                                                                              .messageLaughedBy
                                                                              .contains(currentUserReference))
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  HapticFeedback.lightImpact();
                                                                                  if (listViewMessagesRecord.messageLaughedBy.contains(currentUserReference) == true) {
                                                                                    return;
                                                                                  }

                                                                                  await listViewMessagesRecord.reference.update({
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'messageLaughedBy': FieldValue.arrayUnion([
                                                                                          currentUserReference
                                                                                        ]),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    FaIcon(
                                                                                      FontAwesomeIcons.laughSquint,
                                                                                      color: FlutterFlowTheme.of(context).worshipRing,
                                                                                      size: 22.0,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        listViewMessagesRecord.messageLaughedBy.length.toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation3']!),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if (listViewMessagesRecord
                                                    .reactionsVisible)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 2.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                        'relative',
                                                        listViewMessagesRecord
                                                            .timeSent!,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
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
                                                                    .lightSecondaryText,
                                                                fontSize: 10.0,
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
                                if (listViewMessagesRecord.user ==
                                    currentUserReference)
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        constraints: BoxConstraints(
                                          maxWidth:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  if (widget.chatChosen!.users
                                                          .length >
                                                      2)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  6.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          listViewMessagesRecord
                                                              .userName,
                                                          'Guest User',
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
                                                                      .lightSecondaryText,
                                                                  fontSize:
                                                                      11.0,
                                                                ),
                                                      ),
                                                    ),
                                                  if (listViewMessagesRecord
                                                              .textImagePath !=
                                                          null &&
                                                      listViewMessagesRecord
                                                              .textImagePath !=
                                                          '')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  8.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await Navigator.push(
                                                            context,
                                                            PageTransition(
                                                              type:
                                                                  PageTransitionType
                                                                      .fade,
                                                              child:
                                                                  FlutterFlowExpandedImageView(
                                                                image:
                                                                    CachedNetworkImage(
                                                                  fadeInDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  fadeOutDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  imageUrl:
                                                                      listViewMessagesRecord
                                                                          .textImagePath,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                                allowRotation:
                                                                    false,
                                                                tag: listViewMessagesRecord
                                                                    .textImagePath,
                                                                useHeroAnimation:
                                                                    true,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Hero(
                                                          tag: listViewMessagesRecord
                                                              .textImagePath,
                                                          transitionOnUserGestures:
                                                              true,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            child:
                                                                CachedNetworkImage(
                                                              fadeInDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          500),
                                                              fadeOutDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          500),
                                                              imageUrl:
                                                                  listViewMessagesRecord
                                                                      .textImagePath,
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.5,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.2,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (listViewMessagesRecord
                                                              .pdfImage !=
                                                          null &&
                                                      listViewMessagesRecord
                                                              .pdfImage !=
                                                          '')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  8.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Color(
                                                                    0xFFB8B8B8),
                                                            barrierColor: Color(
                                                                0x00000000),
                                                            context: context,
                                                            builder: (context) {
                                                              return WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                    child:
                                                                        PDFViewerWidget(
                                                                      pdfImageSelected:
                                                                          listViewMessagesRecord,
                                                                      pdfImageSelectedRef:
                                                                          listViewMessagesRecord
                                                                              .reference,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ));
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.35,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .textBoxBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'pq5y405e' /* PDF File */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          fontSize:
                                                                              16.0,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'koktxlnw' /* Click to View */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            fontSize:
                                                                                12.0,
                                                                          ),
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .open_in_new_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (!listViewMessagesRecord
                                                          .reactionsVisible &&
                                                      (listViewMessagesRecord
                                                                  .messageText !=
                                                              null &&
                                                          listViewMessagesRecord
                                                                  .messageText !=
                                                              ''))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (listViewMessagesRecord
                                                                      .edited)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'cdzmtbzi' /* (edited) */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              fontSize: 10.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  if (listViewMessagesRecord
                                                                      .pin)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .thumbtack,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.75,
                                                                  maxHeight: double
                                                                      .infinity,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            12.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            12.0),
                                                                  ),
                                                                ),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await listViewMessagesRecord
                                                                        .reference
                                                                        .update(
                                                                            createMessagesRecordData(
                                                                      reactionsVisible:
                                                                          true,
                                                                    ));
                                                                  },
                                                                  onLongPress:
                                                                      () async {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      barrierColor:
                                                                          Color(
                                                                              0x80000000),
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return WebViewAware(
                                                                            child:
                                                                                GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                Container(
                                                                              height: 125.0,
                                                                              child: EditMessageWidget(
                                                                                usersMessage: listViewMessagesRecord.reference,
                                                                                usersMessageDoc: listViewMessagesRecord,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ));
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondarySystemBackground,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(12.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(12.0),
                                                                        topRight:
                                                                            Radius.circular(12.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await listViewMessagesRecord
                                                                              .reference
                                                                              .update(createMessagesRecordData(
                                                                            reactionsVisible:
                                                                                true,
                                                                          ));
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          listViewMessagesRecord
                                                                              .messageText,
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).label,
                                                                                fontSize: 14.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if ((listViewMessagesRecord.messageLaughedBy.length > 0) ||
                                                                  (listViewMessagesRecord
                                                                          .messageCriedBy
                                                                          .length >
                                                                      0) ||
                                                                  (listViewMessagesRecord
                                                                          .messageLikedBy
                                                                          .length >
                                                                      0))
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        25.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        if (listViewMessagesRecord.messageLikedBy.length >
                                                                            0)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidThumbsUp,
                                                                              color: FlutterFlowTheme.of(context).worshipRing,
                                                                              size: 18.0,
                                                                            ),
                                                                          ),
                                                                        if (listViewMessagesRecord.messageCriedBy.length >
                                                                            0)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidSadCry,
                                                                              color: Color(0xFF6D6DAE),
                                                                              size: 18.0,
                                                                            ),
                                                                          ),
                                                                        if (listViewMessagesRecord.messageLaughedBy.length >
                                                                            0)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidLaughSquint,
                                                                              color: FlutterFlowTheme.of(context).worshipRing,
                                                                              size: 18.0,
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
                                                  if (listViewMessagesRecord
                                                          .reactionsVisible &&
                                                      (listViewMessagesRecord
                                                                  .messageText !=
                                                              null &&
                                                          listViewMessagesRecord
                                                                  .messageText !=
                                                              ''))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (listViewMessagesRecord
                                                                      .edited)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'popwm4vp' /* (edited) */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              fontSize: 10.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  if (listViewMessagesRecord
                                                                      .pin)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .thumbtack,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.75,
                                                                  maxHeight: double
                                                                      .infinity,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            12.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            12.0),
                                                                  ),
                                                                ),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await listViewMessagesRecord
                                                                        .reference
                                                                        .update(
                                                                            createMessagesRecordData(
                                                                      reactionsVisible:
                                                                          false,
                                                                    ));
                                                                  },
                                                                  onLongPress:
                                                                      () async {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      barrierColor:
                                                                          Color(
                                                                              0x80000000),
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return WebViewAware(
                                                                            child:
                                                                                GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                Container(
                                                                              height: 125.0,
                                                                              child: EditMessageWidget(
                                                                                usersMessage: listViewMessagesRecord.reference,
                                                                                usersMessageDoc: listViewMessagesRecord,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ));
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondarySystemBackground,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(12.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(12.0),
                                                                        topRight:
                                                                            Radius.circular(12.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await listViewMessagesRecord
                                                                              .reference
                                                                              .update(createMessagesRecordData(
                                                                            reactionsVisible:
                                                                                false,
                                                                          ));
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          listViewMessagesRecord
                                                                              .messageText,
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).label,
                                                                                fontSize: 14.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if ((listViewMessagesRecord.messageLaughedBy.length > 0) ||
                                                                  (listViewMessagesRecord
                                                                          .messageCriedBy
                                                                          .length >
                                                                      0) ||
                                                                  (listViewMessagesRecord
                                                                          .messageLikedBy
                                                                          .length >
                                                                      0))
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        25.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        if (listViewMessagesRecord.messageLikedBy.length >
                                                                            0)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidThumbsUp,
                                                                              color: FlutterFlowTheme.of(context).worshipRing,
                                                                              size: 18.0,
                                                                            ),
                                                                          ),
                                                                        if (listViewMessagesRecord.messageCriedBy.length >
                                                                            0)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidSadCry,
                                                                              color: Color(0xFF6D6DAE),
                                                                              size: 18.0,
                                                                            ),
                                                                          ),
                                                                        if (listViewMessagesRecord.messageLaughedBy.length >
                                                                            0)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidLaughSquint,
                                                                              color: FlutterFlowTheme.of(context).worshipRing,
                                                                              size: 18.0,
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
                                                  if (listViewMessagesRecord
                                                          .reactionsVisible ==
                                                      true)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2.0,
                                                                        2.0,
                                                                        2.0,
                                                                        2.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            2.0,
                                                                            8.0,
                                                                            2.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          6.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            20.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            if (listViewMessagesRecord.messageLikedBy.contains(currentUserReference))
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  HapticFeedback.lightImpact();
                                                                                  if (listViewMessagesRecord.messageLikedBy.contains(currentUserReference) == true) {
                                                                                    await listViewMessagesRecord.reference.update({
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'messageLikedBy': FieldValue.arrayRemove([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                  }
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                  children: [
                                                                                    FaIcon(
                                                                                      FontAwesomeIcons.solidThumbsUp,
                                                                                      color: Color(0xFF619B99),
                                                                                      size: 22.0,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        listViewMessagesRecord.messageLikedBy.length.toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            if (!listViewMessagesRecord.messageLikedBy.contains(currentUserReference))
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  HapticFeedback.lightImpact();
                                                                                  if (listViewMessagesRecord.messageLikedBy.contains(currentUserReference) == true) {
                                                                                    return;
                                                                                  }

                                                                                  await listViewMessagesRecord.reference.update({
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'messageLikedBy': FieldValue.arrayUnion([
                                                                                          currentUserReference
                                                                                        ]),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                  children: [
                                                                                    FaIcon(
                                                                                      FontAwesomeIcons.thumbsUp,
                                                                                      color: FlutterFlowTheme.of(context).worshipRing,
                                                                                      size: 22.0,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        listViewMessagesRecord.messageLikedBy.length.toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ).animateOnPageLoad(
                                                                              animationsMap['containerOnPageLoadAnimation4']!),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          6.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            20.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            if (!listViewMessagesRecord.messageCriedBy.contains(currentUserReference))
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  HapticFeedback.lightImpact();
                                                                                  if (listViewMessagesRecord.messageCriedBy.contains(currentUserReference) == true) {
                                                                                    return;
                                                                                  }

                                                                                  await listViewMessagesRecord.reference.update({
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'messageCriedBy': FieldValue.arrayUnion([
                                                                                          currentUserReference
                                                                                        ]),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                  children: [
                                                                                    FaIcon(
                                                                                      FontAwesomeIcons.sadCry,
                                                                                      color: Color(0xFF6D6DAE),
                                                                                      size: 22.0,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        listViewMessagesRecord.messageCriedBy.length.toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            if (listViewMessagesRecord.messageCriedBy.contains(currentUserReference))
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  HapticFeedback.lightImpact();
                                                                                  if (listViewMessagesRecord.messageCriedBy.contains(currentUserReference) == true) {
                                                                                    await listViewMessagesRecord.reference.update({
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'messageCriedBy': FieldValue.arrayRemove([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                  }
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                  children: [
                                                                                    FaIcon(
                                                                                      FontAwesomeIcons.solidSadCry,
                                                                                      color: Color(0xFF6D6DAE),
                                                                                      size: 22.0,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        listViewMessagesRecord.messageCriedBy.length.toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ).animateOnPageLoad(
                                                                              animationsMap['containerOnPageLoadAnimation5']!),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          40.0,
                                                                      height:
                                                                          20.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (!listViewMessagesRecord
                                                                              .messageLaughedBy
                                                                              .contains(currentUserReference))
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                HapticFeedback.lightImpact();
                                                                                if (listViewMessagesRecord.messageLaughedBy.contains(currentUserReference) == true) {
                                                                                  return;
                                                                                }

                                                                                await listViewMessagesRecord.reference.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'messageLaughedBy': FieldValue.arrayUnion([
                                                                                        currentUserReference
                                                                                      ]),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                              },
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                children: [
                                                                                  FaIcon(
                                                                                    FontAwesomeIcons.laughSquint,
                                                                                    color: FlutterFlowTheme.of(context).worshipRing,
                                                                                    size: 22.0,
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      listViewMessagesRecord.messageLaughedBy.length.toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          if (listViewMessagesRecord
                                                                              .messageLaughedBy
                                                                              .contains(currentUserReference))
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                HapticFeedback.lightImpact();
                                                                                if (listViewMessagesRecord.messageLaughedBy.contains(currentUserReference) == true) {
                                                                                  await listViewMessagesRecord.reference.update({
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'messageLaughedBy': FieldValue.arrayRemove([
                                                                                          currentUserReference
                                                                                        ]),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                }
                                                                              },
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                children: [
                                                                                  FaIcon(
                                                                                    FontAwesomeIcons.solidLaughSquint,
                                                                                    color: FlutterFlowTheme.of(context).worshipRing,
                                                                                    size: 22.0,
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      listViewMessagesRecord.messageLaughedBy.length.toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation6']!),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (listViewMessagesRecord
                                                      .reactionsVisible)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                          'relative',
                                                          listViewMessagesRecord
                                                              .timeSent!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
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
                                                                      .lightSecondaryText,
                                                                  fontSize:
                                                                      10.0,
                                                                ),
                                                      ),
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
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
