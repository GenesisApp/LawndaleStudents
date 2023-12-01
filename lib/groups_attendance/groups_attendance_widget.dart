import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/attendance_taken_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'groups_attendance_model.dart';
export 'groups_attendance_model.dart';

class GroupsAttendanceWidget extends StatefulWidget {
  const GroupsAttendanceWidget({
    Key? key,
    required this.groupChosen,
    this.groupUsers,
  }) : super(key: key);

  final GroupsRecord? groupChosen;
  final List<DocumentReference>? groupUsers;

  @override
  _GroupsAttendanceWidgetState createState() => _GroupsAttendanceWidgetState();
}

class _GroupsAttendanceWidgetState extends State<GroupsAttendanceWidget>
    with TickerProviderStateMixin {
  late GroupsAttendanceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
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
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GroupsAttendanceModel());
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

    return StreamBuilder<List<GlobalGroupsDataRecord>>(
      stream: queryGlobalGroupsDataRecord(
        queryBuilder: (globalGroupsDataRecord) =>
            globalGroupsDataRecord.orderBy('dayInteger', descending: true),
        singleRecord: true,
      ),
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
        List<GlobalGroupsDataRecord>
            groupsAttendanceGlobalGroupsDataRecordList = snapshot.data!;
        final groupsAttendanceGlobalGroupsDataRecord =
            groupsAttendanceGlobalGroupsDataRecordList.isNotEmpty
                ? groupsAttendanceGlobalGroupsDataRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primary,
            floatingActionButton: StreamBuilder<List<AttendanceRecord>>(
              stream: queryAttendanceRecord(
                parent: widget.groupChosen?.reference,
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
                List<AttendanceRecord>
                    floatingActionButtonAttendanceRecordList = snapshot.data!;
                final floatingActionButtonAttendanceRecord =
                    floatingActionButtonAttendanceRecordList.isNotEmpty
                        ? floatingActionButtonAttendanceRecordList.first
                        : null;
                return FloatingActionButton(
                  onPressed: () {
                    print('FloatingActionButton pressed ...');
                  },
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  elevation: 8.0,
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color:
                          FlutterFlowTheme.of(context).tertiarySystemBackground,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await widget.groupChosen!.reference.update({
                          ...mapToFirestore(
                            {
                              'totalWeeksMet': FieldValue.increment(1),
                            },
                          ),
                        });

                        await AttendanceRecord.createDoc(
                                widget.groupChosen!.reference)
                            .set({
                          ...createAttendanceRecordData(
                            groupReference: widget.groupChosen?.reference,
                            timeofAttendance: getCurrentTimestamp,
                            attendanceNumber:
                                _model.checkboxListTileCheckedItems.length,
                          ),
                          ...mapToFirestore(
                            {
                              'peopleinAttendance': _model
                                  .checkboxListTileCheckedItems
                                  .map((e) => e.reference)
                                  .toList(),
                            },
                          ),
                        });
                        if (functions.checkTodayDate(
                            groupsAttendanceGlobalGroupsDataRecord
                                ?.currentDay)!) {
                          await groupsAttendanceGlobalGroupsDataRecord!
                              .reference
                              .update({
                            ...mapToFirestore(
                              {
                                'totalAttendancefortheDay':
                                    FieldValue.increment(_model
                                        .checkboxListTileCheckedItems.length),
                              },
                            ),
                          });
                        } else {
                          var globalGroupsDataRecordReference =
                              GlobalGroupsDataRecord.collection.doc();
                          await globalGroupsDataRecordReference
                              .set(createGlobalGroupsDataRecordData(
                            dayInteger: groupsAttendanceGlobalGroupsDataRecord
                                ?.dayInteger,
                            currentDay: functions.getDayDate(),
                          ));
                          _model.newDay =
                              GlobalGroupsDataRecord.getDocumentFromData(
                                  createGlobalGroupsDataRecordData(
                                    dayInteger:
                                        groupsAttendanceGlobalGroupsDataRecord
                                            ?.dayInteger,
                                    currentDay: functions.getDayDate(),
                                  ),
                                  globalGroupsDataRecordReference);

                          await _model.newDay!.reference.update({
                            ...createGlobalGroupsDataRecordData(
                              totalAttendancefortheDay:
                                  _model.checkboxListTileCheckedItems.length,
                            ),
                            ...mapToFirestore(
                              {
                                'dayInteger': FieldValue.increment(1),
                              },
                            ),
                          });
                        }

                        HapticFeedback.lightImpact();
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor:
                              FlutterFlowTheme.of(context).opagueSeparator,
                          isDismissible: false,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                                child: GestureDetector(
                              onTap: () => _model.unfocusNode.canRequestFocus
                                  ? FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode)
                                  : FocusScope.of(context).unfocus(),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: AttendanceTakenWidget(),
                              ),
                            ));
                          },
                        ).then((value) => safeSetState(() {}));

                        setState(() {});
                      },
                      child: Icon(
                        Icons.check_rounded,
                        color: FlutterFlowTheme.of(context).tertiary,
                        size: 28.0,
                      ),
                    ),
                  ),
                );
              },
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 60.0, 40.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
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
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            width: 100.0,
                            height: 10.0,
                            decoration: BoxDecoration(),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 100.0,
                            height: 10.0,
                            decoration: BoxDecoration(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(22.0, 10.0, 22.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '3vi8r0du' /* Hello, */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .lightSecondaryText,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              currentUserDisplayName,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).label,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 10.0,
                            decoration: BoxDecoration(),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Icon(
                            Icons.edit_note_rounded,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 35.0,
                          ),
                        ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['rowOnPageLoadAnimation']!),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              22.0, 8.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '4e2w6j0i' /* Select who attended your group... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .lightSecondaryText,
                                  fontSize: 14.0,
                                ),
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation']!),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<List<UsersRecord>>(
                      stream: queryUsersRecord(
                        queryBuilder: (usersRecord) => usersRecord.where(
                          'groups',
                          arrayContains: widget.groupChosen?.reference,
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
                        List<UsersRecord> listViewUsersRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewUsersRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewUsersRecord =
                                listViewUsersRecordList[listViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 16.0, 20.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.08,
                                constraints: BoxConstraints(
                                  maxWidth: double.infinity,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 2.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 70.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondarySystemBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'OtherUserProfile',
                                                  queryParameters: {
                                                    'selectedUser':
                                                        serializeParam(
                                                      listViewUsersRecord,
                                                      ParamType.Document,
                                                    ),
                                                    'selectedUserRef':
                                                        serializeParam(
                                                      listViewUsersRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'selectedUser':
                                                        listViewUsersRecord,
                                                  },
                                                );
                                              },
                                              child: Container(
                                                width: 40.0,
                                                height: 40.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: Duration(
                                                      milliseconds: 500),
                                                  fadeOutDuration: Duration(
                                                      milliseconds: 500),
                                                  imageUrl:
                                                      valueOrDefault<String>(
                                                    listViewUsersRecord
                                                        .photoUrl,
                                                    'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                              ),
                                              child: CheckboxListTile(
                                                value: _model
                                                        .checkboxListTileValueMap[
                                                    listViewUsersRecord] ??= false,
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                              .checkboxListTileValueMap[
                                                          listViewUsersRecord] =
                                                      newValue!);
                                                  if (newValue!) {
                                                    await listViewUsersRecord
                                                        .reference
                                                        .update(
                                                            createUsersRecordData(
                                                      lastAttendance:
                                                          getCurrentTimestamp,
                                                    ));
                                                  }
                                                },
                                                title: Text(
                                                  listViewUsersRecord
                                                      .displayName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                                tileColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .worshipRing,
                                                dense: false,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ).animateOnPageLoad(
                            animationsMap['listViewOnPageLoadAnimation']!);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
