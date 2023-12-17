import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/edit_practice_response_copy_widget.dart';
import '/components/language_report_widget.dart';
import '/components/report_concern_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
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
import 'journal_reply_page_model.dart';
export 'journal_reply_page_model.dart';

class JournalReplyPageWidget extends StatefulWidget {
  const JournalReplyPageWidget({
    Key? key,
    this.journalChosenDoc,
  }) : super(key: key);

  final PersonalJournalsRecord? journalChosenDoc;

  @override
  _JournalReplyPageWidgetState createState() => _JournalReplyPageWidgetState();
}

class _JournalReplyPageWidgetState extends State<JournalReplyPageWidget>
    with TickerProviderStateMixin {
  late JournalReplyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
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
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-25.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-25.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalReplyPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation();
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textFieldPromptController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.journalChosenDoc?.journalResponseQuestion,
      'You can enter your reflection or thougts  on this video below!',
    ));
    _model.textFieldPromptFocusNode ??= FocusNode();

    _model.expandableController1 = ExpandableController(initialExpanded: false);
    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
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

    return YoutubeFullScreenWrapper(
      child: GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary,
            ),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.07,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).systemBackground,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FlutterFlowYoutubePlayer(
                          url: widget.journalChosenDoc!.videoURL,
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          autoPlay: false,
                          looping: false,
                          mute: false,
                          showControls: true,
                          showFullScreen: true,
                        ).animateOnPageLoad(
                            animationsMap['youtubePlayerOnPageLoadAnimation']!),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.68,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (widget.journalChosenDoc
                                        ?.journalResponseQuestion !=
                                    null &&
                                widget.journalChosenDoc
                                        ?.journalResponseQuestion !=
                                    '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 10.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.95,
                                  child: TextFormField(
                                    controller:
                                        _model.textFieldPromptController,
                                    focusNode: _model.textFieldPromptFocusNode,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    readOnly: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: () {
                                        if (widget
                                            .journalChosenDoc!.journalOne) {
                                          return 'Worship Journal Prompt';
                                        } else if (widget
                                            .journalChosenDoc!.journalTwo) {
                                          return 'Scripture Journal Prompt';
                                        } else if (widget
                                            .journalChosenDoc!.journalThree) {
                                          return 'Prayer Journal Prompt';
                                        } else {
                                          return 'Journal Prompt';
                                        }
                                      }(),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .worshipRing,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .textFieldColorSecondary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondarySystemBackground,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .label,
                                        ),
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    minLines: 1,
                                    validator: _model
                                        .textFieldPromptControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'q6jl4zg0' /* Replies */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lightSecondaryText,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 12.0, 0.0),
                                              child: Container(
                                                width: 40.0,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondarySystemBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
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
                                                      Navigator.pop(context);
                                                    },
                                                    child: Icon(
                                                      Icons.close_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 15.0),
                                          child: StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                widget.journalChosenDoc!
                                                    .journalUser!),
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
                                              final containerUsersRecord =
                                                  snapshot.data!;
                                              return Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.75,
                                                constraints: BoxConstraints(
                                                  maxWidth: double.infinity,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      child: ExpandableNotifier(
                                                        controller: _model
                                                            .expandableController1,
                                                        child: ExpandablePanel(
                                                          header: Container(
                                                            width: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x00EEEEEE),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  width: 28.0,
                                                                  height: 28.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      shape: BoxShape
                                                                          .circle,
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
                                                                        context
                                                                            .pushNamed(
                                                                          'OtherUserProfile',
                                                                          queryParameters:
                                                                              {
                                                                            'selectedUser':
                                                                                serializeParam(
                                                                              containerUsersRecord,
                                                                              ParamType.Document,
                                                                            ),
                                                                            'selectedUserRef':
                                                                                serializeParam(
                                                                              containerUsersRecord.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            'selectedUser':
                                                                                containerUsersRecord,
                                                                          },
                                                                        );
                                                                      },
                                                                      child:
                                                                          Hero(
                                                                        tag: valueOrDefault<
                                                                            String>(
                                                                          containerUsersRecord
                                                                              .photoUrl,
                                                                          'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                                                                        ),
                                                                        transitionOnUserGestures:
                                                                            true,
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              25.0,
                                                                          height:
                                                                              25.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            valueOrDefault<String>(
                                                                              containerUsersRecord.photoUrl,
                                                                              'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                                                                            ),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'containerOnPageLoadAnimation1']!),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
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
                                                                          context
                                                                              .pushNamed(
                                                                            'OtherUserProfile',
                                                                            queryParameters:
                                                                                {
                                                                              'selectedUser': serializeParam(
                                                                                containerUsersRecord,
                                                                                ParamType.Document,
                                                                              ),
                                                                              'selectedUserRef': serializeParam(
                                                                                containerUsersRecord.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'selectedUser': containerUsersRecord,
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          containerUsersRecord
                                                                              .displayName,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                fontSize: 12.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            3.0,
                                                                        height:
                                                                            3.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      dateTimeFormat(
                                                                        'M/d h:mm a',
                                                                        widget
                                                                            .journalChosenDoc!
                                                                            .journalDate!,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).lightSecondaryText,
                                                                            fontSize:
                                                                                12.0,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0x00EEEEEE),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          collapsed: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        40.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              widget
                                                                  .journalChosenDoc!
                                                                  .journalText
                                                                  .maybeHandleOverflow(
                                                                maxChars: 150,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .label,
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                          expanded: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        40.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              widget
                                                                  .journalChosenDoc!
                                                                  .journalText,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .label,
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                          theme:
                                                              ExpandableThemeData(
                                                            tapHeaderToExpand:
                                                                false,
                                                            tapBodyToExpand:
                                                                true,
                                                            tapBodyToCollapse:
                                                                true,
                                                            headerAlignment:
                                                                ExpandablePanelHeaderAlignment
                                                                    .top,
                                                            hasIcon: false,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    12.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                JournalRepliesRecord>>(
                                                          stream:
                                                              queryJournalRepliesRecord(
                                                            parent: widget
                                                                .journalChosenDoc
                                                                ?.reference,
                                                            queryBuilder:
                                                                (journalRepliesRecord) =>
                                                                    journalRepliesRecord
                                                                        .orderBy(
                                                                            'timeSent'),
                                                          ),
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
                                                            List<JournalRepliesRecord>
                                                                columnJournalRepliesRecordList =
                                                                snapshot.data!;
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                  columnJournalRepliesRecordList
                                                                      .length,
                                                                  (columnIndex) {
                                                                final columnJournalRepliesRecord =
                                                                    columnJournalRepliesRecordList[
                                                                        columnIndex];
                                                                return Visibility(
                                                                  visible: !(currentUserDocument
                                                                              ?.blockedPeople
                                                                              ?.toList() ??
                                                                          [])
                                                                      .contains(
                                                                          columnJournalRepliesRecord
                                                                              .personReplying),
                                                                  child:
                                                                      AuthUserStreamWidget(
                                                                    builder:
                                                                        (context) =>
                                                                            Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            15.0),
                                                                        child: StreamBuilder<
                                                                            UsersRecord>(
                                                                          stream:
                                                                              UsersRecord.getDocument(columnJournalRepliesRecord.personReplying!),
                                                                          builder:
                                                                              (context, snapshot) {
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
                                                                            final containerUsersRecord =
                                                                                snapshot.data!;
                                                                            return Container(
                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                              constraints: BoxConstraints(
                                                                                maxWidth: double.infinity,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                              child: SingleChildScrollView(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      child: ExpandableNotifier(
                                                                                        child: ExpandablePanel(
                                                                                          header: Container(
                                                                                            width: 100.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0x00EEEEEE),
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 26.0,
                                                                                                  height: 26.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    shape: BoxShape.circle,
                                                                                                  ),
                                                                                                  child: Container(
                                                                                                    width: 40.0,
                                                                                                    height: 40.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      shape: BoxShape.circle,
                                                                                                    ),
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
                                                                                                              containerUsersRecord,
                                                                                                              ParamType.Document,
                                                                                                            ),
                                                                                                            'selectedUserRef': serializeParam(
                                                                                                              containerUsersRecord.reference,
                                                                                                              ParamType.DocumentReference,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                          extra: <String, dynamic>{
                                                                                                            'selectedUser': containerUsersRecord,
                                                                                                          },
                                                                                                        );
                                                                                                      },
                                                                                                      child: Hero(
                                                                                                        tag: valueOrDefault<String>(
                                                                                                          containerUsersRecord.photoUrl,
                                                                                                          'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg' + '$columnIndex',
                                                                                                        ),
                                                                                                        transitionOnUserGestures: true,
                                                                                                        child: Container(
                                                                                                          width: 25.0,
                                                                                                          height: 25.0,
                                                                                                          clipBehavior: Clip.antiAlias,
                                                                                                          decoration: BoxDecoration(
                                                                                                            shape: BoxShape.circle,
                                                                                                          ),
                                                                                                          child: Image.network(
                                                                                                            valueOrDefault<String>(
                                                                                                              containerUsersRecord.photoUrl,
                                                                                                              'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                                                                                                            ),
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation2']!),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
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
                                                                                                                containerUsersRecord,
                                                                                                                ParamType.Document,
                                                                                                              ),
                                                                                                              'selectedUserRef': serializeParam(
                                                                                                                containerUsersRecord.reference,
                                                                                                                ParamType.DocumentReference,
                                                                                                              ),
                                                                                                            }.withoutNulls,
                                                                                                            extra: <String, dynamic>{
                                                                                                              'selectedUser': containerUsersRecord,
                                                                                                            },
                                                                                                          );
                                                                                                        },
                                                                                                        child: Text(
                                                                                                          containerUsersRecord.displayName,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                                                fontSize: 12.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                      child: Container(
                                                                                                        width: 3.0,
                                                                                                        height: 3.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                          shape: BoxShape.circle,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      dateTimeFormat(
                                                                                                        'M/d h:mm a',
                                                                                                        columnJournalRepliesRecord.timeSent!,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            color: FlutterFlowTheme.of(context).lightSecondaryText,
                                                                                                            fontSize: 12.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0x00EEEEEE),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    if (columnJournalRepliesRecord.likedbyUser != true)
                                                                                                      InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          await columnJournalRepliesRecord.reference.update({
                                                                                                            ...createJournalRepliesRecordData(
                                                                                                              likedbyUser: true,
                                                                                                            ),
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'likedbyOthers': FieldValue.arrayUnion([currentUserReference]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                          triggerPushNotification(
                                                                                                            notificationTitle: 'New Activity',
                                                                                                            notificationText: '${currentUserDisplayName} just liked your comment!',
                                                                                                            userRefs: [
                                                                                                              columnJournalRepliesRecord.personReplying!
                                                                                                            ],
                                                                                                            initialPageName: 'HomePage',
                                                                                                            parameterData: {},
                                                                                                          );
                                                                                                        },
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            FaIcon(
                                                                                                              FontAwesomeIcons.heart,
                                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                                              size: 18.0,
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                columnJournalRepliesRecord.likedbyOthers.length.toString(),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Inter',
                                                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    if (columnJournalRepliesRecord.likedbyUser == true)
                                                                                                      InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          await columnJournalRepliesRecord.reference.update({
                                                                                                            ...createJournalRepliesRecordData(
                                                                                                              likedbyUser: false,
                                                                                                            ),
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'likedbyOthers': FieldValue.arrayRemove([currentUserReference]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                        },
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            FaIcon(
                                                                                                              FontAwesomeIcons.solidHeart,
                                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                                              size: 18.0,
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                columnJournalRepliesRecord.likedbyOthers.length.toString(),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Inter',
                                                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          collapsed: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(36.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              columnJournalRepliesRecord.responseText.maybeHandleOverflow(
                                                                                                maxChars: 150,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: FlutterFlowTheme.of(context).label,
                                                                                                    fontSize: 14.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          expanded: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(36.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              columnJournalRepliesRecord.responseText,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: FlutterFlowTheme.of(context).label,
                                                                                                    fontSize: 14.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          theme: ExpandableThemeData(
                                                                                            tapHeaderToExpand: false,
                                                                                            tapBodyToExpand: true,
                                                                                            tapBodyToCollapse: true,
                                                                                            headerAlignment: ExpandablePanelHeaderAlignment.top,
                                                                                            hasIcon: false,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(36.0, 12.0, 0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          if (valueOrDefault<bool>(currentUserDocument?.admin, false) || (columnJournalRepliesRecord.personReplying == currentUserReference))
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Container(
                                                                                                height: 25.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondarySystemBackground,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                                                    child: InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        await columnJournalRepliesRecord.reference.delete();

                                                                                                        await columnJournalRepliesRecord.parentReference.update({
                                                                                                          ...mapToFirestore(
                                                                                                            {
                                                                                                              'journalRepliesNum': FieldValue.increment(-(1)),
                                                                                                            },
                                                                                                          ),
                                                                                                        });
                                                                                                      },
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'o74hf52a' /* Delete */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                                  fontSize: 12.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if (valueOrDefault<bool>(currentUserDocument?.admin, false) || (columnJournalRepliesRecord.personReplying == currentUserReference))
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                child: InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    await showModalBottomSheet(
                                                                                                      isScrollControlled: true,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      barrierColor: Color(0x80000000),
                                                                                                      context: context,
                                                                                                      builder: (context) {
                                                                                                        return WebViewAware(
                                                                                                            child: GestureDetector(
                                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                          child: Padding(
                                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                                            child: EditPracticeResponseCopyWidget(
                                                                                                              usersReply: columnJournalRepliesRecord.reference,
                                                                                                              usersReplyDoc: columnJournalRepliesRecord,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ));
                                                                                                      },
                                                                                                    ).then((value) => safeSetState(() {}));
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    height: 25.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                    ),
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondarySystemBackground,
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'jlw7pmsk' /* Edit */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                                    fontSize: 12.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                            child: Container(
                                                                                              height: 25.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
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
                                                                                                          child: GestureDetector(
                                                                                                        onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                        child: Padding(
                                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                                          child: ReportConcernWidget(),
                                                                                                        ),
                                                                                                      ));
                                                                                                    },
                                                                                                  ).then((value) => safeSetState(() {}));
                                                                                                },
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondarySystemBackground,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Icon(
                                                                                                          Icons.outlined_flag_rounded,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          size: 18.0,
                                                                                                        ),
                                                                                                      ],
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
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.12,
                                                      decoration:
                                                          BoxDecoration(),
                                                    ),
                                                  ],
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  tablet: false,
                  tabletLandscape: false,
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
                                    sigmaX: 5.0,
                                    sigmaY: 5.0,
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
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(12.0),
                                      topRight: Radius.circular(12.0),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 6.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.95,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .secondarySystemBackground,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
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
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  8.0,
                                                                  5.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textController2,
                                                        focusNode: _model
                                                            .textFieldFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
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
                                                            'yr4eyboc' /* Your reply here... */,
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
                                                            '3ris2n5x' /* typing... */,
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
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .textFieldColorSecondary,
                                                              size: 26.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
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
                                                        var _shouldSetState =
                                                            false;
                                                        _model.scanResults4 =
                                                            await actions
                                                                .scanLanguage(
                                                          _model.textController2
                                                              .text,
                                                        );
                                                        _shouldSetState = true;
                                                        if (_model
                                                            .scanResults4!) {
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
                                                                      LanguageReportWidget(),
                                                                ),
                                                              ));
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        } else {
                                                          if (_model
                                                                  .textController2
                                                                  .text ==
                                                              '') {
                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }

                                                          await JournalRepliesRecord
                                                                  .createDoc(widget
                                                                      .journalChosenDoc!
                                                                      .reference)
                                                              .set(
                                                                  createJournalRepliesRecordData(
                                                            journalRepliedto: widget
                                                                .journalChosenDoc
                                                                ?.reference,
                                                            personReplying:
                                                                currentUserReference,
                                                            responseText: _model
                                                                .textController2
                                                                .text,
                                                            timeSent:
                                                                getCurrentTimestamp,
                                                          ));

                                                          await widget
                                                              .journalChosenDoc!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'journalRepliesNum':
                                                                    FieldValue
                                                                        .increment(
                                                                            1),
                                                              },
                                                            ),
                                                          });
                                                          setState(() {
                                                            _model
                                                                .textController2
                                                                ?.clear();
                                                          });
                                                          await actions
                                                              .dismissKeyboard();
                                                          triggerPushNotification(
                                                            notificationTitle:
                                                                'New Reply',
                                                            notificationText:
                                                                '${currentUserDisplayName} replied to your post!',
                                                            userRefs: [
                                                              widget
                                                                  .journalChosenDoc!
                                                                  .journalUser!
                                                            ],
                                                            initialPageName:
                                                                'JournalReplyPage',
                                                            parameterData: {
                                                              'journalChosenDoc':
                                                                  widget
                                                                      .journalChosenDoc,
                                                            },
                                                          );
                                                        }

                                                        if (_shouldSetState)
                                                          setState(() {});
                                                      },
                                                      child: Container(
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
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
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
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.02,
                                          decoration: BoxDecoration(),
                                        ),
                                    ],
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
      ),
    );
  }
}
