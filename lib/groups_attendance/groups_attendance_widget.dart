import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_guest_widget.dart';
import '/components/delete_guest_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'groups_attendance_model.dart';
export 'groups_attendance_model.dart';

class GroupsAttendanceWidget extends StatefulWidget {
  const GroupsAttendanceWidget({
    super.key,
    required this.groupChosen,
    this.groupUsers,
  });

  final GroupsRecord? groupChosen;
  final List<DocumentReference>? groupUsers;

  @override
  State<GroupsAttendanceWidget> createState() => _GroupsAttendanceWidgetState();
}

class _GroupsAttendanceWidgetState extends State<GroupsAttendanceWidget> {
  late GroupsAttendanceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
                return FloatingActionButton.extended(
                  onPressed: () {
                    print('FloatingActionButton pressed ...');
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  label: Container(
                    width: 150.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color:
                          FlutterFlowTheme.of(context).tertiarySystemBackground,
                      borderRadius: BorderRadius.circular(20.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
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
                                FlutterFlowTheme.of(context).opagueSeparator,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: AddGuestWidget(
                                      groupChosen: widget.groupChosen!,
                                      groupChosenRef:
                                          widget.groupChosen!.reference,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'lcunxhqc' /* Add Guest */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Icon(
                              Icons.person_add_alt_1,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 25.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            body: StreamBuilder<List<GuestsRecord>>(
              stream: queryGuestsRecord(
                queryBuilder: (guestsRecord) => guestsRecord
                    .where(
                      'groupReference',
                      isEqualTo: widget.groupChosen?.reference,
                    )
                    .orderBy('guestName', descending: true),
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
                List<GuestsRecord> containerGuestsRecordList = snapshot.data!;
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 60.0, 40.0, 0.0),
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
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              22.0, 10.0, 22.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '3vi8r0du' /* Hello, */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                                          color: FlutterFlowTheme.of(context)
                                              .label,
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
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.edit_note_rounded,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 35.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
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
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
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
                                primary: false,
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
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.08,
                                      constraints: BoxConstraints(
                                        maxWidth: double.infinity,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
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
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: Colors.transparent,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
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
                                                        extra: <String,
                                                            dynamic>{
                                                          'selectedUser':
                                                              listViewUsersRecord,
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 40.0,
                                                      height: 40.0,
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
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(25),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                    ),
                                                    child: CheckboxListTile(
                                                      value: _model
                                                                  .checkboxListTileValueMap1[
                                                              listViewUsersRecord] ??=
                                                          dateTimeFormat(
                                                                    'yMMMd',
                                                                    listViewUsersRecord
                                                                        .dateCheckedinGroup,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ) ==
                                                                  dateTimeFormat(
                                                                    'yMMMd',
                                                                    getCurrentTimestamp,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  )
                                                              ? true
                                                              : false,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                    .checkboxListTileValueMap1[
                                                                listViewUsersRecord] =
                                                            newValue!);
                                                        if (newValue!) {
                                                          await listViewUsersRecord
                                                              .reference
                                                              .update(
                                                                  createUsersRecordData(
                                                            lastAttendance:
                                                                getCurrentTimestamp,
                                                            dateCheckedinGroup:
                                                                getCurrentTimestamp,
                                                          ));
                                                          if (functions.checkTodayDate(
                                                              groupsAttendanceGlobalGroupsDataRecord
                                                                  ?.currentDay)!) {
                                                            await groupsAttendanceGlobalGroupsDataRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'totalAttendancefortheDay':
                                                                      FieldValue
                                                                          .increment(
                                                                              1),
                                                                },
                                                              ),
                                                            });
                                                          } else {
                                                            var globalGroupsDataRecordReference =
                                                                GlobalGroupsDataRecord
                                                                    .collection
                                                                    .doc();
                                                            await globalGroupsDataRecordReference
                                                                .set(
                                                                    createGlobalGroupsDataRecordData(
                                                              dayInteger:
                                                                  groupsAttendanceGlobalGroupsDataRecord
                                                                      ?.dayInteger,
                                                              currentDay: functions
                                                                  .getDayDate(),
                                                            ));
                                                            _model.newDay =
                                                                GlobalGroupsDataRecord
                                                                    .getDocumentFromData(
                                                                        createGlobalGroupsDataRecordData(
                                                                          dayInteger:
                                                                              groupsAttendanceGlobalGroupsDataRecord?.dayInteger,
                                                                          currentDay:
                                                                              functions.getDayDate(),
                                                                        ),
                                                                        globalGroupsDataRecordReference);

                                                            await _model.newDay!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'dayInteger':
                                                                      FieldValue
                                                                          .increment(
                                                                              1),
                                                                  'totalAttendancefortheDay':
                                                                      FieldValue
                                                                          .increment(
                                                                              1),
                                                                },
                                                              ),
                                                            });
                                                          }

                                                          setState(() {});
                                                        } else {
                                                          if (functions.checkTodayDate(
                                                              groupsAttendanceGlobalGroupsDataRecord
                                                                  ?.currentDay)!) {
                                                            await groupsAttendanceGlobalGroupsDataRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'totalAttendancefortheDay':
                                                                      FieldValue
                                                                          .increment(
                                                                              -(1)),
                                                                },
                                                              ),
                                                            });
                                                          } else {
                                                            var globalGroupsDataRecordReference =
                                                                GlobalGroupsDataRecord
                                                                    .collection
                                                                    .doc();
                                                            await globalGroupsDataRecordReference
                                                                .set(
                                                                    createGlobalGroupsDataRecordData(
                                                              dayInteger:
                                                                  groupsAttendanceGlobalGroupsDataRecord
                                                                      ?.dayInteger,
                                                              currentDay: functions
                                                                  .getDayDate(),
                                                            ));
                                                            _model.newDayCopy =
                                                                GlobalGroupsDataRecord
                                                                    .getDocumentFromData(
                                                                        createGlobalGroupsDataRecordData(
                                                                          dayInteger:
                                                                              groupsAttendanceGlobalGroupsDataRecord?.dayInteger,
                                                                          currentDay:
                                                                              functions.getDayDate(),
                                                                        ),
                                                                        globalGroupsDataRecordReference);

                                                            await _model
                                                                .newDayCopy!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'dayInteger':
                                                                      FieldValue
                                                                          .increment(
                                                                              1),
                                                                  'totalAttendancefortheDay':
                                                                      FieldValue
                                                                          .increment(
                                                                              -(1)),
                                                                },
                                                              ),
                                                            });
                                                          }

                                                          setState(() {});
                                                        }
                                                      },
                                                      title: Text(
                                                        listViewUsersRecord
                                                            .displayName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                      tileColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                              );
                            },
                          ),
                        ),
                        if (containerGuestsRecordList.length > 0)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                22.0, 12.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'ca0vqc1g' /* Group Guests */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color:
                                        FlutterFlowTheme.of(context).systemGray,
                                  ),
                            ),
                          ),
                        if (containerGuestsRecordList.length > 0)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                22.0, 4.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'w08q8tj0' /* (To delete guest, tap and hold... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color:
                                        FlutterFlowTheme.of(context).systemGray,
                                    fontSize: 12.0,
                                  ),
                            ),
                          ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 100.0),
                            child: Builder(
                              builder: (context) {
                                final containerVar =
                                    containerGuestsRecordList.toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: containerVar.length,
                                  itemBuilder: (context, containerVarIndex) {
                                    final containerVarItem =
                                        containerVar[containerVarIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 16.0, 20.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onLongPress: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor:
                                                FlutterFlowTheme.of(context)
                                                    .opagueSeparator,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: DeleteGuestWidget(
                                                      guestChosen:
                                                          containerVarItem
                                                              .reference,
                                                      guestChosenRef:
                                                          containerVarItem,
                                                      groupChosen:
                                                          widget.groupChosen!,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.08,
                                          constraints: BoxConstraints(
                                            maxWidth: double.infinity,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 2.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 70.0,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(
                                                        context)
                                                    .secondarySystemBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Card(
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      color: Colors.transparent,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40.0),
                                                      ),
                                                      child: Container(
                                                        width: 40.0,
                                                        height: 40.0,
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
                                                              'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Theme(
                                                        data: ThemeData(
                                                          checkboxTheme:
                                                              CheckboxThemeData(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25),
                                                            ),
                                                          ),
                                                          unselectedWidgetColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .tertiary,
                                                        ),
                                                        child: CheckboxListTile(
                                                          value: _model
                                                                      .checkboxListTileValueMap2[
                                                                  containerVarItem] ??=
                                                              dateTimeFormat(
                                                                        'yMMMd',
                                                                        containerVarItem
                                                                            .dateCheckedinGroup,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ) ==
                                                                      dateTimeFormat(
                                                                        'yMMMd',
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )
                                                                  ? true
                                                                  : false,
                                                          onChanged:
                                                              (newValue) async {
                                                            setState(() => _model
                                                                        .checkboxListTileValueMap2[
                                                                    containerVarItem] =
                                                                newValue!);
                                                            if (newValue!) {
                                                              await containerVarItem
                                                                  .reference
                                                                  .update(
                                                                      createGuestsRecordData(
                                                                lastAttendance:
                                                                    getCurrentTimestamp,
                                                                dateCheckedinGroup:
                                                                    getCurrentTimestamp,
                                                              ));
                                                              if (functions
                                                                  .checkTodayDate(
                                                                      groupsAttendanceGlobalGroupsDataRecord
                                                                          ?.currentDay)!) {
                                                                await groupsAttendanceGlobalGroupsDataRecord!
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'totalAttendancefortheDay':
                                                                          FieldValue.increment(
                                                                              1),
                                                                    },
                                                                  ),
                                                                });
                                                              } else {
                                                                var globalGroupsDataRecordReference =
                                                                    GlobalGroupsDataRecord
                                                                        .collection
                                                                        .doc();
                                                                await globalGroupsDataRecordReference
                                                                    .set(
                                                                        createGlobalGroupsDataRecordData(
                                                                  dayInteger:
                                                                      groupsAttendanceGlobalGroupsDataRecord
                                                                          ?.dayInteger,
                                                                  currentDay:
                                                                      functions
                                                                          .getDayDate(),
                                                                ));
                                                                _model.newDayCopy1 =
                                                                    GlobalGroupsDataRecord.getDocumentFromData(
                                                                        createGlobalGroupsDataRecordData(
                                                                          dayInteger:
                                                                              groupsAttendanceGlobalGroupsDataRecord?.dayInteger,
                                                                          currentDay:
                                                                              functions.getDayDate(),
                                                                        ),
                                                                        globalGroupsDataRecordReference);

                                                                await _model
                                                                    .newDayCopy1!
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'dayInteger':
                                                                          FieldValue.increment(
                                                                              1),
                                                                      'totalAttendancefortheDay':
                                                                          FieldValue.increment(
                                                                              1),
                                                                    },
                                                                  ),
                                                                });
                                                              }

                                                              setState(() {});
                                                            } else {
                                                              if (functions
                                                                  .checkTodayDate(
                                                                      groupsAttendanceGlobalGroupsDataRecord
                                                                          ?.currentDay)!) {
                                                                await groupsAttendanceGlobalGroupsDataRecord!
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'totalAttendancefortheDay':
                                                                          FieldValue.increment(
                                                                              -(1)),
                                                                    },
                                                                  ),
                                                                });
                                                              } else {
                                                                var globalGroupsDataRecordReference =
                                                                    GlobalGroupsDataRecord
                                                                        .collection
                                                                        .doc();
                                                                await globalGroupsDataRecordReference
                                                                    .set(
                                                                        createGlobalGroupsDataRecordData(
                                                                  dayInteger:
                                                                      groupsAttendanceGlobalGroupsDataRecord
                                                                          ?.dayInteger,
                                                                  currentDay:
                                                                      functions
                                                                          .getDayDate(),
                                                                ));
                                                                _model.newDayCopy2 =
                                                                    GlobalGroupsDataRecord.getDocumentFromData(
                                                                        createGlobalGroupsDataRecordData(
                                                                          dayInteger:
                                                                              groupsAttendanceGlobalGroupsDataRecord?.dayInteger,
                                                                          currentDay:
                                                                              functions.getDayDate(),
                                                                        ),
                                                                        globalGroupsDataRecordReference);

                                                                await _model
                                                                    .newDayCopy2!
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'dayInteger':
                                                                          FieldValue.increment(
                                                                              1),
                                                                      'totalAttendancefortheDay':
                                                                          FieldValue.increment(
                                                                              -(1)),
                                                                    },
                                                                  ),
                                                                });
                                                              }

                                                              setState(() {});
                                                            }
                                                          },
                                                          title: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              containerVarItem
                                                                  .guestName,
                                                              'Guest User',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                          tileColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
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
                                      ),
                                    );
                                  },
                                );
                              },
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
        );
      },
    );
  }
}
