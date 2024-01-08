import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/edit_prayer_widget.dart';
import '/components/person_blocked_widget.dart';
import '/components/under13_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
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
import 'community_prayer_request_model.dart';
export 'community_prayer_request_model.dart';

class CommunityPrayerRequestWidget extends StatefulWidget {
  const CommunityPrayerRequestWidget({
    Key? key,
    required this.chosenPrayerRequestDoc,
    required this.chosenPrayerRequestRef,
  }) : super(key: key);

  final PrayerRequestsRecord? chosenPrayerRequestDoc;
  final DocumentReference? chosenPrayerRequestRef;

  @override
  _CommunityPrayerRequestWidgetState createState() =>
      _CommunityPrayerRequestWidgetState();
}

class _CommunityPrayerRequestWidgetState
    extends State<CommunityPrayerRequestWidget> with TickerProviderStateMixin {
  late CommunityPrayerRequestModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
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
        VisibilityEffect(duration: 1.ms),
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
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityPrayerRequestModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
      child: FutureBuilder<UsersRecord>(
        future:
            UsersRecord.getDocumentOnce(widget.chosenPrayerRequestDoc!.user!),
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
            width: MediaQuery.sizeOf(context).width * 0.9,
            constraints: BoxConstraints(
              maxWidth: double.infinity,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary,
            ),
            child: Container(
              color: FlutterFlowTheme.of(context).primary,
              child: ExpandableNotifier(
                controller: _model.expandableController,
                child: ExpandablePanel(
                  header: Container(
                    width: 100.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Color(0x00EEEEEE),
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
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 32.0,
                            height: 32.0,
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
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'selectedUser': containerUsersRecord,
                                    },
                                  );
                                },
                                child: Container(
                                  width: 30.0,
                                  height: 30.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: CachedNetworkImage(
                                    fadeInDuration: Duration(milliseconds: 500),
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
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation1']!),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              containerUsersRecord.displayName,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0x00EEEEEE),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 5.0, 0.0),
                            child: Text(
                              dateTimeFormat(
                                'MMMEd',
                                widget.chosenPrayerRequestDoc!.timeUploaded!,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .lightSecondaryText,
                                    fontSize: 12.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  collapsed: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.chosenPrayerRequestDoc?.markedAnswered ??
                                true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    3.0, 0.0, 3.0, 8.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'dvgl517f' /* Prayer Answered! */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .prayerRing,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            if (widget.chosenPrayerRequestDoc?.pinned ?? true)
                              Icon(
                                Icons.push_pin_rounded,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 18.0,
                              ),
                            if (widget.chosenPrayerRequestDoc?.pinned ?? true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    3.0, 0.0, 3.0, 8.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'yocfnn9z' /* Pinned by Admin */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .systemGray,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 3.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondarySystemBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: valueOrDefault<Color>(
                                  widget.chosenPrayerRequestDoc!.markedAnswered
                                      ? FlutterFlowTheme.of(context).prayerRing
                                      : Colors.transparent,
                                  Colors.transparent,
                                ),
                                width: 3.0,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 8.0, 12.0, 12.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget.chosenPrayerRequestDoc
                                              ?.requestText,
                                          'Prayer request here...',
                                        ).maybeHandleOverflow(
                                          maxChars: 300,
                                          replacement: '…',
                                        ),
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .label,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                    if (widget.chosenPrayerRequestDoc!
                                            .prayedforByUsers.length >
                                        0)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            StreamBuilder<List<UsersRecord>>(
                                              stream: queryUsersRecord(
                                                queryBuilder: (usersRecord) =>
                                                    usersRecord.where(
                                                  'prayedforRequests',
                                                  arrayContains: widget
                                                      .chosenPrayerRequestRef,
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
                                                    containerUsersRecordList =
                                                    snapshot.data!;
                                                return Container(
                                                  height: 30.0,
                                                  constraints: BoxConstraints(
                                                    maxWidth: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.6,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: StreamBuilder<
                                                            List<UsersRecord>>(
                                                          stream:
                                                              queryUsersRecord(
                                                            queryBuilder:
                                                                (usersRecord) =>
                                                                    usersRecord
                                                                        .where(
                                                              'prayedforRequests',
                                                              arrayContains: widget
                                                                  .chosenPrayerRequestRef,
                                                            ),
                                                            limit: 6,
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
                                                            List<UsersRecord>
                                                                listViewUsersRecordList =
                                                                snapshot.data!;
                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  listViewUsersRecordList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewUsersRecord =
                                                                    listViewUsersRecordList[
                                                                        listViewIndex];
                                                                return Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -0.98,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            1.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          24.0,
                                                                      height:
                                                                          24.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        image:
                                                                            DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image:
                                                                              CachedNetworkImageProvider(
                                                                            valueOrDefault<String>(
                                                                              listViewUsersRecord.photoUrl,
                                                                              'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -0.8,
                                                                              0.0),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      if (containerUsersRecordList
                                                              .length >
                                                          6)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -0.5, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              height: 30.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'uw2rfvve' /* + */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        (containerUsersRecordList.length -
                                                                                6)
                                                                            .toString(),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
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
                                                );
                                              },
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'throj6wo' /* prayed so far */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation2']!),
                      ],
                    ),
                  ),
                  expanded: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.chosenPrayerRequestDoc?.markedAnswered ??
                                true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    3.0, 0.0, 3.0, 8.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '0e8xaodr' /* Prayer Answered! */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .prayerRing,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            if (widget.chosenPrayerRequestDoc?.pinned ?? true)
                              Icon(
                                Icons.push_pin_rounded,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 18.0,
                              ),
                            if (widget.chosenPrayerRequestDoc?.pinned ?? true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    3.0, 0.0, 3.0, 8.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'g26jpszr' /* Pinned by Admin */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .systemGray,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 3.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondarySystemBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: valueOrDefault<Color>(
                                  widget.chosenPrayerRequestDoc!.markedAnswered
                                      ? FlutterFlowTheme.of(context).prayerRing
                                      : Colors.transparent,
                                  Colors.transparent,
                                ),
                                width: 3.0,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 8.0, 12.0, 12.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget.chosenPrayerRequestDoc
                                              ?.requestText,
                                          'Prayer request here...',
                                        ),
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .label,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                    if (widget.chosenPrayerRequestDoc!
                                            .prayedforByUsers.length >
                                        0)
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          StreamBuilder<List<UsersRecord>>(
                                            stream: queryUsersRecord(
                                              queryBuilder: (usersRecord) =>
                                                  usersRecord.where(
                                                'prayedforRequests',
                                                arrayContains: widget
                                                    .chosenPrayerRequestRef,
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
                                                  containerUsersRecordList =
                                                  snapshot.data!;
                                              return Container(
                                                height: 30.0,
                                                constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.6,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: StreamBuilder<
                                                          List<UsersRecord>>(
                                                        stream:
                                                            queryUsersRecord(
                                                          queryBuilder:
                                                              (usersRecord) =>
                                                                  usersRecord
                                                                      .where(
                                                            'prayedforRequests',
                                                            arrayContains: widget
                                                                .chosenPrayerRequestRef,
                                                          ),
                                                          limit: 6,
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
                                                          List<UsersRecord>
                                                              listViewUsersRecordList =
                                                              snapshot.data!;
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount:
                                                                listViewUsersRecordList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewUsersRecord =
                                                                  listViewUsersRecordList[
                                                                      listViewIndex];
                                                              return Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -0.98,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
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
                                                                            listViewUsersRecord.photoUrl,
                                                                            'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -0.8,
                                                                            0.0),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    if (containerUsersRecordList
                                                            .length >
                                                        6)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.5, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .rectangle,
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ffggpwgt' /* + */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      (containerUsersRecordList.length -
                                                                              6)
                                                                          .toString(),
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
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
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'fl08a3ra' /* prayed so far */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    Divider(
                                      thickness: 0.2,
                                      color: FlutterFlowTheme.of(context)
                                          .lightSecondaryText,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 40.0,
                                        decoration: BoxDecoration(),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 6.0, 0.0),
                                                child: Container(
                                                  width: 75.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiarySystemBackground,
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
                                                      context.pushNamed(
                                                        'PrayingPage',
                                                        queryParameters: {
                                                          'requestChosen':
                                                              serializeParam(
                                                            widget
                                                                .chosenPrayerRequestRef,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                          'requestChosenDoc':
                                                              serializeParam(
                                                            widget
                                                                .chosenPrayerRequestDoc,
                                                            ParamType.Document,
                                                          ),
                                                          'requestUser':
                                                              serializeParam(
                                                            containerUsersRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'requestChosenDoc': widget
                                                              .chosenPrayerRequestDoc,
                                                          'requestUser':
                                                              containerUsersRecord,
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .bottomToTop,
                                                          ),
                                                        },
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
                                                          FontAwesomeIcons
                                                              .prayingHands,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
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
                                                              'xtpshi4v' /* Pray */,
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
                                                                  fontSize:
                                                                      14.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if ((currentUserReference !=
                                                      containerUsersRecord
                                                          .reference) &&
                                                  !valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.admin,
                                                      false))
                                                AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      FutureBuilder<
                                                          UsersRecord>(
                                                    future: UsersRecord
                                                        .getDocumentOnce(widget
                                                            .chosenPrayerRequestDoc!
                                                            .user!),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
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
                                                      final container1UsersRecord =
                                                          snapshot.data!;
                                                      return Container(
                                                        width: 100.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiarySystemBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
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
                                                            if (!(!(currentUserDocument
                                                                            ?.blockedBy
                                                                            ?.toList() ??
                                                                        [])
                                                                    .contains(
                                                                        container1UsersRecord
                                                                            .reference) &&
                                                                !container1UsersRecord
                                                                    .blockedBy
                                                                    .contains(
                                                                        currentUserReference))) {
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
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return WebViewAware(
                                                                      child:
                                                                          Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        PersonBlockedWidget(),
                                                                  ));
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            }
                                                            if (functions.ageCheck(
                                                                    currentUserDocument
                                                                        ?.birthday,
                                                                    currentUserReference)! ||
                                                                functions.ageCheck(
                                                                    container1UsersRecord
                                                                        .birthday,
                                                                    container1UsersRecord
                                                                        .reference)!) {
                                                              if (container1UsersRecord
                                                                      .userFriends
                                                                      .contains(
                                                                          currentUserReference) ==
                                                                  true) {
                                                                var messageChatsRecordReference1 =
                                                                    MessageChatsRecord
                                                                        .collection
                                                                        .doc();
                                                                await messageChatsRecordReference1
                                                                    .set({
                                                                  ...createMessageChatsRecordData(
                                                                    authenticatedUser:
                                                                        currentUserReference,
                                                                    otherUser:
                                                                        container1UsersRecord
                                                                            .reference,
                                                                    archived:
                                                                        false,
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'users': [
                                                                        container1UsersRecord
                                                                            .reference
                                                                      ],
                                                                    },
                                                                  ),
                                                                });
                                                                _model.newGroup111 =
                                                                    MessageChatsRecord
                                                                        .getDocumentFromData({
                                                                  ...createMessageChatsRecordData(
                                                                    authenticatedUser:
                                                                        currentUserReference,
                                                                    otherUser:
                                                                        container1UsersRecord
                                                                            .reference,
                                                                    archived:
                                                                        false,
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'users': [
                                                                        container1UsersRecord
                                                                            .reference
                                                                      ],
                                                                    },
                                                                  ),
                                                                }, messageChatsRecordReference1);

                                                                context
                                                                    .pushNamed(
                                                                  'ChatPage',
                                                                  queryParameters:
                                                                      {
                                                                    'chatUsers':
                                                                        serializeParam(
                                                                      container1UsersRecord
                                                                          .reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                    'chatChosen':
                                                                        serializeParam(
                                                                      _model
                                                                          .newGroup111,
                                                                      ParamType
                                                                          .Document,
                                                                    ),
                                                                    'otherUserDoc':
                                                                        serializeParam(
                                                                      container1UsersRecord,
                                                                      ParamType
                                                                          .Document,
                                                                    ),
                                                                    'otherUserRef':
                                                                        serializeParam(
                                                                      container1UsersRecord
                                                                          .reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    'chatChosen':
                                                                        _model
                                                                            .newGroup111,
                                                                    'otherUserDoc':
                                                                        container1UsersRecord,
                                                                  },
                                                                );
                                                              } else {
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
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return WebViewAware(
                                                                        child:
                                                                            Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          Under13Widget(),
                                                                    ));
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                        () {}));
                                                              }
                                                            } else {
                                                              var messageChatsRecordReference2 =
                                                                  MessageChatsRecord
                                                                      .collection
                                                                      .doc();
                                                              await messageChatsRecordReference2
                                                                  .set({
                                                                ...createMessageChatsRecordData(
                                                                  authenticatedUser:
                                                                      currentUserReference,
                                                                  otherUser:
                                                                      container1UsersRecord
                                                                          .reference,
                                                                  archived:
                                                                      false,
                                                                ),
                                                                ...mapToFirestore(
                                                                  {
                                                                    'users': [
                                                                      container1UsersRecord
                                                                          .reference
                                                                    ],
                                                                  },
                                                                ),
                                                              });
                                                              _model.newGroup =
                                                                  MessageChatsRecord
                                                                      .getDocumentFromData({
                                                                ...createMessageChatsRecordData(
                                                                  authenticatedUser:
                                                                      currentUserReference,
                                                                  otherUser:
                                                                      container1UsersRecord
                                                                          .reference,
                                                                  archived:
                                                                      false,
                                                                ),
                                                                ...mapToFirestore(
                                                                  {
                                                                    'users': [
                                                                      container1UsersRecord
                                                                          .reference
                                                                    ],
                                                                  },
                                                                ),
                                                              }, messageChatsRecordReference2);

                                                              context.pushNamed(
                                                                'ChatPage',
                                                                queryParameters:
                                                                    {
                                                                  'chatUsers':
                                                                      serializeParam(
                                                                    container1UsersRecord
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                  'chatChosen':
                                                                      serializeParam(
                                                                    _model
                                                                        .newGroup,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                  'otherUserDoc':
                                                                      serializeParam(
                                                                    container1UsersRecord,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                  'otherUserRef':
                                                                      serializeParam(
                                                                    container1UsersRecord
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'chatChosen':
                                                                      _model
                                                                          .newGroup,
                                                                  'otherUserDoc':
                                                                      container1UsersRecord,
                                                                },
                                                              );
                                                            }

                                                            setState(() {});
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Icon(
                                                                Icons.chat,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                size: 16.0,
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '4uh0cl1r' /* Message */,
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
                                                                            14.0,
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
                                              if (currentUserReference ==
                                                  containerUsersRecord
                                                      .reference)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 6.0, 0.0),
                                                  child: Container(
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .tertiarySystemBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        if (!widget
                                                            .chosenPrayerRequestDoc!
                                                            .markedAnswered)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2.0,
                                                                        0.0,
                                                                        2.0,
                                                                        0.0),
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
                                                                if (!widget
                                                                    .chosenPrayerRequestDoc!
                                                                    .notificationSent) {
                                                                  triggerPushNotification(
                                                                    notificationTitle:
                                                                        'Prayer Answered!',
                                                                    notificationText:
                                                                        '${valueOrDefault<String>(
                                                                      containerUsersRecord
                                                                          .displayName,
                                                                      'Guest User',
                                                                    )} just marked their prayer answered!',
                                                                    notificationImageUrl:
                                                                        containerUsersRecord
                                                                            .photoUrl,
                                                                    userRefs: widget
                                                                        .chosenPrayerRequestDoc!
                                                                        .prayedforByUsers
                                                                        .toList(),
                                                                    initialPageName:
                                                                        'CommunityPrayerPage',
                                                                    parameterData: {},
                                                                  );
                                                                }

                                                                await widget
                                                                    .chosenPrayerRequestRef!
                                                                    .update(
                                                                        createPrayerRequestsRecordData(
                                                                  markedAnswered:
                                                                      true,
                                                                  notificationSent:
                                                                      true,
                                                                ));
                                                              },
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                    child:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .check,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      size:
                                                                          14.0,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
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
                                                                          'al6v3w0u' /* Mark Answered */,
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
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        if (widget
                                                                .chosenPrayerRequestDoc
                                                                ?.markedAnswered ??
                                                            true)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2.0,
                                                                        0.0,
                                                                        2.0,
                                                                        0.0),
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
                                                                await widget
                                                                    .chosenPrayerRequestRef!
                                                                    .update(
                                                                        createPrayerRequestsRecordData(
                                                                  markedAnswered:
                                                                      false,
                                                                ));
                                                              },
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                    child:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .check,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      size:
                                                                          14.0,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
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
                                                                          '6pw7z0j9' /* Unmark Answered */,
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
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              if (!valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.admin,
                                                      false) &&
                                                  (currentUserReference !=
                                                      containerUsersRecord
                                                          .reference))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 6.0, 0.0),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        Container(
                                                      width: 75.0,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .tertiarySystemBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Builder(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await Share.share(
                                                              'Click here to view a prayer request from ${containerUsersRecord.displayName}: ${'lawndalestudents://lawndalestudents.com${GoRouter.of(context).location}'}',
                                                              sharePositionOrigin:
                                                                  getWidgetBoundingBox(
                                                                      context),
                                                            );
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Icon(
                                                                Icons.ios_share,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                size: 16.0,
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'own91fl6' /* Share */,
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
                                                                            14.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (valueOrDefault<bool>(
                                                  currentUserDocument?.admin,
                                                  false))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 6.0, 0.0),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        Container(
                                                      width: 65.0,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .tertiarySystemBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
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
                                                          await widget
                                                              .chosenPrayerRequestRef!
                                                              .update(
                                                                  createPrayerRequestsRecordData(
                                                            pinned: true,
                                                            pinnedTime:
                                                                getCurrentTimestamp,
                                                          ));
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .push_pin_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              size: 18.0,
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'nvwdvbuo' /* Pin */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
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
                                                  ),
                                                ),
                                              if ((currentUserReference ==
                                                      containerUsersRecord
                                                          .reference) ||
                                                  valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.admin,
                                                      false))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 6.0, 0.0),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        Container(
                                                      width: 75.0,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .tertiarySystemBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
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
                                                                      Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.75,
                                                                  child:
                                                                      EditPrayerWidget(
                                                                    usersPrayer:
                                                                        widget
                                                                            .chosenPrayerRequestRef,
                                                                    usersPrayerDoc:
                                                                        widget
                                                                            .chosenPrayerRequestDoc,
                                                                  ),
                                                                ),
                                                              ));
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            FaIcon(
                                                              FontAwesomeIcons
                                                                  .edit,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
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
                                                                  't6sq841g' /* Edit */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
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
                          ),
                        ),
                      ],
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
          );
        },
      ),
    );
  }
}
