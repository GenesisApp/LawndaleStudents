import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/chat_event_choosing_widget.dart';
import '/components/chat_event_creation_widget.dart';
import '/components/chat_event_viewing_widget.dart';
import '/components/chat_poll_creation_widget.dart';
import '/components/community_prayer_request_chat_widget.dart';
import '/components/create_prayer_chat_widget.dart';
import '/components/current_poll_choosing_widget.dart';
import '/components/current_poll_viewing_widget.dart';
import '/components/edit_message_widget.dart';
import '/components/group_chat_settings_widget.dart';
import '/components/language_report_widget.dart';
import '/components/p_d_f_viewer_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'chat_page_model.dart';
export 'chat_page_model.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({
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
  _ChatPageWidgetState createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget>
    with TickerProviderStateMixin {
  late ChatPageModel _model;

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
    'textOnPageLoadAnimation1': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.5,
          end: 1.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.5,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: Offset(30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation8': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'stackOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'progressBarOnPageLoadAnimation1': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.3,
          end: 1.0,
        ),
      ],
    ),
    'stackOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: Offset(30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'progressBarOnPageLoadAnimation2': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.3,
          end: 1.0,
        ),
      ],
    ),
    'stackOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timeronLoadController.onStartTimer();

      await widget.chatUsers!.update({
        ...mapToFirestore(
          {
            'messageChats':
                FieldValue.arrayUnion([widget.chatChosen?.reference]),
          },
        ),
      });
      if ((currentUserDocument?.chatsOptedOutOf?.toList() ?? [])
          .contains(widget.chatChosen?.reference)) {
        await widget.chatChosen!.reference.update({
          ...createMessageChatsRecordData(
            resetDate: true,
          ),
          ...mapToFirestore(
            {
              'users': FieldValue.arrayUnion([currentUserReference]),
            },
          ),
        });
      } else {
        await widget.chatChosen!.reference.update({
          ...createMessageChatsRecordData(
            resetDate: true,
          ),
          ...mapToFirestore(
            {
              'users': FieldValue.arrayUnion([currentUserReference]),
              'userswithNotificationsOn':
                  FieldValue.arrayUnion([currentUserReference]),
            },
          ),
        });
      }
    });

    _model.textFieldTextController ??= TextEditingController();
    _model.textFieldTextFocusNode ??= FocusNode();

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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
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
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowTimer(
                            initialTime: _model.timerUpload1Milliseconds,
                            getDisplayTime: (value) =>
                                StopWatchTimer.getDisplayTime(value,
                                    milliSecond: false),
                            controller: _model.timerUpload1Controller,
                            onChanged: (value, displayTime, shouldUpdate) {
                              _model.timerUpload1Milliseconds = value;
                              _model.timerUpload1Value = displayTime;
                              if (shouldUpdate) setState(() {});
                            },
                            onEnded: () async {
                              if (_model.uploadedFileUrl2 != null &&
                                  _model.uploadedFileUrl2 != '') {
                                setState(() {
                                  FFAppState().photoAdded = true;
                                });
                              }
                            },
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                          ),
                          FlutterFlowTimer(
                            initialTime: _model.timerUpload2Milliseconds,
                            getDisplayTime: (value) =>
                                StopWatchTimer.getDisplayTime(value,
                                    milliSecond: false),
                            controller: _model.timerUpload2Controller,
                            onChanged: (value, displayTime, shouldUpdate) {
                              _model.timerUpload2Milliseconds = value;
                              _model.timerUpload2Value = displayTime;
                              if (shouldUpdate) setState(() {});
                            },
                            onEnded: () async {
                              if (_model.uploadedFileUrl4 != null &&
                                  _model.uploadedFileUrl4 != '') {
                                setState(() {
                                  FFAppState().pdfAdded = true;
                                });
                              }
                            },
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                          ),
                          FlutterFlowTimer(
                            initialTime: _model.timerMilliseconds,
                            getDisplayTime: (value) =>
                                StopWatchTimer.getDisplayTime(value,
                                    milliSecond: false),
                            controller: _model.timerController,
                            onChanged: (value, displayTime, shouldUpdate) {
                              _model.timerMilliseconds = value;
                              _model.timerValue = displayTime;
                              if (shouldUpdate) setState(() {});
                            },
                            onEnded: () async {
                              setState(() {
                                FFAppState().photoAdded = false;
                                FFAppState().pdfAdded = false;
                                FFAppState().messageOptionsVisible = false;
                                FFAppState().replying = false;
                              });
                              setState(() {
                                _model.linkAdded = false;
                              });
                            },
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                          ),
                          FlutterFlowTimer(
                            initialTime: _model.timeronLoadMilliseconds,
                            getDisplayTime: (value) =>
                                StopWatchTimer.getDisplayTime(value,
                                    milliSecond: false),
                            controller: _model.timeronLoadController,
                            onChanged: (value, displayTime, shouldUpdate) {
                              _model.timeronLoadMilliseconds = value;
                              _model.timeronLoadValue = displayTime;
                              if (shouldUpdate) setState(() {});
                            },
                            onEnded: () async {
                              setState(() {
                                FFAppState().photoAdded = false;
                                FFAppState().pdfAdded = false;
                                FFAppState().messageOptionsVisible = false;
                                FFAppState().replying = false;
                              });
                            },
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 10.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pop();

                                await widget.chatChosen!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'userswithIndicator':
                                          FieldValue.arrayRemove(
                                              [currentUserReference]),
                                    },
                                  ),
                                });
                              },
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 22.0,
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                barrierColor: FlutterFlowTheme.of(context)
                                    .opagueSeparator,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                      child: GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.92,
                                        child: GroupChatSettingsWidget(
                                          grouptoEdit: widget.chatChosen,
                                          otherUser: widget.otherUserDoc,
                                          chatUsers: widget.chatUsers,
                                        ),
                                      ),
                                    ),
                                  ));
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (widget.chatChosen!.users.length > 2)
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: CachedNetworkImage(
                                      fadeInDuration:
                                          Duration(milliseconds: 500),
                                      fadeOutDuration:
                                          Duration(milliseconds: 500),
                                      imageUrl: valueOrDefault<String>(
                                        widget.chatChosen?.groupBackground,
                                        'https://images.unsplash.com/photo-1502810365585-56ffa361fdde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                                      ),
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                if (widget.chatChosen!.users.length <= 2)
                                  Container(
                                    width: 45.0,
                                    height: 45.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: CachedNetworkImage(
                                      fadeInDuration:
                                          Duration(milliseconds: 500),
                                      fadeOutDuration:
                                          Duration(milliseconds: 500),
                                      imageUrl: valueOrDefault<String>(
                                        widget.chatChosen?.groupBackground !=
                                                    null &&
                                                widget.chatChosen
                                                        ?.groupBackground !=
                                                    ''
                                            ? widget.chatChosen?.groupBackground
                                            : widget.otherUserDoc?.photoUrl,
                                        'https://www.chocolatebayou.org/wp-content/uploads/No-Image-Person-2048x2048.jpeg',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                widget.chatChosen!.users
                                                            .length >
                                                        2
                                                    ? valueOrDefault<String>(
                                                        widget.chatChosen
                                                            ?.groupName,
                                                        'Group Chat',
                                                      )
                                                    : widget.otherUserDoc
                                                        ?.displayName,
                                                'Group Chat',
                                              ).maybeHandleOverflow(
                                                maxChars: 25,
                                                replacement: '…',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .label,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            if (widget
                                                    .chatChosen!.users.length <=
                                                2)
                                              Icon(
                                                Icons.keyboard_arrow_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lightSecondaryText,
                                                size: 14.0,
                                              ),
                                          ],
                                        ),
                                      ),
                                      if (widget.chatChosen!.users.length > 2)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.chatChosen!.users.length
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '6jcjpq9v' /* People */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                              Icon(
                                                Icons.keyboard_arrow_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lightSecondaryText,
                                                size: 14.0,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 20.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'PinnedMessages',
                                  queryParameters: {
                                    'chatChosen': serializeParam(
                                      widget.chatChosen,
                                      ParamType.Document,
                                    ),
                                    'chatUsers': serializeParam(
                                      widget.chatUsers,
                                      ParamType.DocumentReference,
                                    ),
                                    'otherUserDoc': serializeParam(
                                      widget.otherUserDoc,
                                      ParamType.Document,
                                    ),
                                    'otherUserRef': serializeParam(
                                      widget.otherUserRef,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'chatChosen': widget.chatChosen,
                                    'otherUserDoc': widget.otherUserDoc,
                                  },
                                );
                              },
                              child: FaIcon(
                                FontAwesomeIcons.ellipsisH,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 22.0,
                              ),
                            ),
                          ),
                        ],
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
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: StreamBuilder<List<MessagesRecord>>(
                      stream: queryMessagesRecord(
                        queryBuilder: (messagesRecord) => messagesRecord
                            .where(
                              'chatReference',
                              isEqualTo: widget.chatChosen?.reference,
                            )
                            .where(
                              'timeSent',
                              isGreaterThanOrEqualTo:
                                  functions.dateFromThirtyDaysAgo(),
                            )
                            .orderBy('timeSent'),
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
                        List<MessagesRecord> columnMessagesRecordList =
                            snapshot.data!;
                        return SingleChildScrollView(
                          reverse: true,
                          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: List.generate(
                                columnMessagesRecordList.length, (columnIndex) {
                              final columnMessagesRecord =
                                  columnMessagesRecordList[columnIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if (columnMessagesRecord.dateResetMessage)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 8.0),
                                      child: RichText(
                                        textScaleFactor: MediaQuery.of(context)
                                            .textScaleFactor,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: dateTimeFormat(
                                                'relative',
                                                columnMessagesRecord.timeSent!,
                                                locale: FFLocalizations.of(
                                                            context)
                                                        .languageShortCode ??
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lightSecondaryText,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 11.0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '5solkni7' /*  at  */,
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lightSecondaryText,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 11.0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: dateTimeFormat(
                                                'jm',
                                                columnMessagesRecord.timeSent!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lightSecondaryText,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 11.0,
                                              ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                  if (columnMessagesRecord.user !=
                                      currentUserReference)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
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
                                                child:
                                                    FutureBuilder<UsersRecord>(
                                                  future: UsersRecord
                                                      .getDocumentOnce(
                                                          columnMessagesRecord
                                                              .user!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 75.0,
                                                          height: 75.0,
                                                          child: SpinKitRipple(
                                                            color: Color(
                                                                0xFF7F95AD),
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
                                                              ParamType
                                                                  .Document,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
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
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  6.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          columnMessagesRecord
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
                                                  if (columnMessagesRecord
                                                      .hasReply)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: FutureBuilder<
                                                          MessagesRecord>(
                                                        future: MessagesRecord
                                                            .getDocumentOnce(
                                                                columnMessagesRecord
                                                                    .messageReplyingto!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 75.0,
                                                                height: 75.0,
                                                                child:
                                                                    SpinKitRipple(
                                                                  color: Color(
                                                                      0xFF7F95AD),
                                                                  size: 75.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final containerMessagesRecord =
                                                              snapshot.data!;
                                                          return Container(
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.75,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondarySystemBackground,
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
                                                                          5.0,
                                                                          8.0,
                                                                          5.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SvgPicture
                                                                      .asset(
                                                                    'assets/images/arrow-bend-up-right.svg',
                                                                    width: 30.0,
                                                                    height:
                                                                        30.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          containerMessagesRecord
                                                                              .userName,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                fontSize: 12.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          containerMessagesRecord
                                                                              .messageText
                                                                              .maybeHandleOverflow(
                                                                            maxChars:
                                                                                30,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                fontSize: 12.0,
                                                                              ),
                                                                        ),
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
                                                  if (columnMessagesRecord
                                                              .textImagePath !=
                                                          null &&
                                                      columnMessagesRecord
                                                              .textImagePath !=
                                                          '')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
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
                                                                      columnMessagesRecord
                                                                          .textImagePath,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                                allowRotation:
                                                                    false,
                                                                tag: columnMessagesRecord
                                                                    .textImagePath,
                                                                useHeroAnimation:
                                                                    true,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Hero(
                                                          tag: columnMessagesRecord
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
                                                                  columnMessagesRecord
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
                                                  if (columnMessagesRecord
                                                              .link !=
                                                          null &&
                                                      columnMessagesRecord
                                                              .link !=
                                                          '')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: custom_widgets
                                                          .LinkPreviewWidget(
                                                        width: 250.0,
                                                        height: 250.0,
                                                        link:
                                                            columnMessagesRecord
                                                                .link,
                                                      ),
                                                    ),
                                                  if (columnMessagesRecord
                                                              .pdfImage !=
                                                          null &&
                                                      columnMessagesRecord
                                                              .pdfImage !=
                                                          '')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
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
                                                                          columnMessagesRecord,
                                                                      pdfImageSelectedRef:
                                                                          columnMessagesRecord
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
                                                                .secondarySystemBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
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
                                                                      '4try126l' /* PDF File */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).label,
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
                                                                        '96rfr7ye' /* Click to View */,
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
                                                  if (!columnMessagesRecord
                                                          .personReactingList
                                                          .contains(
                                                              currentUserReference) &&
                                                      (columnMessagesRecord
                                                                  .messageText !=
                                                              null &&
                                                          columnMessagesRecord
                                                                  .messageText !=
                                                              ''))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      MediaQuery.sizeOf(context)
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
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
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
                                                                    await columnMessagesRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'personReactingList':
                                                                              FieldValue.arrayUnion([
                                                                            currentUserReference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                  },
                                                                  onLongPress:
                                                                      () async {
                                                                    await currentUserReference!
                                                                        .update(
                                                                            createUsersRecordData(
                                                                      messageReplyingTo:
                                                                          columnMessagesRecord
                                                                              .reference,
                                                                    ));
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                              .replying =
                                                                          true;
                                                                    });
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
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(12.0),
                                                                        topLeft:
                                                                            Radius.circular(12.0),
                                                                        topRight:
                                                                            Radius.circular(12.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                      child:
                                                                          Text(
                                                                        columnMessagesRecord
                                                                            .messageText,
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: GoogleFonts
                                                                            .getFont(
                                                                          'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).label,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontSize:
                                                                              15.5,
                                                                          height:
                                                                              1.35,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (columnMessagesRecord
                                                                  .edited)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'knnuox95' /* (edited) */,
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
                                                              if ((columnMessagesRecord.messageLaughedBy.length > 0) ||
                                                                  (columnMessagesRecord
                                                                          .messageCriedBy
                                                                          .length >
                                                                      0) ||
                                                                  (columnMessagesRecord
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
                                                                      color: Colors
                                                                          .transparent,
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
                                                                        if (columnMessagesRecord.messageLikedBy.length >
                                                                            0)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidHeart,
                                                                              color: FlutterFlowTheme.of(context).worshipRing,
                                                                              size: 18.0,
                                                                            ),
                                                                          ),
                                                                        if (columnMessagesRecord.messageCriedBy.length >
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
                                                                        if (columnMessagesRecord.messageLaughedBy.length >
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
                                                                  if (columnMessagesRecord
                                                                      .pin)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  if (columnMessagesRecord
                                                          .personReactingList
                                                          .contains(
                                                              currentUserReference) &&
                                                      (columnMessagesRecord
                                                                  .messageText !=
                                                              null &&
                                                          columnMessagesRecord
                                                                  .messageText !=
                                                              ''))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      MediaQuery.sizeOf(context)
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
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
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
                                                                    await columnMessagesRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'personReactingList':
                                                                              FieldValue.arrayRemove([
                                                                            currentUserReference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                  },
                                                                  onLongPress:
                                                                      () async {
                                                                    await currentUserReference!
                                                                        .update(
                                                                            createUsersRecordData(
                                                                      messageReplyingTo:
                                                                          columnMessagesRecord
                                                                              .reference,
                                                                    ));
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                              .replying =
                                                                          true;
                                                                    });
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
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(12.0),
                                                                        topLeft:
                                                                            Radius.circular(12.0),
                                                                        topRight:
                                                                            Radius.circular(12.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                      child:
                                                                          Text(
                                                                        columnMessagesRecord
                                                                            .messageText,
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: GoogleFonts
                                                                            .getFont(
                                                                          'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).label,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontSize:
                                                                              15.5,
                                                                          height:
                                                                              1.35,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (columnMessagesRecord
                                                                  .edited)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'pvm8f1af' /* (edited) */,
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
                                                              if ((columnMessagesRecord.messageLaughedBy.length > 0) ||
                                                                  (columnMessagesRecord
                                                                          .messageCriedBy
                                                                          .length >
                                                                      0) ||
                                                                  (columnMessagesRecord
                                                                          .messageLikedBy
                                                                          .length >
                                                                      0))
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.00,
                                                                          0.00),
                                                                  child:
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
                                                                        color: Colors
                                                                            .transparent,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          if (columnMessagesRecord.messageLikedBy.length >
                                                                              0)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidHeart,
                                                                                color: FlutterFlowTheme.of(context).worshipRing,
                                                                                size: 18.0,
                                                                              ),
                                                                            ),
                                                                          if (columnMessagesRecord.messageCriedBy.length >
                                                                              0)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidSadCry,
                                                                                color: Color(0xFF6D6DAE),
                                                                                size: 18.0,
                                                                              ),
                                                                            ),
                                                                          if (columnMessagesRecord.messageLaughedBy.length >
                                                                              0)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                              child: FaIcon(
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
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (columnMessagesRecord
                                                                      .pin)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  if (columnMessagesRecord
                                                      .personReactingList
                                                      .contains(
                                                          currentUserReference))
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
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                                  padding: EdgeInsetsDirectional
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
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                if (columnMessagesRecord.messageLikedBy.contains(currentUserReference))
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        HapticFeedback.lightImpact();
                                                                                        if (columnMessagesRecord.messageLikedBy.contains(currentUserReference) == true) {
                                                                                          await columnMessagesRecord.reference.update({
                                                                                            ...mapToFirestore(
                                                                                              {
                                                                                                'messageLikedBy': FieldValue.arrayRemove([
                                                                                                  currentUserReference
                                                                                                ]),
                                                                                                'personReactingList': FieldValue.arrayRemove([
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
                                                                                            FontAwesomeIcons.solidHeart,
                                                                                            color: FlutterFlowTheme.of(context).worshipRing,
                                                                                            size: 22.0,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              columnMessagesRecord.messageLikedBy.length.toString(),
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
                                                                                if (!columnMessagesRecord.messageLikedBy.contains(currentUserReference))
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        HapticFeedback.lightImpact();
                                                                                        if (columnMessagesRecord.messageLikedBy.contains(currentUserReference) == true) {
                                                                                          return;
                                                                                        }

                                                                                        await columnMessagesRecord.reference.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'messageLikedBy': FieldValue.arrayUnion([
                                                                                                currentUserReference
                                                                                              ]),
                                                                                              'personReactingList': FieldValue.arrayRemove([
                                                                                                currentUserReference
                                                                                              ]),
                                                                                            },
                                                                                          ),
                                                                                        });
                                                                                        triggerPushNotification(
                                                                                          notificationTitle: 'New Message',
                                                                                          notificationText: '${currentUserDisplayName} loved \"${columnMessagesRecord.messageText}\"',
                                                                                          notificationImageUrl: currentUserPhoto,
                                                                                          userRefs: widget.chatChosen!.users.where((e) => e != currentUserReference).toList(),
                                                                                          initialPageName: 'ChatPage',
                                                                                          parameterData: {
                                                                                            'chatChosen': widget.chatChosen,
                                                                                            'chatUsers': widget.chatUsers,
                                                                                            'otherUserDoc': widget.otherUserDoc,
                                                                                            'otherUserRef': widget.otherUserRef,
                                                                                          },
                                                                                        );

                                                                                        await widget.chatChosen!.reference.update(createMessageChatsRecordData(
                                                                                          lastMessage: '${currentUserDisplayName} loved \"${columnMessagesRecord.messageText}\"',
                                                                                          lastMessageTime: getCurrentTimestamp,
                                                                                          lastMessageSentBy: currentUserReference,
                                                                                        ));
                                                                                      },
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          FaIcon(
                                                                                            FontAwesomeIcons.heart,
                                                                                            color: FlutterFlowTheme.of(context).worshipRing,
                                                                                            size: 22.0,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              columnMessagesRecord.messageLikedBy.length.toString(),
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
                                                                              if (columnMessagesRecord.messageCriedBy.contains(currentUserReference))
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      HapticFeedback.lightImpact();
                                                                                      if (columnMessagesRecord.messageCriedBy.contains(currentUserReference) == true) {
                                                                                        await columnMessagesRecord.reference.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'messageCriedBy': FieldValue.arrayRemove([
                                                                                                currentUserReference
                                                                                              ]),
                                                                                              'personReactingList': FieldValue.arrayRemove([
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
                                                                                            columnMessagesRecord.messageCriedBy.length.toString(),
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
                                                                              if (!columnMessagesRecord.messageCriedBy.contains(currentUserReference))
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      HapticFeedback.lightImpact();
                                                                                      if (columnMessagesRecord.messageCriedBy.contains(currentUserReference) == true) {
                                                                                        return;
                                                                                      }

                                                                                      await columnMessagesRecord.reference.update({
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'messageCriedBy': FieldValue.arrayUnion([
                                                                                              currentUserReference
                                                                                            ]),
                                                                                            'personReactingList': FieldValue.arrayRemove([
                                                                                              currentUserReference
                                                                                            ]),
                                                                                          },
                                                                                        ),
                                                                                      });
                                                                                      triggerPushNotification(
                                                                                        notificationTitle: 'New Message',
                                                                                        notificationText: '${currentUserDisplayName} cried at \"${columnMessagesRecord.messageText}\"',
                                                                                        notificationImageUrl: currentUserPhoto,
                                                                                        userRefs: widget.chatChosen!.users.where((e) => e != currentUserReference).toList(),
                                                                                        initialPageName: 'ChatPage',
                                                                                        parameterData: {
                                                                                          'chatChosen': widget.chatChosen,
                                                                                          'chatUsers': widget.chatUsers,
                                                                                          'otherUserDoc': widget.otherUserDoc,
                                                                                          'otherUserRef': widget.otherUserRef,
                                                                                        },
                                                                                      );

                                                                                      await widget.chatChosen!.reference.update(createMessageChatsRecordData(
                                                                                        lastMessage: '${currentUserDisplayName} cried at \"${columnMessagesRecord.messageText}\"',
                                                                                        lastMessageTime: getCurrentTimestamp,
                                                                                        lastMessageSentBy: currentUserReference,
                                                                                      ));
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
                                                                                            columnMessagesRecord.messageCriedBy.length.toString(),
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
                                                                        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation2']!),
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
                                                                            if (columnMessagesRecord.messageLaughedBy.contains(currentUserReference))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    HapticFeedback.lightImpact();
                                                                                    if (columnMessagesRecord.messageLaughedBy.contains(currentUserReference) == true) {
                                                                                      await columnMessagesRecord.reference.update({
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'messageLaughedBy': FieldValue.arrayRemove([
                                                                                              currentUserReference
                                                                                            ]),
                                                                                            'personReactingList': FieldValue.arrayRemove([
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
                                                                                          columnMessagesRecord.messageLaughedBy.length.toString(),
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
                                                                            if (!columnMessagesRecord.messageLaughedBy.contains(currentUserReference))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    HapticFeedback.lightImpact();
                                                                                    if (columnMessagesRecord.messageLaughedBy.contains(currentUserReference) == true) {
                                                                                      return;
                                                                                    }

                                                                                    await columnMessagesRecord.reference.update({
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'messageLaughedBy': FieldValue.arrayUnion([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                          'personReactingList': FieldValue.arrayRemove([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                    triggerPushNotification(
                                                                                      notificationTitle: 'New Message',
                                                                                      notificationText: '${currentUserDisplayName} laughed at \"${columnMessagesRecord.messageText}\"',
                                                                                      notificationImageUrl: currentUserPhoto,
                                                                                      userRefs: widget.chatChosen!.users.where((e) => e != currentUserReference).toList(),
                                                                                      initialPageName: 'ChatPage',
                                                                                      parameterData: {
                                                                                        'chatChosen': widget.chatChosen,
                                                                                        'chatUsers': widget.chatUsers,
                                                                                        'otherUserDoc': widget.otherUserDoc,
                                                                                        'otherUserRef': widget.otherUserRef,
                                                                                      },
                                                                                    );

                                                                                    await widget.chatChosen!.reference.update(createMessageChatsRecordData(
                                                                                      lastMessage: '${currentUserDisplayName} laughed at \"${columnMessagesRecord.messageText}\"',
                                                                                      lastMessageTime: getCurrentTimestamp,
                                                                                      lastMessageSentBy: currentUserReference,
                                                                                    ));
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
                                                                                          columnMessagesRecord.messageLaughedBy.length.toString(),
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
                                                  if (columnMessagesRecord
                                                      .personReactingList
                                                      .contains(
                                                          currentUserReference))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  6.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                          'relative',
                                                          columnMessagesRecord
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
                                                  if (columnMessagesRecord
                                                          .prayerRequest !=
                                                      null)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: StreamBuilder<
                                                          PrayerRequestsRecord>(
                                                        stream: PrayerRequestsRecord
                                                            .getDocument(
                                                                columnMessagesRecord
                                                                    .prayerRequest!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 75.0,
                                                                height: 75.0,
                                                                child:
                                                                    SpinKitRipple(
                                                                  color: Color(
                                                                      0xFF7F95AD),
                                                                  size: 75.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final containerPrayerRequestsRecord =
                                                              snapshot.data!;
                                                          return Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.8,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child:
                                                                CommunityPrayerRequestChatWidget(
                                                              key: Key(
                                                                  'Key89a_${columnIndex}_of_${columnMessagesRecordList.length}'),
                                                              chosenPrayerRequestDoc:
                                                                  containerPrayerRequestsRecord,
                                                              chosenPrayerRequestRef:
                                                                  columnMessagesRecord
                                                                      .prayerRequest!,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (columnMessagesRecord.user ==
                                      currentUserReference)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.sizeOf(context)
                                                    .width *
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                          valueOrDefault<
                                                              String>(
                                                            columnMessagesRecord
                                                                .userName,
                                                            'Guest User',
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
                                                                fontSize: 11.0,
                                                              ),
                                                        ),
                                                      ),
                                                    if (columnMessagesRecord
                                                        .hasReply)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    8.0),
                                                        child: FutureBuilder<
                                                            MessagesRecord>(
                                                          future: MessagesRecord
                                                              .getDocumentOnce(
                                                                  columnMessagesRecord
                                                                      .messageReplyingto!),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 75.0,
                                                                  height: 75.0,
                                                                  child:
                                                                      SpinKitRipple(
                                                                    color: Color(
                                                                        0xFF7F95AD),
                                                                    size: 75.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final containerMessagesRecord =
                                                                snapshot.data!;
                                                            return Container(
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.75,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondarySystemBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            5.0,
                                                                            8.0,
                                                                            5.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SvgPicture
                                                                        .asset(
                                                                      'assets/images/arrow-bend-up-right.svg',
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          30.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            containerMessagesRecord.userName,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  fontSize: 12.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            containerMessagesRecord.messageText.maybeHandleOverflow(
                                                                              maxChars: 30,
                                                                              replacement: '…',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                  fontSize: 12.0,
                                                                                ),
                                                                          ),
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
                                                    if (columnMessagesRecord
                                                                .textImagePath !=
                                                            null &&
                                                        columnMessagesRecord
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
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
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
                                                                        columnMessagesRecord
                                                                            .textImagePath,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                  allowRotation:
                                                                      false,
                                                                  tag: columnMessagesRecord
                                                                      .textImagePath,
                                                                  useHeroAnimation:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Hero(
                                                            tag: columnMessagesRecord
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
                                                                    columnMessagesRecord
                                                                        .textImagePath,
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.5,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.2,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (columnMessagesRecord
                                                                .link !=
                                                            null &&
                                                        columnMessagesRecord
                                                                .link !=
                                                            '')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    8.0),
                                                        child: custom_widgets
                                                            .LinkPreviewWidget(
                                                          width: 250.0,
                                                          height: 250.0,
                                                          link:
                                                              columnMessagesRecord
                                                                  .link,
                                                        ),
                                                      ),
                                                    if (columnMessagesRecord
                                                                .pdfImage !=
                                                            null &&
                                                        columnMessagesRecord
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
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
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
                                                              builder:
                                                                  (context) {
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
                                                                  child:
                                                                      Padding(
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
                                                                            columnMessagesRecord,
                                                                        pdfImageSelectedRef:
                                                                            columnMessagesRecord.reference,
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
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.35,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondarySystemBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
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
                                                                        '2refz5p7' /* PDF File */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).label,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
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
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'mrya0cif' /* Click to View */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              fontSize: 12.0,
                                                                            ),
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .open_in_new_rounded,
                                                                        color: FlutterFlowTheme.of(context)
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
                                                    if (!columnMessagesRecord
                                                            .personReactingList
                                                            .contains(
                                                                currentUserReference) &&
                                                        (columnMessagesRecord
                                                                    .messageText !=
                                                                null &&
                                                            columnMessagesRecord
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
                                                                    if (columnMessagesRecord
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
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
                                                                        MediaQuery.sizeOf(context).width *
                                                                            0.75,
                                                                    maxHeight:
                                                                        double
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
                                                                      topRight:
                                                                          Radius.circular(
                                                                              12.0),
                                                                    ),
                                                                  ),
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
                                                                      await columnMessagesRecord
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'personReactingList':
                                                                                FieldValue.arrayUnion([
                                                                              currentUserReference
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                    },
                                                                    onLongPress:
                                                                        () async {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        barrierColor:
                                                                            Color(0x80000000),
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return WebViewAware(
                                                                              child: GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: EditMessageWidget(
                                                                                usersMessage: columnMessagesRecord.reference,
                                                                                usersMessageDoc: columnMessagesRecord,
                                                                                messageChat: widget.chatChosen?.reference,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondarySystemBackground,
                                                                        borderRadius:
                                                                            BorderRadius.only(
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
                                                                            10.0,
                                                                            10.0,
                                                                            10.0,
                                                                            10.0),
                                                                        child:
                                                                            Text(
                                                                          columnMessagesRecord
                                                                              .messageText,
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style:
                                                                              GoogleFonts.getFont(
                                                                            'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).label,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontSize:
                                                                                15.5,
                                                                            height:
                                                                                1.35,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (columnMessagesRecord
                                                                    .edited)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'hrg4821r' /* (edited) */,
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
                                                                if ((columnMessagesRecord.messageLaughedBy.length > 0) ||
                                                                    (columnMessagesRecord
                                                                            .messageCriedBy
                                                                            .length >
                                                                        0) ||
                                                                    (columnMessagesRecord
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
                                                                        color: Colors
                                                                            .transparent,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          if (columnMessagesRecord.messageLikedBy.length >
                                                                              0)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidHeart,
                                                                                color: FlutterFlowTheme.of(context).worshipRing,
                                                                                size: 18.0,
                                                                              ),
                                                                            ),
                                                                          if (columnMessagesRecord.messageCriedBy.length >
                                                                              0)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidSadCry,
                                                                                color: Color(0xFF6D6DAE),
                                                                                size: 18.0,
                                                                              ),
                                                                            ),
                                                                          if (columnMessagesRecord.messageLaughedBy.length >
                                                                              0)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                              child: FaIcon(
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
                                                    if (columnMessagesRecord
                                                            .personReactingList
                                                            .contains(
                                                                currentUserReference) &&
                                                        (columnMessagesRecord
                                                                    .messageText !=
                                                                null &&
                                                            columnMessagesRecord
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
                                                                    if (columnMessagesRecord
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
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
                                                                        MediaQuery.sizeOf(context).width *
                                                                            0.75,
                                                                    maxHeight:
                                                                        double
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
                                                                      topRight:
                                                                          Radius.circular(
                                                                              12.0),
                                                                    ),
                                                                  ),
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
                                                                      await columnMessagesRecord
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'personReactingList':
                                                                                FieldValue.arrayRemove([
                                                                              currentUserReference
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                    },
                                                                    onLongPress:
                                                                        () async {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        barrierColor:
                                                                            Color(0x80000000),
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return WebViewAware(
                                                                              child: GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: EditMessageWidget(
                                                                                usersMessage: columnMessagesRecord.reference,
                                                                                usersMessageDoc: columnMessagesRecord,
                                                                                messageChat: widget.chatChosen?.reference,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondarySystemBackground,
                                                                        borderRadius:
                                                                            BorderRadius.only(
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
                                                                            10.0,
                                                                            10.0,
                                                                            10.0,
                                                                            10.0),
                                                                        child:
                                                                            Text(
                                                                          columnMessagesRecord
                                                                              .messageText,
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style:
                                                                              GoogleFonts.getFont(
                                                                            'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).label,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontSize:
                                                                                15.5,
                                                                            height:
                                                                                1.35,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (columnMessagesRecord
                                                                    .edited)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'fvy8lszl' /* (edited) */,
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
                                                                if ((columnMessagesRecord.messageLaughedBy.length > 0) ||
                                                                    (columnMessagesRecord
                                                                            .messageCriedBy
                                                                            .length >
                                                                        0) ||
                                                                    (columnMessagesRecord
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
                                                                        color: Colors
                                                                            .transparent,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          if (columnMessagesRecord.messageLikedBy.length >
                                                                              0)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidHeart,
                                                                                color: FlutterFlowTheme.of(context).worshipRing,
                                                                                size: 18.0,
                                                                              ),
                                                                            ),
                                                                          if (columnMessagesRecord.messageCriedBy.length >
                                                                              0)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidSadCry,
                                                                                color: Color(0xFF6D6DAE),
                                                                                size: 18.0,
                                                                              ),
                                                                            ),
                                                                          if (columnMessagesRecord.messageLaughedBy.length >
                                                                              0)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                              child: FaIcon(
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
                                                    if (columnMessagesRecord
                                                        .personReactingList
                                                        .contains(
                                                            currentUserReference))
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
                                                                  padding: EdgeInsetsDirectional
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
                                                                              if (columnMessagesRecord.messageLikedBy.contains(currentUserReference))
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    HapticFeedback.lightImpact();
                                                                                    if (columnMessagesRecord.messageLikedBy.contains(currentUserReference) == true) {
                                                                                      await columnMessagesRecord.reference.update({
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'messageLikedBy': FieldValue.arrayRemove([
                                                                                              currentUserReference
                                                                                            ]),
                                                                                            'personReactingList': FieldValue.arrayRemove([
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
                                                                                          columnMessagesRecord.messageLikedBy.length.toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              if (!columnMessagesRecord.messageLikedBy.contains(currentUserReference))
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    HapticFeedback.lightImpact();
                                                                                    if (columnMessagesRecord.messageLikedBy.contains(currentUserReference) == true) {
                                                                                      return;
                                                                                    }

                                                                                    await columnMessagesRecord.reference.update({
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'messageLikedBy': FieldValue.arrayUnion([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                          'personReactingList': FieldValue.arrayRemove([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                    triggerPushNotification(
                                                                                      notificationTitle: 'New Message',
                                                                                      notificationText: '${currentUserDisplayName} loved \"${columnMessagesRecord.messageText}\"',
                                                                                      notificationImageUrl: currentUserPhoto,
                                                                                      userRefs: widget.chatChosen!.users.where((e) => e != currentUserReference).toList(),
                                                                                      initialPageName: 'ChatPage',
                                                                                      parameterData: {
                                                                                        'chatChosen': widget.chatChosen,
                                                                                        'chatUsers': widget.chatUsers,
                                                                                        'otherUserDoc': widget.otherUserDoc,
                                                                                        'otherUserRef': widget.otherUserRef,
                                                                                      },
                                                                                    );

                                                                                    await widget.chatChosen!.reference.update(createMessageChatsRecordData(
                                                                                      lastMessage: '${currentUserDisplayName} loved \"${columnMessagesRecord.messageText}\"',
                                                                                      lastMessageTime: getCurrentTimestamp,
                                                                                      lastMessageSentBy: currentUserReference,
                                                                                    ));
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
                                                                                          columnMessagesRecord.messageLikedBy.length.toString(),
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
                                                                        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation4']!),
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
                                                                              if (!columnMessagesRecord.messageCriedBy.contains(currentUserReference))
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    HapticFeedback.lightImpact();
                                                                                    if (columnMessagesRecord.messageCriedBy.contains(currentUserReference) == true) {
                                                                                      return;
                                                                                    }

                                                                                    await columnMessagesRecord.reference.update({
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'messageCriedBy': FieldValue.arrayUnion([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                          'personReactingList': FieldValue.arrayRemove([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                    triggerPushNotification(
                                                                                      notificationTitle: 'New Message',
                                                                                      notificationText: '${currentUserDisplayName} cried at \"${columnMessagesRecord.messageText}\"',
                                                                                      notificationImageUrl: currentUserPhoto,
                                                                                      userRefs: widget.chatChosen!.users.where((e) => e != currentUserReference).toList(),
                                                                                      initialPageName: 'ChatPage',
                                                                                      parameterData: {
                                                                                        'chatChosen': widget.chatChosen,
                                                                                        'chatUsers': widget.chatUsers,
                                                                                        'otherUserDoc': widget.otherUserDoc,
                                                                                        'otherUserRef': widget.otherUserRef,
                                                                                      },
                                                                                    );

                                                                                    await widget.chatChosen!.reference.update(createMessageChatsRecordData(
                                                                                      lastMessage: '${currentUserDisplayName} cried at \"${columnMessagesRecord.messageText}\"',
                                                                                      lastMessageTime: getCurrentTimestamp,
                                                                                      lastMessageSentBy: currentUserReference,
                                                                                    ));
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
                                                                                          columnMessagesRecord.messageCriedBy.length.toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              if (columnMessagesRecord.messageCriedBy.contains(currentUserReference))
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    HapticFeedback.lightImpact();
                                                                                    if (columnMessagesRecord.messageCriedBy.contains(currentUserReference) == true) {
                                                                                      await columnMessagesRecord.reference.update({
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'messageCriedBy': FieldValue.arrayRemove([
                                                                                              currentUserReference
                                                                                            ]),
                                                                                            'personReactingList': FieldValue.arrayRemove([
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
                                                                                          columnMessagesRecord.messageCriedBy.length.toString(),
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
                                                                        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation5']!),
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
                                                                            if (!columnMessagesRecord.messageLaughedBy.contains(currentUserReference))
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  HapticFeedback.lightImpact();
                                                                                  if (columnMessagesRecord.messageLaughedBy.contains(currentUserReference) == true) {
                                                                                    return;
                                                                                  }

                                                                                  await columnMessagesRecord.reference.update({
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'messageLaughedBy': FieldValue.arrayUnion([
                                                                                          currentUserReference
                                                                                        ]),
                                                                                        'personReactingList': FieldValue.arrayRemove([
                                                                                          currentUserReference
                                                                                        ]),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                  triggerPushNotification(
                                                                                    notificationTitle: 'New Message',
                                                                                    notificationText: '${currentUserDisplayName} laughed at \"${columnMessagesRecord.messageText}\"',
                                                                                    notificationImageUrl: currentUserPhoto,
                                                                                    userRefs: widget.chatChosen!.users.where((e) => e != currentUserReference).toList(),
                                                                                    initialPageName: 'ChatPage',
                                                                                    parameterData: {
                                                                                      'chatChosen': widget.chatChosen,
                                                                                      'chatUsers': widget.chatUsers,
                                                                                      'otherUserDoc': widget.otherUserDoc,
                                                                                      'otherUserRef': widget.otherUserRef,
                                                                                    },
                                                                                  );

                                                                                  await widget.chatChosen!.reference.update(createMessageChatsRecordData(
                                                                                    lastMessage: '${currentUserDisplayName} laughed at \"${columnMessagesRecord.messageText}\"',
                                                                                    lastMessageTime: getCurrentTimestamp,
                                                                                    lastMessageSentBy: currentUserReference,
                                                                                  ));
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
                                                                                        columnMessagesRecord.messageLaughedBy.length.toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            if (columnMessagesRecord.messageLaughedBy.contains(currentUserReference))
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  HapticFeedback.lightImpact();
                                                                                  if (columnMessagesRecord.messageLaughedBy.contains(currentUserReference) == true) {
                                                                                    await columnMessagesRecord.reference.update({
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'messageLaughedBy': FieldValue.arrayRemove([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                          'personReactingList': FieldValue.arrayRemove([
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
                                                                                        columnMessagesRecord.messageLaughedBy.length.toString(),
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
                                                    if (columnMessagesRecord
                                                        .personReactingList
                                                        .contains(
                                                            currentUserReference))
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    6.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Text(
                                                          dateTimeFormat(
                                                            'relative',
                                                            columnMessagesRecord
                                                                .timeSent!,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
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
                                                                fontSize: 10.0,
                                                              ),
                                                        ),
                                                      ),
                                                    if (columnMessagesRecord
                                                            .prayerRequest !=
                                                        null)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: StreamBuilder<
                                                            PrayerRequestsRecord>(
                                                          stream: PrayerRequestsRecord
                                                              .getDocument(
                                                                  columnMessagesRecord
                                                                      .prayerRequest!),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 75.0,
                                                                  height: 75.0,
                                                                  child:
                                                                      SpinKitRipple(
                                                                    color: Color(
                                                                        0xFF7F95AD),
                                                                    size: 75.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final containerPrayerRequestsRecord =
                                                                snapshot.data!;
                                                            return Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.8,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child:
                                                                  CommunityPrayerRequestChatWidget(
                                                                key: Key(
                                                                    'Keymtj_${columnIndex}_of_${columnMessagesRecordList.length}'),
                                                                chosenPrayerRequestDoc:
                                                                    containerPrayerRequestsRecord,
                                                                chosenPrayerRequestRef:
                                                                    columnMessagesRecord
                                                                        .prayerRequest!,
                                                              ),
                                                            );
                                                          },
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
                            }),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 1.00),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 6.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  StreamBuilder<List<ChatPollRecord>>(
                                    stream: queryChatPollRecord(
                                      queryBuilder: (chatPollRecord) =>
                                          chatPollRecord
                                              .where(
                                                'chatReference',
                                                isEqualTo: widget
                                                    .chatChosen?.reference,
                                              )
                                              .orderBy('timeCreated',
                                                  descending: true),
                                      singleRecord: true,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 40.0,
                                            height: 40.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<ChatPollRecord>
                                          containerChatPollRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final containerChatPollRecord =
                                          containerChatPollRecordList.isNotEmpty
                                              ? containerChatPollRecordList
                                                  .first
                                              : null;
                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Visibility(
                                          visible: !containerChatPollRecord!
                                                  .usersVoted
                                                  .contains(
                                                      currentUserReference) &&
                                              !FFAppState()
                                                  .messageOptionsVisible,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '9wdkqszi' /* New Poll! */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .worshipRing,
                                                      ),
                                            ).animateOnPageLoad(animationsMap[
                                                'textOnPageLoadAnimation1']!),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  StreamBuilder<List<ChatEventRecord>>(
                                    stream: queryChatEventRecord(
                                      queryBuilder: (chatEventRecord) =>
                                          chatEventRecord
                                              .where(
                                                'chatReference',
                                                isEqualTo: widget
                                                    .chatChosen?.reference,
                                              )
                                              .orderBy('timeCreated',
                                                  descending: true),
                                      singleRecord: true,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 40.0,
                                            height: 40.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<ChatEventRecord>
                                          containerChatEventRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final containerChatEventRecord =
                                          containerChatEventRecordList
                                                  .isNotEmpty
                                              ? containerChatEventRecordList
                                                  .first
                                              : null;
                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Visibility(
                                          visible: !containerChatEventRecord!
                                                  .peopleVoted
                                                  .contains(
                                                      currentUserReference) &&
                                              !FFAppState()
                                                  .messageOptionsVisible,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'lr900nd7' /* New Event! */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .worshipRing,
                                                      ),
                                            ).animateOnPageLoad(animationsMap[
                                                'textOnPageLoadAnimation2']!),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.95,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.95,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondarySystemBackground,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 2.0, 8.0, 2.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (FFAppState().pdfAdded)
                                              Container(
                                                width: double.infinity,
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -0.98),
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.95, 0.00),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    6.0,
                                                                    0.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowPdfViewer(
                                                          networkPath: _model
                                                              .uploadedFileUrl4,
                                                          width: 120.0,
                                                          height: 150.0,
                                                          horizontalScroll:
                                                              false,
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.93, 0.00),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 21.0,
                                                          height: 21.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.00, 0.00),
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
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .pdfAdded =
                                                                      false;
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .cancel_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .worshipRing,
                                                                size: 20.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if (FFAppState().photoAdded)
                                              Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 6.0,
                                                                0.0, 6.0),
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
                                                                imageUrl: _model
                                                                    .uploadedFileUrl2,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: _model
                                                                  .uploadedFileUrl2,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: _model
                                                            .uploadedFileUrl2,
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
                                                            imageUrl: _model
                                                                .uploadedFileUrl2,
                                                            width:
                                                                double.infinity,
                                                            height: 125.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.98, 0.00),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 21.0,
                                                        height: 21.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
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
                                                            onTap: () async {
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .photoAdded =
                                                                    false;
                                                              });
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .cancel_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .worshipRing,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            if (() {
                                              if (FFAppState().photoAdded) {
                                                return true;
                                              } else if (FFAppState()
                                                  .pdfAdded) {
                                                return true;
                                              } else {
                                                return false;
                                              }
                                            }())
                                              Divider(
                                                thickness: 0.1,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lightSecondaryText,
                                              ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                if (FFAppState().replying)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          StreamBuilder<
                                                              MessagesRecord>(
                                                        stream: MessagesRecord
                                                            .getDocument(
                                                                currentUserDocument!
                                                                    .messageReplyingTo!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 75.0,
                                                                height: 75.0,
                                                                child:
                                                                    SpinKitRipple(
                                                                  color: Color(
                                                                      0xFF7F95AD),
                                                                  size: 75.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final containerMessagesRecord =
                                                              snapshot.data!;
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x1C000000),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          5.0,
                                                                          8.0,
                                                                          5.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SvgPicture
                                                                      .asset(
                                                                    'assets/images/arrow-bend-up-right.svg',
                                                                    width: 30.0,
                                                                    height:
                                                                        30.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            containerMessagesRecord.userName,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  fontSize: 12.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        if (containerMessagesRecord.messageText !=
                                                                                null &&
                                                                            containerMessagesRecord.messageText !=
                                                                                '')
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              containerMessagesRecord.messageText.maybeHandleOverflow(
                                                                                maxChars: 30,
                                                                                replacement: '…',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                    fontSize: 12.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        if (containerMessagesRecord.prayerText !=
                                                                                null &&
                                                                            containerMessagesRecord.prayerText !=
                                                                                '')
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              containerMessagesRecord.prayerText.maybeHandleOverflow(
                                                                                maxChars: 30,
                                                                                replacement: '…',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                    fontSize: 12.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
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
                                                                      setState(
                                                                          () {
                                                                        FFAppState().replying =
                                                                            false;
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          25.0,
                                                                      height:
                                                                          25.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .transparent,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.00,
                                                                            -1.00),
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
                                                                            setState(() {
                                                                              FFAppState().replying = false;
                                                                            });
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.cancel_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                18.0,
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
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          if (!FFAppState()
                                                              .messageOptionsVisible)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
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
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                            .messageOptionsVisible =
                                                                        true;
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 26.0,
                                                                  height: 26.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .systemGray5,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.00,
                                                                          0.00),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.00,
                                                                            0.00),
                                                                    child: Icon(
                                                                      Icons
                                                                          .add_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      size:
                                                                          25.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          if (FFAppState()
                                                              .messageOptionsVisible)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
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
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                            .messageOptionsVisible =
                                                                        false;
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 28.0,
                                                                  height: 28.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .systemGray5,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.00,
                                                                          0.00),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.00,
                                                                            0.00),
                                                                    child:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .chevronDown,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      size:
                                                                          18.0,
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
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextFormField(
                                                        controller: _model
                                                            .textFieldTextController,
                                                        focusNode: _model
                                                            .textFieldTextFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldTextController',
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
                                                          hintText:
                                                              valueOrDefault<
                                                                  String>(
                                                            widget.chatChosen!.users
                                                                        .length >
                                                                    2
                                                                ? 'Message ${valueOrDefault<String>(
                                                                    widget
                                                                        .chatChosen
                                                                        ?.groupName,
                                                                    'Group',
                                                                  )}...'
                                                                : 'Message...',
                                                            'Message...',
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
                                                                    fontSize:
                                                                        16.0,
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
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
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
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
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
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
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
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                        ),
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .label,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 15.0,
                                                        ),
                                                        maxLines: 8,
                                                        minLines: 1,
                                                        validator: _model
                                                            .textFieldTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    if (!((_model.textFieldTextController
                                                                    .text !=
                                                                null &&
                                                            _model.textFieldTextController
                                                                    .text !=
                                                                '') ||
                                                        FFAppState()
                                                            .photoAdded ||
                                                        FFAppState().pdfAdded))
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
                                                                      0.00,
                                                                      0.00),
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
                                                    if ((_model.textFieldTextController
                                                                    .text !=
                                                                null &&
                                                            _model.textFieldTextController
                                                                    .text !=
                                                                '') ||
                                                        FFAppState()
                                                            .photoAdded ||
                                                        FFAppState().pdfAdded)
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
                                                          _model.scanResults5 =
                                                              await actions
                                                                  .scanLanguage(
                                                            _model
                                                                .textFieldTextController
                                                                .text,
                                                          );
                                                          if (_model
                                                              .scanResults5!) {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              barrierColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .opagueSeparator,
                                                              context: context,
                                                              builder:
                                                                  (context) {
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
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        LanguageReportWidget(),
                                                                  ),
                                                                ));
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          } else {
                                                            _model.linkChecked =
                                                                await actions
                                                                    .scanMessageForLink(
                                                              _model
                                                                  .textFieldTextController
                                                                  .text,
                                                            );
                                                            if (_model.linkChecked !=
                                                                    null &&
                                                                _model.linkChecked !=
                                                                    '') {
                                                              if (_model.textFieldTextController
                                                                          .text !=
                                                                      null &&
                                                                  _model.textFieldTextController
                                                                          .text !=
                                                                      '') {
                                                                if (_model
                                                                    .resetDate!) {
                                                                  if (FFAppState()
                                                                          .photoAdded ||
                                                                      FFAppState()
                                                                          .pdfAdded) {
                                                                    if (FFAppState()
                                                                        .replying) {
                                                                      await MessagesRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              createMessagesRecordData(
                                                                            timeSent:
                                                                                getCurrentTimestamp,
                                                                            user:
                                                                                currentUserReference,
                                                                            chatReference:
                                                                                widget.chatChosen?.reference,
                                                                            textImagePath: FFAppState().photoAdded
                                                                                ? _model.uploadedFileUrl2
                                                                                : null,
                                                                            userName:
                                                                                currentUserDisplayName,
                                                                            pdfImage: FFAppState().pdfAdded
                                                                                ? _model.uploadedFileUrl4
                                                                                : null,
                                                                            messageReplyingto:
                                                                                currentUserDocument?.messageReplyingTo,
                                                                            hasReply:
                                                                                true,
                                                                            messageText:
                                                                                _model.textFieldTextController.text,
                                                                            dateReset:
                                                                                getCurrentTimestamp,
                                                                            dateResetMessage:
                                                                                true,
                                                                            link:
                                                                                _model.linkChecked,
                                                                          ));
                                                                    } else {
                                                                      await MessagesRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              createMessagesRecordData(
                                                                            timeSent:
                                                                                getCurrentTimestamp,
                                                                            user:
                                                                                currentUserReference,
                                                                            chatReference:
                                                                                widget.chatChosen?.reference,
                                                                            textImagePath: FFAppState().photoAdded
                                                                                ? _model.uploadedFileUrl2
                                                                                : null,
                                                                            userName:
                                                                                currentUserDisplayName,
                                                                            pdfImage: FFAppState().pdfAdded
                                                                                ? _model.uploadedFileUrl4
                                                                                : null,
                                                                            messageText:
                                                                                _model.textFieldTextController.text,
                                                                            dateReset:
                                                                                getCurrentTimestamp,
                                                                            dateResetMessage:
                                                                                true,
                                                                            link:
                                                                                _model.linkChecked,
                                                                          ));
                                                                    }
                                                                  } else {
                                                                    if (FFAppState()
                                                                        .replying) {
                                                                      await MessagesRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              createMessagesRecordData(
                                                                            messageText:
                                                                                _model.textFieldTextController.text,
                                                                            timeSent:
                                                                                getCurrentTimestamp,
                                                                            user:
                                                                                currentUserReference,
                                                                            chatReference:
                                                                                widget.chatChosen?.reference,
                                                                            userName:
                                                                                currentUserDisplayName,
                                                                            messageReplyingto:
                                                                                currentUserDocument?.messageReplyingTo,
                                                                            hasReply:
                                                                                true,
                                                                            dateReset:
                                                                                getCurrentTimestamp,
                                                                            dateResetMessage:
                                                                                true,
                                                                            link:
                                                                                _model.linkChecked,
                                                                          ));
                                                                    } else {
                                                                      await MessagesRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              createMessagesRecordData(
                                                                            messageText:
                                                                                _model.textFieldTextController.text,
                                                                            timeSent:
                                                                                getCurrentTimestamp,
                                                                            user:
                                                                                currentUserReference,
                                                                            chatReference:
                                                                                widget.chatChosen?.reference,
                                                                            userName:
                                                                                currentUserDisplayName,
                                                                            dateReset:
                                                                                getCurrentTimestamp,
                                                                            dateResetMessage:
                                                                                true,
                                                                            link:
                                                                                _model.linkChecked,
                                                                          ));
                                                                    }
                                                                  }
                                                                } else {
                                                                  if (FFAppState()
                                                                          .photoAdded ||
                                                                      FFAppState()
                                                                          .pdfAdded) {
                                                                    if (FFAppState()
                                                                        .replying) {
                                                                      await MessagesRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              createMessagesRecordData(
                                                                            timeSent:
                                                                                getCurrentTimestamp,
                                                                            user:
                                                                                currentUserReference,
                                                                            chatReference:
                                                                                widget.chatChosen?.reference,
                                                                            textImagePath: FFAppState().photoAdded
                                                                                ? _model.uploadedFileUrl2
                                                                                : null,
                                                                            userName:
                                                                                currentUserDisplayName,
                                                                            pdfImage: FFAppState().pdfAdded
                                                                                ? _model.uploadedFileUrl4
                                                                                : null,
                                                                            messageReplyingto:
                                                                                currentUserDocument?.messageReplyingTo,
                                                                            hasReply:
                                                                                true,
                                                                            messageText:
                                                                                _model.textFieldTextController.text,
                                                                            link:
                                                                                _model.linkChecked,
                                                                          ));
                                                                    } else {
                                                                      await MessagesRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              createMessagesRecordData(
                                                                            timeSent:
                                                                                getCurrentTimestamp,
                                                                            user:
                                                                                currentUserReference,
                                                                            chatReference:
                                                                                widget.chatChosen?.reference,
                                                                            textImagePath: FFAppState().photoAdded
                                                                                ? _model.uploadedFileUrl2
                                                                                : null,
                                                                            userName:
                                                                                currentUserDisplayName,
                                                                            pdfImage: FFAppState().pdfAdded
                                                                                ? _model.uploadedFileUrl4
                                                                                : null,
                                                                            messageText:
                                                                                _model.textFieldTextController.text,
                                                                            link:
                                                                                _model.linkChecked,
                                                                          ));
                                                                    }
                                                                  } else {
                                                                    if (FFAppState()
                                                                        .replying) {
                                                                      await MessagesRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              createMessagesRecordData(
                                                                            messageText:
                                                                                _model.textFieldTextController.text,
                                                                            timeSent:
                                                                                getCurrentTimestamp,
                                                                            user:
                                                                                currentUserReference,
                                                                            chatReference:
                                                                                widget.chatChosen?.reference,
                                                                            userName:
                                                                                currentUserDisplayName,
                                                                            messageReplyingto:
                                                                                currentUserDocument?.messageReplyingTo,
                                                                            hasReply:
                                                                                true,
                                                                            link:
                                                                                _model.linkChecked,
                                                                          ));
                                                                    } else {
                                                                      await MessagesRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              createMessagesRecordData(
                                                                            messageText:
                                                                                _model.textFieldTextController.text,
                                                                            timeSent:
                                                                                getCurrentTimestamp,
                                                                            user:
                                                                                currentUserReference,
                                                                            chatReference:
                                                                                widget.chatChosen?.reference,
                                                                            userName:
                                                                                currentUserDisplayName,
                                                                            link:
                                                                                _model.linkChecked,
                                                                          ));
                                                                    }
                                                                  }
                                                                }
                                                              } else {
                                                                if (FFAppState()
                                                                    .photoAdded) {
                                                                  if (!FFAppState()
                                                                      .replying) {
                                                                    await MessagesRecord
                                                                        .collection
                                                                        .doc()
                                                                        .set(
                                                                            createMessagesRecordData(
                                                                          timeSent:
                                                                              getCurrentTimestamp,
                                                                          user:
                                                                              currentUserReference,
                                                                          chatReference: widget
                                                                              .chatChosen
                                                                              ?.reference,
                                                                          textImagePath: FFAppState().photoAdded
                                                                              ? _model.uploadedFileUrl2
                                                                              : null,
                                                                          userName:
                                                                              currentUserDisplayName,
                                                                        ));
                                                                  } else {
                                                                    await MessagesRecord
                                                                        .collection
                                                                        .doc()
                                                                        .set(
                                                                            createMessagesRecordData(
                                                                          timeSent:
                                                                              getCurrentTimestamp,
                                                                          user:
                                                                              currentUserReference,
                                                                          chatReference: widget
                                                                              .chatChosen
                                                                              ?.reference,
                                                                          textImagePath: FFAppState().photoAdded
                                                                              ? _model.uploadedFileUrl2
                                                                              : null,
                                                                          userName:
                                                                              currentUserDisplayName,
                                                                          messageReplyingto:
                                                                              currentUserDocument?.messageReplyingTo,
                                                                          hasReply:
                                                                              true,
                                                                        ));
                                                                  }
                                                                }
                                                                if (FFAppState()
                                                                    .pdfAdded) {
                                                                  if (!FFAppState()
                                                                      .replying) {
                                                                    await MessagesRecord
                                                                        .collection
                                                                        .doc()
                                                                        .set(
                                                                            createMessagesRecordData(
                                                                          timeSent:
                                                                              getCurrentTimestamp,
                                                                          user:
                                                                              currentUserReference,
                                                                          chatReference: widget
                                                                              .chatChosen
                                                                              ?.reference,
                                                                          userName:
                                                                              currentUserDisplayName,
                                                                          pdfImage: FFAppState().pdfAdded
                                                                              ? _model.uploadedFileUrl4
                                                                              : null,
                                                                        ));
                                                                  } else {
                                                                    await MessagesRecord
                                                                        .collection
                                                                        .doc()
                                                                        .set(
                                                                            createMessagesRecordData(
                                                                          timeSent:
                                                                              getCurrentTimestamp,
                                                                          user:
                                                                              currentUserReference,
                                                                          chatReference: widget
                                                                              .chatChosen
                                                                              ?.reference,
                                                                          userName:
                                                                              currentUserDisplayName,
                                                                          pdfImage: FFAppState().pdfAdded
                                                                              ? _model.uploadedFileUrl4
                                                                              : null,
                                                                          messageReplyingto:
                                                                              currentUserDocument?.messageReplyingTo,
                                                                          hasReply:
                                                                              true,
                                                                        ));
                                                                  }
                                                                }
                                                              }
                                                            } else {
                                                              if (_model.textFieldTextController
                                                                          .text !=
                                                                      null &&
                                                                  _model.textFieldTextController
                                                                          .text !=
                                                                      '') {
                                                                if (_model
                                                                    .resetDate!) {
                                                                  if (FFAppState()
                                                                          .photoAdded ||
                                                                      FFAppState()
                                                                          .pdfAdded) {
                                                                    if (FFAppState()
                                                                        .replying) {
                                                                      await MessagesRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              createMessagesRecordData(
                                                                            timeSent:
                                                                                getCurrentTimestamp,
                                                                            user:
                                                                                currentUserReference,
                                                                            chatReference:
                                                                                widget.chatChosen?.reference,
                                                                            textImagePath: FFAppState().photoAdded
                                                                                ? _model.uploadedFileUrl2
                                                                                : null,
                                                                            userName:
                                                                                currentUserDisplayName,
                                                                            pdfImage: FFAppState().pdfAdded
                                                                                ? _model.uploadedFileUrl4
                                                                                : null,
                                                                            messageReplyingto:
                                                                                currentUserDocument?.messageReplyingTo,
                                                                            hasReply:
                                                                                true,
                                                                            messageText:
                                                                                _model.textFieldTextController.text,
                                                                            dateReset:
                                                                                getCurrentTimestamp,
                                                                            dateResetMessage:
                                                                                true,
                                                                          ));
                                                                    } else {
                                                                      await MessagesRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              createMessagesRecordData(
                                                                            timeSent:
                                                                                getCurrentTimestamp,
                                                                            user:
                                                                                currentUserReference,
                                                                            chatReference:
                                                                                widget.chatChosen?.reference,
                                                                            textImagePath: FFAppState().photoAdded
                                                                                ? _model.uploadedFileUrl2
                                                                                : null,
                                                                            userName:
                                                                                currentUserDisplayName,
                                                                            pdfImage: FFAppState().pdfAdded
                                                                                ? _model.uploadedFileUrl4
                                                                                : null,
                                                                            messageText:
                                                                                _model.textFieldTextController.text,
                                                                            dateReset:
                                                                                getCurrentTimestamp,
                                                                            dateResetMessage:
                                                                                true,
                                                                          ));
                                                                    }
                                                                  } else {
                                                                    if (FFAppState()
                                                                        .replying) {
                                                                      await MessagesRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              createMessagesRecordData(
                                                                            messageText:
                                                                                _model.textFieldTextController.text,
                                                                            timeSent:
                                                                                getCurrentTimestamp,
                                                                            user:
                                                                                currentUserReference,
                                                                            chatReference:
                                                                                widget.chatChosen?.reference,
                                                                            userName:
                                                                                currentUserDisplayName,
                                                                            messageReplyingto:
                                                                                currentUserDocument?.messageReplyingTo,
                                                                            hasReply:
                                                                                true,
                                                                            dateReset:
                                                                                getCurrentTimestamp,
                                                                            dateResetMessage:
                                                                                true,
                                                                          ));
                                                                    } else {
                                                                      await MessagesRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              createMessagesRecordData(
                                                                            messageText:
                                                                                _model.textFieldTextController.text,
                                                                            timeSent:
                                                                                getCurrentTimestamp,
                                                                            user:
                                                                                currentUserReference,
                                                                            chatReference:
                                                                                widget.chatChosen?.reference,
                                                                            userName:
                                                                                currentUserDisplayName,
                                                                            dateReset:
                                                                                getCurrentTimestamp,
                                                                            dateResetMessage:
                                                                                true,
                                                                          ));
                                                                    }
                                                                  }
                                                                } else {
                                                                  if (FFAppState()
                                                                          .photoAdded ||
                                                                      FFAppState()
                                                                          .pdfAdded) {
                                                                    if (FFAppState()
                                                                        .replying) {
                                                                      await MessagesRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              createMessagesRecordData(
                                                                            timeSent:
                                                                                getCurrentTimestamp,
                                                                            user:
                                                                                currentUserReference,
                                                                            chatReference:
                                                                                widget.chatChosen?.reference,
                                                                            textImagePath: FFAppState().photoAdded
                                                                                ? _model.uploadedFileUrl2
                                                                                : null,
                                                                            userName:
                                                                                currentUserDisplayName,
                                                                            pdfImage: FFAppState().pdfAdded
                                                                                ? _model.uploadedFileUrl4
                                                                                : null,
                                                                            messageReplyingto:
                                                                                currentUserDocument?.messageReplyingTo,
                                                                            hasReply:
                                                                                true,
                                                                            messageText:
                                                                                _model.textFieldTextController.text,
                                                                          ));
                                                                    } else {
                                                                      await MessagesRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              createMessagesRecordData(
                                                                            timeSent:
                                                                                getCurrentTimestamp,
                                                                            user:
                                                                                currentUserReference,
                                                                            chatReference:
                                                                                widget.chatChosen?.reference,
                                                                            textImagePath: FFAppState().photoAdded
                                                                                ? _model.uploadedFileUrl2
                                                                                : null,
                                                                            userName:
                                                                                currentUserDisplayName,
                                                                            pdfImage: FFAppState().pdfAdded
                                                                                ? _model.uploadedFileUrl4
                                                                                : null,
                                                                            messageText:
                                                                                _model.textFieldTextController.text,
                                                                          ));
                                                                    }
                                                                  } else {
                                                                    if (FFAppState()
                                                                        .replying) {
                                                                      await MessagesRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              createMessagesRecordData(
                                                                            messageText:
                                                                                _model.textFieldTextController.text,
                                                                            timeSent:
                                                                                getCurrentTimestamp,
                                                                            user:
                                                                                currentUserReference,
                                                                            chatReference:
                                                                                widget.chatChosen?.reference,
                                                                            userName:
                                                                                currentUserDisplayName,
                                                                            messageReplyingto:
                                                                                currentUserDocument?.messageReplyingTo,
                                                                            hasReply:
                                                                                true,
                                                                          ));
                                                                    } else {
                                                                      await MessagesRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              createMessagesRecordData(
                                                                            messageText:
                                                                                _model.textFieldTextController.text,
                                                                            timeSent:
                                                                                getCurrentTimestamp,
                                                                            user:
                                                                                currentUserReference,
                                                                            chatReference:
                                                                                widget.chatChosen?.reference,
                                                                            userName:
                                                                                currentUserDisplayName,
                                                                          ));
                                                                    }
                                                                  }
                                                                }
                                                              } else {
                                                                if (FFAppState()
                                                                    .photoAdded) {
                                                                  if (!FFAppState()
                                                                      .replying) {
                                                                    await MessagesRecord
                                                                        .collection
                                                                        .doc()
                                                                        .set(
                                                                            createMessagesRecordData(
                                                                          timeSent:
                                                                              getCurrentTimestamp,
                                                                          user:
                                                                              currentUserReference,
                                                                          chatReference: widget
                                                                              .chatChosen
                                                                              ?.reference,
                                                                          textImagePath: FFAppState().photoAdded
                                                                              ? _model.uploadedFileUrl2
                                                                              : null,
                                                                          userName:
                                                                              currentUserDisplayName,
                                                                        ));
                                                                  } else {
                                                                    await MessagesRecord
                                                                        .collection
                                                                        .doc()
                                                                        .set(
                                                                            createMessagesRecordData(
                                                                          timeSent:
                                                                              getCurrentTimestamp,
                                                                          user:
                                                                              currentUserReference,
                                                                          chatReference: widget
                                                                              .chatChosen
                                                                              ?.reference,
                                                                          textImagePath: FFAppState().photoAdded
                                                                              ? _model.uploadedFileUrl2
                                                                              : null,
                                                                          userName:
                                                                              currentUserDisplayName,
                                                                          messageReplyingto:
                                                                              currentUserDocument?.messageReplyingTo,
                                                                          hasReply:
                                                                              true,
                                                                        ));
                                                                  }
                                                                }
                                                                if (FFAppState()
                                                                    .pdfAdded) {
                                                                  if (!FFAppState()
                                                                      .replying) {
                                                                    await MessagesRecord
                                                                        .collection
                                                                        .doc()
                                                                        .set(
                                                                            createMessagesRecordData(
                                                                          timeSent:
                                                                              getCurrentTimestamp,
                                                                          user:
                                                                              currentUserReference,
                                                                          chatReference: widget
                                                                              .chatChosen
                                                                              ?.reference,
                                                                          userName:
                                                                              currentUserDisplayName,
                                                                          pdfImage: FFAppState().pdfAdded
                                                                              ? _model.uploadedFileUrl4
                                                                              : null,
                                                                        ));
                                                                  } else {
                                                                    await MessagesRecord
                                                                        .collection
                                                                        .doc()
                                                                        .set(
                                                                            createMessagesRecordData(
                                                                          timeSent:
                                                                              getCurrentTimestamp,
                                                                          user:
                                                                              currentUserReference,
                                                                          chatReference: widget
                                                                              .chatChosen
                                                                              ?.reference,
                                                                          userName:
                                                                              currentUserDisplayName,
                                                                          pdfImage: FFAppState().pdfAdded
                                                                              ? _model.uploadedFileUrl4
                                                                              : null,
                                                                          messageReplyingto:
                                                                              currentUserDocument?.messageReplyingTo,
                                                                          hasReply:
                                                                              true,
                                                                        ));
                                                                  }
                                                                }
                                                              }
                                                            }

                                                            await widget
                                                                .chatChosen!
                                                                .reference
                                                                .update({
                                                              ...createMessageChatsRecordData(
                                                                lastMessage:
                                                                    () {
                                                                  if (FFAppState()
                                                                      .pdfAdded) {
                                                                    return 'PDF File';
                                                                  } else if (FFAppState()
                                                                      .photoAdded) {
                                                                    return 'Image';
                                                                  } else {
                                                                    return _model
                                                                        .textFieldTextController
                                                                        .text;
                                                                  }
                                                                }(),
                                                                lastMessageTime:
                                                                    getCurrentTimestamp,
                                                                lastMessageSentByName:
                                                                    currentUserDisplayName,
                                                                lastMessageSentBy:
                                                                    currentUserReference,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'users':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    currentUserReference
                                                                  ]),
                                                                  'userswithIndicator': widget
                                                                      .chatChosen
                                                                      ?.users
                                                                      ?.where((e) =>
                                                                          e !=
                                                                          currentUserReference)
                                                                      .toList(),
                                                                },
                                                              ),
                                                            });
                                                            triggerPushNotification(
                                                              notificationTitle:
                                                                  valueOrDefault<
                                                                      String>(
                                                                widget
                                                                    .chatChosen
                                                                    ?.groupName,
                                                                'New Message',
                                                              ),
                                                              notificationText:
                                                                  () {
                                                                if (FFAppState()
                                                                    .pdfAdded) {
                                                                  return 'PDF File';
                                                                } else if (FFAppState()
                                                                    .photoAdded) {
                                                                  return 'Image';
                                                                } else {
                                                                  return '${currentUserDisplayName}: ${_model.textFieldTextController.text}';
                                                                }
                                                              }(),
                                                              notificationImageUrl:
                                                                  widget
                                                                      .chatChosen
                                                                      ?.groupBackground,
                                                              userRefs: widget
                                                                  .chatChosen!
                                                                  .userswithNotificationsOn
                                                                  .where((e) =>
                                                                      e !=
                                                                      currentUserReference)
                                                                  .toList(),
                                                              initialPageName:
                                                                  'ChatPage',
                                                              parameterData: {
                                                                'chatChosen': widget
                                                                    .chatChosen,
                                                                'chatUsers': widget
                                                                    .chatUsers,
                                                                'otherUserDoc':
                                                                    widget
                                                                        .otherUserDoc,
                                                                'otherUserRef':
                                                                    widget
                                                                        .otherUserRef,
                                                              },
                                                            );
                                                            setState(() {
                                                              _model
                                                                  .textFieldTextController
                                                                  ?.clear();
                                                            });
                                                            _model
                                                                .timerController
                                                                .onStartTimer();
                                                            setState(() {
                                                              _model.resetDate =
                                                                  false;
                                                            });
                                                          }

                                                          setState(() {});
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
                                                                        0.00,
                                                                        0.00),
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
                    ],
                  ),
                ),
              ),
              if (FFAppState().messageOptionsVisible)
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 10.0, 10.0),
                                child: Container(
                                  width: 45.0,
                                  height: 45.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        maxWidth: 1000.00,
                                        maxHeight: 800.00,
                                        allowPhoto: true,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondarySystemBackground,
                                        textColor:
                                            FlutterFlowTheme.of(context).label,
                                        pickerFontFamily: 'Montserrat',
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading1 = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          showUploadMessage(
                                            context,
                                            'Uploading file...',
                                            showLoading: true,
                                          );
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();

                                          downloadUrls = (await Future.wait(
                                            selectedMedia.map(
                                              (m) async => await uploadData(
                                                  m.storagePath, m.bytes),
                                            ),
                                          ))
                                              .where((u) => u != null)
                                              .map((u) => u!)
                                              .toList();
                                        } finally {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          _model.isDataUploading1 = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedMedia.length &&
                                            downloadUrls.length ==
                                                selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile1 =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl1 =
                                                downloadUrls.first;
                                          });
                                          showUploadMessage(
                                              context, 'Success!');
                                        } else {
                                          setState(() {});
                                          showUploadMessage(
                                              context, 'Failed to upload data');
                                          return;
                                        }
                                      }

                                      _model.timerUpload1Controller
                                          .onStartTimer();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondarySystemBackground,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 10.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                final selectedMedia =
                                                    await selectMediaWithSourceBottomSheet(
                                                  context: context,
                                                  maxWidth: 1000.00,
                                                  maxHeight: 800.00,
                                                  allowPhoto: true,
                                                  backgroundColor: FlutterFlowTheme
                                                          .of(context)
                                                      .secondarySystemBackground,
                                                  textColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .label,
                                                  pickerFontFamily:
                                                      'Montserrat',
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  setState(() => _model
                                                      .isDataUploading2 = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  var downloadUrls = <String>[];
                                                  try {
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                ))
                                                            .toList();

                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    _model.isDataUploading2 =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                    setState(() {
                                                      _model.uploadedLocalFile2 =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl2 =
                                                          downloadUrls.first;
                                                    });
                                                  } else {
                                                    setState(() {});
                                                    return;
                                                  }
                                                }

                                                _model.timerUpload1Controller
                                                    .onStartTimer();
                                              },
                                              child: Icon(
                                                Icons.photo_camera,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 25.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation7']!),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 10.0, 10.0),
                                child: Container(
                                  width: 45.0,
                                  height: 45.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      final selectedFiles = await selectFiles(
                                        allowedExtensions: ['pdf'],
                                        multiFile: false,
                                      );
                                      if (selectedFiles != null) {
                                        setState(() =>
                                            _model.isDataUploading3 = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          showUploadMessage(
                                            context,
                                            'Uploading file...',
                                            showLoading: true,
                                          );
                                          selectedUploadedFiles = selectedFiles
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                  ))
                                              .toList();

                                          downloadUrls = (await Future.wait(
                                            selectedFiles.map(
                                              (f) async => await uploadData(
                                                  f.storagePath, f.bytes),
                                            ),
                                          ))
                                              .where((u) => u != null)
                                              .map((u) => u!)
                                              .toList();
                                        } finally {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          _model.isDataUploading3 = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedFiles.length &&
                                            downloadUrls.length ==
                                                selectedFiles.length) {
                                          setState(() {
                                            _model.uploadedLocalFile3 =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl3 =
                                                downloadUrls.first;
                                          });
                                          showUploadMessage(
                                            context,
                                            'Success!',
                                          );
                                        } else {
                                          setState(() {});
                                          showUploadMessage(
                                            context,
                                            'Failed to upload file',
                                          );
                                          return;
                                        }
                                      }

                                      _model.timerUpload2Controller
                                          .onStartTimer();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondarySystemBackground,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 10.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                final selectedFiles =
                                                    await selectFiles(
                                                  allowedExtensions: ['pdf'],
                                                  multiFile: false,
                                                );
                                                if (selectedFiles != null) {
                                                  setState(() => _model
                                                      .isDataUploading4 = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  var downloadUrls = <String>[];
                                                  try {
                                                    selectedUploadedFiles =
                                                        selectedFiles
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                ))
                                                            .toList();

                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedFiles.map(
                                                        (f) async =>
                                                            await uploadData(
                                                                f.storagePath,
                                                                f.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    _model.isDataUploading4 =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedFiles
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedFiles
                                                              .length) {
                                                    setState(() {
                                                      _model.uploadedLocalFile4 =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl4 =
                                                          downloadUrls.first;
                                                    });
                                                  } else {
                                                    setState(() {});
                                                    return;
                                                  }
                                                }

                                                _model.timerUpload2Controller
                                                    .onStartTimer();
                                              },
                                              child: Icon(
                                                Icons.picture_as_pdf_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 25.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation8']!),
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor:
                                              FlutterFlowTheme.of(context)
                                                  .opagueSeparator,
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                                child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.7,
                                                  child:
                                                      ChatEventCreationWidget(
                                                    chatChosen: widget
                                                        .chatChosen?.reference,
                                                  ),
                                                ),
                                              ),
                                            ));
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        constraints: BoxConstraints(
                                          maxHeight: double.infinity,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondarySystemBackground,
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: Icon(
                                                  Icons.event_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 25.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  StreamBuilder<List<ChatEventRecord>>(
                                    stream: queryChatEventRecord(
                                      queryBuilder: (chatEventRecord) =>
                                          chatEventRecord
                                              .where(
                                                'chatReference',
                                                isEqualTo: widget
                                                    .chatChosen?.reference,
                                              )
                                              .orderBy('timeCreated',
                                                  descending: true),
                                      singleRecord: true,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 40.0,
                                            height: 40.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<ChatEventRecord>
                                          containerChatEventRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final containerChatEventRecord =
                                          containerChatEventRecordList
                                                  .isNotEmpty
                                              ? containerChatEventRecordList
                                                  .first
                                              : null;
                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: StreamBuilder<
                                              List<ChatEventRecord>>(
                                            stream: queryChatEventRecord(
                                              queryBuilder: (chatEventRecord) =>
                                                  chatEventRecord
                                                      .where(
                                                        'chatReference',
                                                        isEqualTo: widget
                                                            .chatChosen
                                                            ?.reference,
                                                      )
                                                      .orderBy('timeCreated',
                                                          descending: true),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ChatEventRecord>
                                                  progressBarChatEventRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final progressBarChatEventRecord =
                                                  progressBarChatEventRecordList
                                                          .isNotEmpty
                                                      ? progressBarChatEventRecordList
                                                          .first
                                                      : null;
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (progressBarChatEventRecord!
                                                      .peopleVoted
                                                      .contains(
                                                          currentUserReference)) {
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
                                                                ChatEventViewingWidget(
                                                              chatEvent:
                                                                  progressBarChatEventRecord,
                                                              chatEventRef:
                                                                  progressBarChatEventRecord
                                                                      ?.reference,
                                                            ),
                                                          ),
                                                        ));
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  } else {
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
                                                                ChatEventChoosingWidget(
                                                              chatEvent:
                                                                  progressBarChatEventRecord,
                                                              chatEventRef:
                                                                  progressBarChatEventRecord
                                                                      ?.reference,
                                                            ),
                                                          ),
                                                        ));
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  }
                                                },
                                                child: CircularPercentIndicator(
                                                  percent: 1.0,
                                                  radius: 22.5,
                                                  lineWidth: 3.0,
                                                  animation: false,
                                                  animateFromLastPercent: true,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .worshipRing,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'progressBarOnPageLoadAnimation1']!);
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ).animateOnPageLoad(
                                  animationsMap['stackOnPageLoadAnimation1']!),
                              Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor:
                                              FlutterFlowTheme.of(context)
                                                  .opagueSeparator,
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                                child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.9,
                                                  child: ChatPollCreationWidget(
                                                    chatChosen: widget
                                                        .chatChosen?.reference,
                                                  ),
                                                ),
                                              ),
                                            ));
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        constraints: BoxConstraints(
                                          maxHeight: double.infinity,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondarySystemBackground,
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            border: Border.all(
                                              color: Colors.transparent,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: FaIcon(
                                                  FontAwesomeIcons.poll,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 22.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  StreamBuilder<List<ChatPollRecord>>(
                                    stream: queryChatPollRecord(
                                      queryBuilder: (chatPollRecord) =>
                                          chatPollRecord
                                              .where(
                                                'chatReference',
                                                isEqualTo: widget
                                                    .chatChosen?.reference,
                                              )
                                              .orderBy('timeCreated',
                                                  descending: true),
                                      singleRecord: true,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 40.0,
                                            height: 40.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<ChatPollRecord>
                                          containerChatPollRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final containerChatPollRecord =
                                          containerChatPollRecordList.isNotEmpty
                                              ? containerChatPollRecordList
                                                  .first
                                              : null;
                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: StreamBuilder<
                                              List<ChatPollRecord>>(
                                            stream: queryChatPollRecord(
                                              queryBuilder: (chatPollRecord) =>
                                                  chatPollRecord
                                                      .where(
                                                        'chatReference',
                                                        isEqualTo: widget
                                                            .chatChosen
                                                            ?.reference,
                                                      )
                                                      .orderBy('timeCreated',
                                                          descending: true),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ChatPollRecord>
                                                  progressBarChatPollRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final progressBarChatPollRecord =
                                                  progressBarChatPollRecordList
                                                          .isNotEmpty
                                                      ? progressBarChatPollRecordList
                                                          .first
                                                      : null;
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (progressBarChatPollRecord!
                                                      .usersVoted
                                                      .contains(
                                                          currentUserReference)) {
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
                                                                CurrentPollViewingWidget(
                                                              currentPoll:
                                                                  progressBarChatPollRecord,
                                                              pollReference:
                                                                  progressBarChatPollRecord
                                                                      ?.reference,
                                                            ),
                                                          ),
                                                        ));
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  } else {
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
                                                                CurrentPollChoosingWidget(
                                                              currentPoll:
                                                                  progressBarChatPollRecord,
                                                              pollReference:
                                                                  progressBarChatPollRecord
                                                                      ?.reference,
                                                            ),
                                                          ),
                                                        ));
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  }
                                                },
                                                child: CircularPercentIndicator(
                                                  percent: 1.0,
                                                  radius: 22.5,
                                                  lineWidth: 3.0,
                                                  animation: false,
                                                  animateFromLastPercent: true,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .worshipRing,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'progressBarOnPageLoadAnimation2']!);
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ).animateOnPageLoad(
                                  animationsMap['stackOnPageLoadAnimation2']!),
                              Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor:
                                              FlutterFlowTheme.of(context)
                                                  .opagueSeparator,
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                                child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.9,
                                                  child: ChatPollCreationWidget(
                                                    chatChosen: widget
                                                        .chatChosen?.reference,
                                                  ),
                                                ),
                                              ),
                                            ));
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        constraints: BoxConstraints(
                                          maxHeight: double.infinity,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondarySystemBackground,
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            border: Border.all(
                                              color: Colors.transparent,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  HapticFeedback.lightImpact();
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
                                                          child: Container(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.75,
                                                            child:
                                                                CreatePrayerChatWidget(
                                                              chatReference: widget
                                                                  .chatChosen!
                                                                  .reference,
                                                            ),
                                                          ),
                                                        ),
                                                      ));
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Container(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
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
                                                      if (Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark)
                                                        SvgPicture.asset(
                                                          'assets/images/hands-clapping-fill_(8).svg',
                                                          width: 26.0,
                                                          height: 26.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      if (!(Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark))
                                                        SvgPicture.asset(
                                                          'assets/images/hands-clapping-fill_(7).svg',
                                                          width: 26.0,
                                                          height: 26.0,
                                                          fit: BoxFit.cover,
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
                                  ),
                                ],
                              ).animateOnPageLoad(
                                  animationsMap['stackOnPageLoadAnimation3']!),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.02,
                decoration: BoxDecoration(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
