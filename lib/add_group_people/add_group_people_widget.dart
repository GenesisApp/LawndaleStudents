import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/people_added_group_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_group_people_model.dart';
export 'add_group_people_model.dart';

class AddGroupPeopleWidget extends StatefulWidget {
  const AddGroupPeopleWidget({
    super.key,
    this.groupChosen,
    this.groupChosenRef,
    required this.sgChat,
    required this.sgChatDoc,
  });

  final GroupsRecord? groupChosen;
  final DocumentReference? groupChosenRef;
  final DocumentReference? sgChat;
  final MessageChatsRecord? sgChatDoc;

  @override
  State<AddGroupPeopleWidget> createState() => _AddGroupPeopleWidgetState();
}

class _AddGroupPeopleWidgetState extends State<AddGroupPeopleWidget> {
  late AddGroupPeopleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddGroupPeopleModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().showFullList = true;
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        List<GlobalGroupsDataRecord> addGroupPeopleGlobalGroupsDataRecordList =
            snapshot.data!;
        final addGroupPeopleGlobalGroupsDataRecord =
            addGroupPeopleGlobalGroupsDataRecordList.isNotEmpty
                ? addGroupPeopleGlobalGroupsDataRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primary,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                print('FloatingActionButton pressed ...');
              },
              backgroundColor: FlutterFlowTheme.of(context).primary,
              elevation: 8.0,
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).tertiarySystemBackground,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await widget.groupChosen!.reference
                        .update(createGroupsRecordData(
                      numberofMembersAdded: 0,
                      numberofMembersRemoved: 0,
                    ));
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
                              child: PeopleAddedGroupWidget(
                                groupChosen: widget.groupChosenRef,
                                groupChosenDoc: widget.groupChosen,
                              ),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  child: Icon(
                    Icons.check_rounded,
                    color: FlutterFlowTheme.of(context).tertiary,
                    size: 28.0,
                  ),
                ),
              ),
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
                        EdgeInsetsDirectional.fromSTEB(20.0, 60.0, 40.0, 20.0),
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
                          flex: 4,
                          child: Container(
                            width: double.infinity,
                            height: 10.0,
                            decoration: BoxDecoration(),
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'mxl28paa' /* Members */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).label,
                              ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            width: double.infinity,
                            height: 10.0,
                            decoration: BoxDecoration(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            height: 45.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondarySystemBackground,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: TextFormField(
                                          controller: _model.textController,
                                          focusNode: _model.textFieldFocusNode,
                                          onFieldSubmitted: (_) async {
                                            await queryUsersRecordOnce()
                                                .then(
                                                  (records) => _model
                                                          .simpleSearchResults =
                                                      TextSearch(
                                                    records
                                                        .map(
                                                          (record) =>
                                                              TextSearchItem
                                                                  .fromTerms(
                                                                      record, [
                                                            record.email!,
                                                            record.displayName!,
                                                            record.firstName!,
                                                            record.lastName!
                                                          ]),
                                                        )
                                                        .toList(),
                                                  )
                                                          .search(_model
                                                              .textController
                                                              .text)
                                                          .map((r) => r.object)
                                                          .toList(),
                                                )
                                                .onError((_, __) => _model
                                                    .simpleSearchResults = [])
                                                .whenComplete(
                                                    () => setState(() {}));

                                            if (_model.textController.text !=
                                                    null &&
                                                _model.textController.text !=
                                                    '') {
                                              setState(() {
                                                FFAppState().showFullList =
                                                    false;
                                              });
                                            }
                                          },
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'xsu90hra' /* Search People... */,
                                            ),
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .lightSecondaryText,
                                                      fontSize: 16.0,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .lightSecondaryText,
                                                      fontSize: 16.0,
                                                    ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.search,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lightSecondaryText,
                                              size: 18.0,
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lightSecondaryText,
                                                fontSize: 16.0,
                                              ),
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 40.0,
                                    height: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Visibility(
                                      visible: !FFAppState().showFullList,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().update(() {
                                            FFAppState().showFullList = true;
                                          });
                                          setState(() {
                                            _model.textController?.clear();
                                          });
                                        },
                                        child: Icon(
                                          Icons.clear_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .lightSecondaryText,
                                          size: 20.0,
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
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'e2o7ezek' /* Search Results */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .lightSecondaryText,
                                  fontSize: 16.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (FFAppState().showFullList)
                    Expanded(
                      child: PagedListView<DocumentSnapshot<Object?>?,
                          UsersRecord>(
                        pagingController: _model.setListViewController1(
                          UsersRecord.collection,
                        ),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        reverse: false,
                        scrollDirection: Axis.vertical,
                        builderDelegate: PagedChildBuilderDelegate<UsersRecord>(
                          // Customize what your widget looks like when it's loading the first page.
                          firstPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 75.0,
                              height: 75.0,
                              child: SpinKitRipple(
                                color: Color(0xFF7F95AD),
                                size: 75.0,
                              ),
                            ),
                          ),
                          // Customize what your widget looks like when it's loading another page.
                          newPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 75.0,
                              height: 75.0,
                              child: SpinKitRipple(
                                color: Color(0xFF7F95AD),
                                size: 75.0,
                              ),
                            ),
                          ),

                          itemBuilder: (context, _, listViewIndex) {
                            final listViewUsersRecord = _model
                                .listViewPagingController1!
                                .itemList![listViewIndex];
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
                                                            .checkboxListTileValueMap1[
                                                        listViewUsersRecord] ??=
                                                    listViewUsersRecord.groups
                                                            .contains(widget
                                                                .groupChosenRef) ==
                                                        true,
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                              .checkboxListTileValueMap1[
                                                          listViewUsersRecord] =
                                                      newValue!);
                                                  if (newValue!) {
                                                    final firestoreBatch =
                                                        FirebaseFirestore
                                                            .instance
                                                            .batch();
                                                    try {
                                                      firestoreBatch.update(
                                                          listViewUsersRecord
                                                              .reference,
                                                          {
                                                            ...mapToFirestore(
                                                              {
                                                                'groups': FieldValue
                                                                    .arrayUnion([
                                                                  widget
                                                                      .groupChosenRef
                                                                ]),
                                                                'messageChats':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  widget
                                                                      .sgChatDoc
                                                                      ?.reference
                                                                ]),
                                                              },
                                                            ),
                                                          });

                                                      firestoreBatch.update(
                                                          widget.sgChatDoc!
                                                              .reference,
                                                          {
                                                            ...mapToFirestore(
                                                              {
                                                                'users': FieldValue
                                                                    .arrayUnion([
                                                                  listViewUsersRecord
                                                                      .reference
                                                                ]),
                                                              },
                                                            ),
                                                          });

                                                      firestoreBatch.update(
                                                          widget.groupChosen!
                                                              .reference,
                                                          {
                                                            ...mapToFirestore(
                                                              {
                                                                'members':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  listViewUsersRecord
                                                                      .reference
                                                                ]),
                                                                'numberofMembers':
                                                                    FieldValue
                                                                        .increment(
                                                                            1),
                                                              },
                                                            ),
                                                          });
                                                      if (functions.checkTodayDate(
                                                          addGroupPeopleGlobalGroupsDataRecord
                                                              ?.currentDay)!) {
                                                        firestoreBatch.update(
                                                            addGroupPeopleGlobalGroupsDataRecord!
                                                                .reference,
                                                            {
                                                              ...mapToFirestore(
                                                                {
                                                                  'peopleAdded':
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
                                                        firestoreBatch.set(
                                                            globalGroupsDataRecordReference,
                                                            createGlobalGroupsDataRecordData(
                                                              dayInteger:
                                                                  addGroupPeopleGlobalGroupsDataRecord
                                                                      ?.dayInteger,
                                                              currentDay: functions
                                                                  .getDayDate(),
                                                            ));
                                                        _model.newDate1 =
                                                            GlobalGroupsDataRecord
                                                                .getDocumentFromData(
                                                                    createGlobalGroupsDataRecordData(
                                                                      dayInteger:
                                                                          addGroupPeopleGlobalGroupsDataRecord
                                                                              ?.dayInteger,
                                                                      currentDay:
                                                                          functions
                                                                              .getDayDate(),
                                                                    ),
                                                                    globalGroupsDataRecordReference);

                                                        firestoreBatch.update(
                                                            _model.newDate2!
                                                                .reference,
                                                            {
                                                              ...mapToFirestore(
                                                                {
                                                                  'dayInteger':
                                                                      FieldValue
                                                                          .increment(
                                                                              1),
                                                                  'peopleAdded':
                                                                      FieldValue
                                                                          .increment(
                                                                              1),
                                                                },
                                                              ),
                                                            });
                                                      }
                                                    } finally {
                                                      await firestoreBatch
                                                          .commit();
                                                    }

                                                    setState(() {});
                                                  } else {
                                                    final firestoreBatch =
                                                        FirebaseFirestore
                                                            .instance
                                                            .batch();
                                                    try {
                                                      firestoreBatch.update(
                                                          widget.sgChatDoc!
                                                              .reference,
                                                          {
                                                            ...mapToFirestore(
                                                              {
                                                                'users': FieldValue
                                                                    .arrayRemove([
                                                                  listViewUsersRecord
                                                                      .reference
                                                                ]),
                                                              },
                                                            ),
                                                          });

                                                      firestoreBatch.update(
                                                          listViewUsersRecord
                                                              .reference,
                                                          {
                                                            ...mapToFirestore(
                                                              {
                                                                'groups': FieldValue
                                                                    .arrayRemove([
                                                                  widget
                                                                      .groupChosen
                                                                      ?.reference
                                                                ]),
                                                                'messageChats':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  widget
                                                                      .sgChatDoc
                                                                      ?.reference
                                                                ]),
                                                              },
                                                            ),
                                                          });

                                                      firestoreBatch.update(
                                                          widget.groupChosen!
                                                              .reference,
                                                          {
                                                            ...mapToFirestore(
                                                              {
                                                                'members':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  listViewUsersRecord
                                                                      .reference
                                                                ]),
                                                                'numberofMembers':
                                                                    FieldValue
                                                                        .increment(
                                                                            -(1)),
                                                              },
                                                            ),
                                                          });
                                                      if (functions.checkTodayDate(
                                                          addGroupPeopleGlobalGroupsDataRecord
                                                              ?.currentDay)!) {
                                                        firestoreBatch.update(
                                                            addGroupPeopleGlobalGroupsDataRecord!
                                                                .reference,
                                                            {
                                                              ...mapToFirestore(
                                                                {
                                                                  'peopleRemoved':
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
                                                        firestoreBatch.set(
                                                            globalGroupsDataRecordReference,
                                                            createGlobalGroupsDataRecordData(
                                                              dayInteger:
                                                                  addGroupPeopleGlobalGroupsDataRecord
                                                                      ?.dayInteger,
                                                              currentDay: functions
                                                                  .getDayDate(),
                                                            ));
                                                        _model.newDate2 =
                                                            GlobalGroupsDataRecord
                                                                .getDocumentFromData(
                                                                    createGlobalGroupsDataRecordData(
                                                                      dayInteger:
                                                                          addGroupPeopleGlobalGroupsDataRecord
                                                                              ?.dayInteger,
                                                                      currentDay:
                                                                          functions
                                                                              .getDayDate(),
                                                                    ),
                                                                    globalGroupsDataRecordReference);

                                                        firestoreBatch.update(
                                                            _model.newDate2!
                                                                .reference,
                                                            {
                                                              ...mapToFirestore(
                                                                {
                                                                  'dayInteger':
                                                                      FieldValue
                                                                          .increment(
                                                                              1),
                                                                  'peopleRemoved':
                                                                      FieldValue
                                                                          .increment(
                                                                              1),
                                                                },
                                                              ),
                                                            });
                                                      }
                                                    } finally {
                                                      await firestoreBatch
                                                          .commit();
                                                    }

                                                    setState(() {});
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
                        ),
                      ),
                    ),
                  if (!FFAppState().showFullList)
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          final searchResults =
                              _model.simpleSearchResults.toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: searchResults.length,
                            itemBuilder: (context, searchResultsIndex) {
                              final searchResultsItem =
                                  searchResults[searchResultsIndex];
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
                                        borderRadius:
                                            BorderRadius.circular(12.0),
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
                                                        searchResultsItem,
                                                        ParamType.Document,
                                                      ),
                                                      'selectedUserRef':
                                                          serializeParam(
                                                        searchResultsItem
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'selectedUser':
                                                          searchResultsItem,
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
                                                      searchResultsItem
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
                                                          BorderRadius.circular(
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
                                                          searchResultsItem] ??=
                                                      searchResultsItem.groups
                                                              .contains(widget
                                                                  .groupChosenRef) ==
                                                          true,
                                                  onChanged: (newValue) async {
                                                    setState(() => _model
                                                                .checkboxListTileValueMap2[
                                                            searchResultsItem] =
                                                        newValue!);
                                                    if (newValue!) {
                                                      final firestoreBatch =
                                                          FirebaseFirestore
                                                              .instance
                                                              .batch();
                                                      try {
                                                        firestoreBatch.update(
                                                            searchResultsItem
                                                                .reference,
                                                            {
                                                              ...mapToFirestore(
                                                                {
                                                                  'groups':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    widget
                                                                        .groupChosenRef
                                                                  ]),
                                                                  'messageChats':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    widget
                                                                        .sgChat
                                                                  ]),
                                                                },
                                                              ),
                                                            });

                                                        firestoreBatch.update(
                                                            widget.sgChat!, {
                                                          ...mapToFirestore(
                                                            {
                                                              'users': FieldValue
                                                                  .arrayUnion([
                                                                searchResultsItem
                                                                    .reference
                                                              ]),
                                                            },
                                                          ),
                                                        });

                                                        firestoreBatch.update(
                                                            widget.groupChosen!
                                                                .reference,
                                                            {
                                                              ...mapToFirestore(
                                                                {
                                                                  'members':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    searchResultsItem
                                                                        .reference
                                                                  ]),
                                                                  'numberofMembers':
                                                                      FieldValue
                                                                          .increment(
                                                                              -(1)),
                                                                },
                                                              ),
                                                            });
                                                        if (functions.checkTodayDate(
                                                            addGroupPeopleGlobalGroupsDataRecord
                                                                ?.currentDay)!) {
                                                          firestoreBatch.update(
                                                              addGroupPeopleGlobalGroupsDataRecord!
                                                                  .reference,
                                                              {
                                                                ...mapToFirestore(
                                                                  {
                                                                    'peopleAdded':
                                                                        FieldValue
                                                                            .increment(1),
                                                                  },
                                                                ),
                                                              });
                                                        } else {
                                                          var globalGroupsDataRecordReference =
                                                              GlobalGroupsDataRecord
                                                                  .collection
                                                                  .doc();
                                                          firestoreBatch.set(
                                                              globalGroupsDataRecordReference,
                                                              createGlobalGroupsDataRecordData(
                                                                dayInteger:
                                                                    addGroupPeopleGlobalGroupsDataRecord
                                                                        ?.dayInteger,
                                                                currentDay:
                                                                    functions
                                                                        .getDayDate(),
                                                              ));
                                                          _model.newDate4 =
                                                              GlobalGroupsDataRecord
                                                                  .getDocumentFromData(
                                                                      createGlobalGroupsDataRecordData(
                                                                        dayInteger:
                                                                            addGroupPeopleGlobalGroupsDataRecord?.dayInteger,
                                                                        currentDay:
                                                                            functions.getDayDate(),
                                                                      ),
                                                                      globalGroupsDataRecordReference);

                                                          firestoreBatch.update(
                                                              _model.newDate4!
                                                                  .reference,
                                                              {
                                                                ...mapToFirestore(
                                                                  {
                                                                    'dayInteger':
                                                                        FieldValue
                                                                            .increment(1),
                                                                    'peopleAdded':
                                                                        FieldValue
                                                                            .increment(1),
                                                                  },
                                                                ),
                                                              });
                                                        }
                                                      } finally {
                                                        await firestoreBatch
                                                            .commit();
                                                      }

                                                      setState(() {});
                                                    } else {
                                                      final firestoreBatch =
                                                          FirebaseFirestore
                                                              .instance
                                                              .batch();
                                                      try {
                                                        firestoreBatch.update(
                                                            searchResultsItem
                                                                .reference,
                                                            {
                                                              ...mapToFirestore(
                                                                {
                                                                  'groups':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    widget
                                                                        .groupChosen
                                                                        ?.reference
                                                                  ]),
                                                                  'messageChats':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    widget
                                                                        .sgChat
                                                                  ]),
                                                                },
                                                              ),
                                                            });

                                                        firestoreBatch.update(
                                                            widget.sgChat!, {
                                                          ...mapToFirestore(
                                                            {
                                                              'users': FieldValue
                                                                  .arrayRemove([
                                                                searchResultsItem
                                                                    .reference
                                                              ]),
                                                            },
                                                          ),
                                                        });

                                                        firestoreBatch.update(
                                                            widget.groupChosen!
                                                                .reference,
                                                            {
                                                              ...mapToFirestore(
                                                                {
                                                                  'members':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    searchResultsItem
                                                                        .reference
                                                                  ]),
                                                                  'numberofMembers':
                                                                      FieldValue
                                                                          .increment(
                                                                              -(1)),
                                                                },
                                                              ),
                                                            });
                                                        if (functions.checkTodayDate(
                                                            addGroupPeopleGlobalGroupsDataRecord
                                                                ?.currentDay)!) {
                                                          firestoreBatch.update(
                                                              addGroupPeopleGlobalGroupsDataRecord!
                                                                  .reference,
                                                              {
                                                                ...mapToFirestore(
                                                                  {
                                                                    'peopleRemoved':
                                                                        FieldValue
                                                                            .increment(1),
                                                                  },
                                                                ),
                                                              });
                                                        } else {
                                                          var globalGroupsDataRecordReference =
                                                              GlobalGroupsDataRecord
                                                                  .collection
                                                                  .doc();
                                                          firestoreBatch.set(
                                                              globalGroupsDataRecordReference,
                                                              createGlobalGroupsDataRecordData(
                                                                dayInteger:
                                                                    addGroupPeopleGlobalGroupsDataRecord
                                                                        ?.dayInteger,
                                                                currentDay:
                                                                    functions
                                                                        .getDayDate(),
                                                              ));
                                                          _model.newDate3 =
                                                              GlobalGroupsDataRecord
                                                                  .getDocumentFromData(
                                                                      createGlobalGroupsDataRecordData(
                                                                        dayInteger:
                                                                            addGroupPeopleGlobalGroupsDataRecord?.dayInteger,
                                                                        currentDay:
                                                                            functions.getDayDate(),
                                                                      ),
                                                                      globalGroupsDataRecordReference);

                                                          firestoreBatch.update(
                                                              _model.newDate3!
                                                                  .reference,
                                                              {
                                                                ...mapToFirestore(
                                                                  {
                                                                    'dayInteger':
                                                                        FieldValue
                                                                            .increment(1),
                                                                    'peopleRemoved':
                                                                        FieldValue
                                                                            .increment(1),
                                                                  },
                                                                ),
                                                              });
                                                        }
                                                      } finally {
                                                        await firestoreBatch
                                                            .commit();
                                                      }

                                                      setState(() {});
                                                    }
                                                  },
                                                  title: Text(
                                                    searchResultsItem
                                                        .displayName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
