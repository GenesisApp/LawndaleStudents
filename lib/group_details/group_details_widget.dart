import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/group_edit_widget.dart';
import '/components/group_rating_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'group_details_model.dart';
export 'group_details_model.dart';

class GroupDetailsWidget extends StatefulWidget {
  const GroupDetailsWidget({
    Key? key,
    required this.chosenGroup,
  }) : super(key: key);

  final GroupsRecord? chosenGroup;

  @override
  _GroupDetailsWidgetState createState() => _GroupDetailsWidgetState();
}

class _GroupDetailsWidgetState extends State<GroupDetailsWidget>
    with TickerProviderStateMixin {
  late GroupDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
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
          begin: Offset(-15.0, 0.0),
          end: Offset(0.0, 0.0),
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
          begin: Offset(-15.0, 0.0),
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
          duration: 1400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1400.ms,
          begin: Offset(-15.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1800.ms,
          begin: Offset(-15.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GroupDetailsModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primary,
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
        final groupDetailsUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primary,
          body: Stack(
            alignment: AlignmentDirectional(0.0, 0.0),
            children: [
              Align(
                alignment: AlignmentDirectional(0.00, -1.00),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.28,
                  decoration: BoxDecoration(
                    color:
                        FlutterFlowTheme.of(context).secondarySystemBackground,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        widget.chosenGroup!.imageThumbnail,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 60.0, 12.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).opagueSeparator,
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 2.0, 0.0),
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
                                    color: Colors.white,
                                    size: 22.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: Color(0x00EEEEEE),
                              ),
                            ),
                          ),
                          if (!widget.chosenGroup!.groupLeaders
                                  .contains(currentUserReference) &&
                              (currentUserDocument?.groups?.toList() ?? [])
                                  .contains(widget.chosenGroup?.reference))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => InkWell(
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
                                            child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: GroupRatingWidget(
                                            groupChosen:
                                                widget.chosenGroup?.reference,
                                          ),
                                        ));
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .opagueSeparator,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Icon(
                                        Icons.star_rate_outlined,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (widget.chosenGroup?.groupLeaders
                                  ?.contains(currentUserReference) ??
                              true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'groupsAttendance',
                                    queryParameters: {
                                      'groupChosen': serializeParam(
                                        widget.chosenGroup,
                                        ParamType.Document,
                                      ),
                                      'groupUsers': serializeParam(
                                        widget.chosenGroup?.members,
                                        ParamType.DocumentReference,
                                        true,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'groupChosen': widget.chosenGroup,
                                    },
                                  );
                                },
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .opagueSeparator,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Icon(
                                      Icons.edit_note_rounded,
                                      color: Colors.white,
                                      size: 28.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (widget.chosenGroup?.groupLeaders
                                  ?.contains(currentUserReference) ??
                              true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: StreamBuilder<List<MessageChatsRecord>>(
                                stream: queryMessageChatsRecord(
                                  queryBuilder: (messageChatsRecord) =>
                                      messageChatsRecord.where(
                                    'sgChatRef',
                                    isEqualTo: widget.chosenGroup?.reference,
                                  ),
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
                                  List<MessageChatsRecord>
                                      containerMessageChatsRecordList =
                                      snapshot.data!;
                                  final containerMessageChatsRecord =
                                      containerMessageChatsRecordList.isNotEmpty
                                          ? containerMessageChatsRecordList
                                              .first
                                          : null;
                                  return Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'AddGroupPeople',
                                          queryParameters: {
                                            'groupChosen': serializeParam(
                                              widget.chosenGroup,
                                              ParamType.Document,
                                            ),
                                            'groupChosenRef': serializeParam(
                                              widget.chosenGroup?.reference,
                                              ParamType.DocumentReference,
                                            ),
                                            'sgChat': serializeParam(
                                              containerMessageChatsRecord
                                                  ?.reference,
                                              ParamType.DocumentReference,
                                            ),
                                            'sgChatDoc': serializeParam(
                                              containerMessageChatsRecord,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'groupChosen': widget.chosenGroup,
                                            'sgChatDoc':
                                                containerMessageChatsRecord,
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .opagueSeparator,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Icon(
                                            Icons.person_add_rounded,
                                            color: Colors.white,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          if (valueOrDefault<bool>(
                              currentUserDocument?.admin, false))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: FlutterFlowTheme.of(context)
                                          .systemGray6,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                            child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.92,
                                            child: GroupEditWidget(
                                              chosenGroup: widget.chosenGroup,
                                            ),
                                          ),
                                        ));
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .opagueSeparator,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: FaIcon(
                                        FontAwesomeIcons.ellipsisV,
                                        color: Colors.white,
                                        size: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          Builder(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await Share.share(
                                  'Check out this group: ${'lawndalestudents://lawndalestudents.com${GoRouter.of(context).location}'}',
                                  sharePositionOrigin:
                                      getWidgetBoundingBox(context),
                                );
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .opagueSeparator,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Icon(
                                    Icons.ios_share,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 75.0, 8.0, 10.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.3,
                            height: MediaQuery.sizeOf(context).width * 0.3,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              shape: BoxShape.circle,
                            ),
                            child: StreamBuilder<UsersRecord>(
                              stream: UsersRecord.getDocument(
                                  widget.chosenGroup!.groupLeaders.first),
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
                                final containerUsersRecord = snapshot.data!;
                                return Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.75,
                                  height:
                                      MediaQuery.sizeOf(context).width * 0.75,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2.0, 2.0, 2.0, 2.0),
                                    child: Container(
                                      width: 80.0,
                                      height: 80.0,
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
                                          containerUsersRecord.photoUrl,
                                          'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        if (widget.chosenGroup!.groupLeaders.length >= 2)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 75.0, 8.0, 10.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.3,
                              height: MediaQuery.sizeOf(context).width * 0.3,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                shape: BoxShape.circle,
                              ),
                              child: StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    widget.chosenGroup!.groupLeaders.last),
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
                                  final containerUsersRecord = snapshot.data!;
                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.75,
                                    height:
                                        MediaQuery.sizeOf(context).width * 0.75,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 2.0, 2.0, 2.0),
                                      child: Container(
                                        width: 80.0,
                                        height: 80.0,
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
                                            containerUsersRecord.photoUrl,
                                            'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          25.0, 12.0, 25.0, 12.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        decoration: BoxDecoration(
                          color: Color(0x00EEEEEE),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: AutoSizeText(
                                widget.chosenGroup!.videoName,
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context).label,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation1']!),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 6.0),
                              child: AutoSizeText(
                                widget.chosenGroup!.messageDescription,
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context).label,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.92,
                        height: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondarySystemBackground,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 0.0, 0.0, 0.0),
                                            child: Icon(
                                              Icons.person,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 20.0,
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.8,
                                            height: 30.0,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.00, 0.00),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child:
                                                    StreamBuilder<UsersRecord>(
                                                  stream:
                                                      UsersRecord.getDocument(
                                                          widget
                                                              .chosenGroup!
                                                              .groupLeaders
                                                              .first),
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
                                                    final textUsersRecord =
                                                        snapshot.data!;
                                                    return AutoSizeText(
                                                      'Leader: ${textUsersRecord.displayName}',
                                                      maxLines: 1,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lightSecondaryText,
                                                                fontSize: 14.0,
                                                              ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: 16.0,
                                        thickness: 0.2,
                                        indent: 42.0,
                                        color: FlutterFlowTheme.of(context)
                                            .separator,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.calendarDay,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 16.0,
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.8,
                                            height: 30.0,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.00, 0.00),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: AutoSizeText(
                                                  'Meeting time: ${widget.chosenGroup?.meetingDay} ${widget.chosenGroup?.meetingTime}',
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .lightSecondaryText,
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          StreamBuilder<List<UsersRecord>>(
                            stream: queryUsersRecord(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                'groups',
                                arrayContains: widget.chosenGroup?.reference,
                              ),
                              limit: 6,
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
                              List<UsersRecord> rowUsersRecordList =
                                  snapshot.data!;
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                    rowUsersRecordList.length, (rowIndex) {
                                  final rowUsersRecord =
                                      rowUsersRecordList[rowIndex];
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-0.98, 0.00),
                                      child: Container(
                                        width: 30.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: CachedNetworkImageProvider(
                                              valueOrDefault<String>(
                                                rowUsersRecord.photoUrl,
                                                'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                                              ),
                                            ),
                                          ),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation1']!),
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Container(
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (widget.chosenGroup!.members.length > 6)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '3hi93yhl' /* + */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                            ),
                                      ),
                                    ),
                                  if (widget.chosenGroup!.members.length > 6)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Text(
                                        valueOrDefault<String>(
                                          (widget.chosenGroup!.members.length -
                                                  6)
                                              .toString(),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                            ),
                                      ),
                                    ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'w5s4ahch' /* members */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                            ),
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation2']!),
                                    ),
                                  ),
                                ],
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation2']!),
                          ),
                        ],
                      ),
                    ),
                    if (widget.chosenGroup!.members
                            .contains(currentUserReference) ||
                        widget.chosenGroup!.groupLeaders
                            .contains(currentUserReference))
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.00, 1.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 12.0),
                            child: StreamBuilder<List<MessageChatsRecord>>(
                              stream: queryMessageChatsRecord(
                                queryBuilder: (messageChatsRecord) =>
                                    messageChatsRecord.where(
                                  'sgChatRef',
                                  isEqualTo: widget.chosenGroup?.reference,
                                ),
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
                                List<MessageChatsRecord>
                                    containerMessageChatsRecordList =
                                    snapshot.data!;
                                final containerMessageChatsRecord =
                                    containerMessageChatsRecordList.isNotEmpty
                                        ? containerMessageChatsRecordList.first
                                        : null;
                                return Container(
                                  width: double.infinity,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (containerMessageChatsRecord != null) {
                                        await containerMessageChatsRecord!
                                            .reference
                                            .update(
                                                createMessageChatsRecordData(
                                          authenticatedUser:
                                              currentUserReference,
                                          otherUser: widget
                                              .chosenGroup?.groupLeaders?.first,
                                        ));

                                        context.pushNamed(
                                          'ChatPage',
                                          queryParameters: {
                                            'chatChosen': serializeParam(
                                              containerMessageChatsRecord,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'chatChosen':
                                                containerMessageChatsRecord,
                                          },
                                        );
                                      } else {
                                        var messageChatsRecordReference =
                                            MessageChatsRecord.collection.doc();
                                        await messageChatsRecordReference.set({
                                          ...createMessageChatsRecordData(
                                            authenticatedUser:
                                                currentUserReference,
                                            archived: false,
                                            sgChatRef:
                                                widget.chosenGroup?.reference,
                                            otherUser: widget.chosenGroup
                                                ?.groupLeaders?.first,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'users':
                                                  widget.chosenGroup?.members,
                                              'userswithNotificationsOn':
                                                  widget.chosenGroup?.members,
                                            },
                                          ),
                                        });
                                        _model.newGroup4 = MessageChatsRecord
                                            .getDocumentFromData({
                                          ...createMessageChatsRecordData(
                                            authenticatedUser:
                                                currentUserReference,
                                            archived: false,
                                            sgChatRef:
                                                widget.chosenGroup?.reference,
                                            otherUser: widget.chosenGroup
                                                ?.groupLeaders?.first,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'users':
                                                  widget.chosenGroup?.members,
                                              'userswithNotificationsOn':
                                                  widget.chosenGroup?.members,
                                            },
                                          ),
                                        }, messageChatsRecordReference);
                                        if (Navigator.of(context).canPop()) {
                                          context.pop();
                                        }
                                        context.pushNamed(
                                          'ChatPage',
                                          queryParameters: {
                                            'chatChosen': serializeParam(
                                              _model.newGroup4,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'chatChosen': _model.newGroup4,
                                          },
                                        );
                                      }

                                      setState(() {});
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'si17wspc' /* Go to Group Chat */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: Color(0xFFFEFDEC),
                                                fontSize: 16.0,
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
                    if (!widget.chosenGroup!.members
                            .contains(currentUserReference) &&
                        !widget.chosenGroup!.groupLeaders
                            .contains(currentUserReference))
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.00, 1.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 12.0),
                            child: StreamBuilder<UsersRecord>(
                              stream: UsersRecord.getDocument(
                                  widget.chosenGroup!.groupLeaders.first),
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
                                final containerUsersRecord = snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      var messageChatsRecordReference =
                                          MessageChatsRecord.collection.doc();
                                      await messageChatsRecordReference.set({
                                        ...createMessageChatsRecordData(
                                          authenticatedUser:
                                              currentUserReference,
                                          otherUser: widget
                                              .chosenGroup?.groupLeaders?.first,
                                          archived: false,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'users': [
                                              widget.chosenGroup?.groupLeaders
                                                  ?.first
                                            ],
                                            'userswithNotificationsOn': [
                                              widget.chosenGroup?.groupLeaders
                                                  ?.first
                                            ],
                                          },
                                        ),
                                      });
                                      _model.newGroup1 = MessageChatsRecord
                                          .getDocumentFromData({
                                        ...createMessageChatsRecordData(
                                          authenticatedUser:
                                              currentUserReference,
                                          otherUser: widget
                                              .chosenGroup?.groupLeaders?.first,
                                          archived: false,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'users': [
                                              widget.chosenGroup?.groupLeaders
                                                  ?.first
                                            ],
                                            'userswithNotificationsOn': [
                                              widget.chosenGroup?.groupLeaders
                                                  ?.first
                                            ],
                                          },
                                        ),
                                      }, messageChatsRecordReference);

                                      context.pushNamed(
                                        'ChatPage',
                                        queryParameters: {
                                          'chatUsers': serializeParam(
                                            widget.chosenGroup?.groupLeaders
                                                ?.first,
                                            ParamType.DocumentReference,
                                          ),
                                          'chatChosen': serializeParam(
                                            _model.newGroup1,
                                            ParamType.Document,
                                          ),
                                          'otherUserRef': serializeParam(
                                            widget.chosenGroup?.groupLeaders
                                                ?.first,
                                            ParamType.DocumentReference,
                                          ),
                                          'otherUserDoc': serializeParam(
                                            containerUsersRecord,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'chatChosen': _model.newGroup1,
                                          'otherUserDoc': containerUsersRecord,
                                        },
                                      );

                                      setState(() {});
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'rupweaeg' /* Message leader */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: Color(0xFFFEFDEC),
                                                fontSize: 16.0,
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (!widget.chosenGroup!.members
                                  .contains(currentUserReference) &&
                              widget.chosenGroup!.openGroup)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.lockOpen,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 18.0,
                              ),
                            ),
                          if (!widget.chosenGroup!.members
                                  .contains(currentUserReference) &&
                              widget.chosenGroup!.closedGroup)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.lock,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 18.0,
                              ),
                            ),
                          if (widget.chosenGroup?.members
                                  ?.contains(currentUserReference) ??
                              true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: Icon(
                                Icons.check_circle_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 22.0,
                              ),
                            ),
                          if (widget.chosenGroup?.members
                                  ?.contains(currentUserReference) ??
                              true)
                            Text(
                              FFLocalizations.of(context).getText(
                                'g0tmxq73' /* You are a member of this group... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color:
                                        FlutterFlowTheme.of(context).systemGray,
                                  ),
                            ),
                          if (!widget.chosenGroup!.members
                                  .contains(currentUserReference) &&
                              widget.chosenGroup!.openGroup)
                            Text(
                              FFLocalizations.of(context).getText(
                                'bhvkwxlx' /* This community is open! */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color:
                                        FlutterFlowTheme.of(context).systemGray,
                                  ),
                            ),
                          if (!widget.chosenGroup!.members
                                  .contains(currentUserReference) &&
                              widget.chosenGroup!.closedGroup)
                            Text(
                              FFLocalizations.of(context).getText(
                                '0z6daso6' /* This community is invite only */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color:
                                        FlutterFlowTheme.of(context).systemGray,
                                  ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
