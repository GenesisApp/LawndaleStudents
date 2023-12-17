import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/person_blocked_widget.dart';
import '/components/under13_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'create_new_chat_model.dart';
export 'create_new_chat_model.dart';

class CreateNewChatWidget extends StatefulWidget {
  const CreateNewChatWidget({Key? key}) : super(key: key);

  @override
  _CreateNewChatWidgetState createState() => _CreateNewChatWidgetState();
}

class _CreateNewChatWidgetState extends State<CreateNewChatWidget> {
  late CreateNewChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateNewChatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().showFullList = true;
      });
      setState(() {
        _model.textController?.clear();
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
        body: FutureBuilder<List<MessageChatsRecord>>(
          future: queryMessageChatsRecordOnce(
            queryBuilder: (messageChatsRecord) => messageChatsRecord.where(
              'users',
              arrayContains: currentUserReference,
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
            List<MessageChatsRecord> containerMessageChatsRecordList =
                snapshot.data!;
            return Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.08,
                          decoration: BoxDecoration(),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
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
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondarySystemBackground,
                                      borderRadius: BorderRadius.circular(10.0),
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
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController,
                                                focusNode:
                                                    _model.textFieldFocusNode,
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
                                                                            record,
                                                                            [
                                                                      record
                                                                          .email!,
                                                                      record
                                                                          .displayName!
                                                                    ]),
                                                              )
                                                              .toList(),
                                                        )
                                                                .search(_model
                                                                    .textController
                                                                    .text)
                                                                .map((r) =>
                                                                    r.object)
                                                                .toList(),
                                                      )
                                                      .onError((_, __) => _model
                                                              .simpleSearchResults =
                                                          [])
                                                      .whenComplete(() =>
                                                          setState(() {}));

                                                  if (_model.textController
                                                              .text !=
                                                          null &&
                                                      _model.textController
                                                              .text !=
                                                          '') {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .showFullList = false;
                                                    });
                                                  }
                                                },
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'r0l1c5r4' /* Search People... */,
                                                  ),
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lightSecondaryText,
                                                            fontSize: 16.0,
                                                          ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lightSecondaryText,
                                                            fontSize: 16.0,
                                                          ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  errorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
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
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  prefixIcon: Icon(
                                                    Icons.search,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lightSecondaryText,
                                                    size: 18.0,
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState().update(() {
                                                  FFAppState().showFullList =
                                                      true;
                                                });
                                                setState(() {
                                                  _model.textController
                                                      ?.clear();
                                                });
                                              },
                                              child: Icon(
                                                Icons.clear_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '6mbiecub' /* Search Results */,
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
                          StreamBuilder<List<UsersRecord>>(
                            stream: queryUsersRecord(
                              queryBuilder: (usersRecord) =>
                                  usersRecord.orderBy('display_name'),
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
                                  snapshot.data!
                                      .where((u) => u.uid != currentUserUid)
                                      .toList();
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
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.08,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondarySystemBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: Colors.transparent,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              listViewUsersRecord
                                                                  .photoUrl,
                                                              'https://www.chocolatebayou.org/wp-content/uploads/No-Image-Person-2048x2048.jpeg',
                                                            ),
                                                          ).image,
                                                        ),
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        listViewUsersRecord
                                                            .displayName,
                                                        'Guest User',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily: 'Inter',
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (!(!(currentUserDocument
                                                                  ?.blockedBy
                                                                  ?.toList() ??
                                                              [])
                                                          .contains(
                                                              listViewUsersRecord
                                                                  .reference) &&
                                                      !listViewUsersRecord
                                                          .blockedBy
                                                          .contains(
                                                              currentUserReference))) {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      barrierColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .opagueSeparator,
                                                      enableDrag: false,
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
                                                                PersonBlockedWidget(),
                                                          ),
                                                        ));
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  }
                                                  if (functions.ageCheck(
                                                          currentUserDocument
                                                              ?.birthday,
                                                          currentUserReference)! ||
                                                      functions.ageCheck(
                                                          listViewUsersRecord
                                                              .birthday,
                                                          listViewUsersRecord
                                                              .reference)!) {
                                                    if (listViewUsersRecord
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
                                                              listViewUsersRecord
                                                                  .reference,
                                                          archived: false,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'users': [
                                                              listViewUsersRecord
                                                                  .reference
                                                            ],
                                                            'userswithNotificationsOn':
                                                                [
                                                              listViewUsersRecord
                                                                  .reference
                                                            ],
                                                          },
                                                        ),
                                                      });
                                                      _model.newGroup1 =
                                                          MessageChatsRecord
                                                              .getDocumentFromData({
                                                        ...createMessageChatsRecordData(
                                                          authenticatedUser:
                                                              currentUserReference,
                                                          otherUser:
                                                              listViewUsersRecord
                                                                  .reference,
                                                          archived: false,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'users': [
                                                              listViewUsersRecord
                                                                  .reference
                                                            ],
                                                            'userswithNotificationsOn':
                                                                [
                                                              listViewUsersRecord
                                                                  .reference
                                                            ],
                                                          },
                                                        ),
                                                      }, messageChatsRecordReference1);

                                                      await listViewUsersRecord
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'messageChats':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              _model.newGroup1
                                                                  ?.reference
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                      if (Navigator.of(context)
                                                          .canPop()) {
                                                        context.pop();
                                                      }
                                                      context.pushNamed(
                                                        'ChatPage',
                                                        queryParameters: {
                                                          'chatUsers':
                                                              serializeParam(
                                                            listViewUsersRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                          'chatChosen':
                                                              serializeParam(
                                                            _model.newGroup1,
                                                            ParamType.Document,
                                                          ),
                                                          'otherUserDoc':
                                                              serializeParam(
                                                            listViewUsersRecord,
                                                            ParamType.Document,
                                                          ),
                                                          'otherUserRef':
                                                              serializeParam(
                                                            listViewUsersRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'chatChosen':
                                                              _model.newGroup1,
                                                          'otherUserDoc':
                                                              listViewUsersRecord,
                                                        },
                                                      );
                                                    } else {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        barrierColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .opagueSeparator,
                                                        enableDrag: false,
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
                                                                  Under13Widget(),
                                                            ),
                                                          ));
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
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
                                                            listViewUsersRecord
                                                                .reference,
                                                        archived: false,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'users': [
                                                            listViewUsersRecord
                                                                .reference
                                                          ],
                                                          'userswithNotificationsOn':
                                                              [
                                                            listViewUsersRecord
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
                                                            listViewUsersRecord
                                                                .reference,
                                                        archived: false,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'users': [
                                                            listViewUsersRecord
                                                                .reference
                                                          ],
                                                          'userswithNotificationsOn':
                                                              [
                                                            listViewUsersRecord
                                                                .reference
                                                          ],
                                                        },
                                                      ),
                                                    }, messageChatsRecordReference2);

                                                    await listViewUsersRecord
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'messageChats':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            _model.newGroup
                                                                ?.reference
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                    if (Navigator.of(context)
                                                        .canPop()) {
                                                      context.pop();
                                                    }
                                                    context.pushNamed(
                                                      'ChatPage',
                                                      queryParameters: {
                                                        'chatUsers':
                                                            serializeParam(
                                                          listViewUsersRecord
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                        'chatChosen':
                                                            serializeParam(
                                                          _model.newGroup,
                                                          ParamType.Document,
                                                        ),
                                                        'otherUserDoc':
                                                            serializeParam(
                                                          listViewUsersRecord,
                                                          ParamType.Document,
                                                        ),
                                                        'otherUserRef':
                                                            serializeParam(
                                                          listViewUsersRecord
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'chatChosen':
                                                            _model.newGroup,
                                                        'otherUserDoc':
                                                            listViewUsersRecord,
                                                      },
                                                    );
                                                  }

                                                  setState(() {
                                                    FFAppState().showFullList =
                                                        true;
                                                  });

                                                  setState(() {});
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
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(6.0, 5.0,
                                                                6.0, 5.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'j3qyg0jp' /* Message */,
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
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        if (!FFAppState().showFullList)
                          Builder(
                            builder: (context) {
                              final searchResults =
                                  _model.simpleSearchResults.toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: searchResults.length,
                                itemBuilder: (context, searchResultsIndex) {
                                  final searchResultsItem =
                                      searchResults[searchResultsIndex];
                                  return Visibility(
                                    visible: searchResultsItem.reference !=
                                        currentUserReference,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 16.0, 20.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.08,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondarySystemBackground,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: Colors.transparent,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                searchResultsItem
                                                                    .photoUrl,
                                                                'https://www.chocolatebayou.org/wp-content/uploads/No-Image-Person-2048x2048.jpeg',
                                                              ),
                                                            ).image,
                                                          ),
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: Colors
                                                                .transparent,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          searchResultsItem
                                                              .displayName,
                                                          'Guest User',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                ),
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
                                                    if (!(!(currentUserDocument
                                                                    ?.blockedBy
                                                                    ?.toList() ??
                                                                [])
                                                            .contains(
                                                                searchResultsItem
                                                                    .reference) &&
                                                        !searchResultsItem
                                                            .blockedBy
                                                            .contains(
                                                                currentUserReference))) {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        barrierColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .opagueSeparator,
                                                        enableDrag: false,
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
                                                                  PersonBlockedWidget(),
                                                            ),
                                                          ));
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    }
                                                    if (functions.ageCheck(
                                                            currentUserDocument
                                                                ?.birthday,
                                                            currentUserReference)! ||
                                                        functions.ageCheck(
                                                            searchResultsItem
                                                                .birthday,
                                                            searchResultsItem
                                                                .reference)!) {
                                                      if (searchResultsItem
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
                                                                searchResultsItem
                                                                    .reference,
                                                            archived: false,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'users': [
                                                                searchResultsItem
                                                                    .reference
                                                              ],
                                                              'userswithNotificationsOn':
                                                                  [
                                                                searchResultsItem
                                                                    .reference
                                                              ],
                                                            },
                                                          ),
                                                        });
                                                        _model.newGroup1Copy =
                                                            MessageChatsRecord
                                                                .getDocumentFromData({
                                                          ...createMessageChatsRecordData(
                                                            authenticatedUser:
                                                                currentUserReference,
                                                            otherUser:
                                                                searchResultsItem
                                                                    .reference,
                                                            archived: false,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'users': [
                                                                searchResultsItem
                                                                    .reference
                                                              ],
                                                              'userswithNotificationsOn':
                                                                  [
                                                                searchResultsItem
                                                                    .reference
                                                              ],
                                                            },
                                                          ),
                                                        }, messageChatsRecordReference1);

                                                        await searchResultsItem
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'messageChats':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                _model
                                                                    .newGroup1Copy
                                                                    ?.reference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        if (Navigator.of(
                                                                context)
                                                            .canPop()) {
                                                          context.pop();
                                                        }
                                                        context.pushNamed(
                                                          'ChatPage',
                                                          queryParameters: {
                                                            'chatUsers':
                                                                serializeParam(
                                                              searchResultsItem
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'chatChosen':
                                                                serializeParam(
                                                              _model
                                                                  .newGroup1Copy,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                            'otherUserDoc':
                                                                serializeParam(
                                                              searchResultsItem,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                            'otherUserRef':
                                                                serializeParam(
                                                              searchResultsItem
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'chatChosen': _model
                                                                .newGroup1Copy,
                                                            'otherUserDoc':
                                                                searchResultsItem,
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
                                                          enableDrag: false,
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
                                                                    Under13Widget(),
                                                              ),
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
                                                              searchResultsItem
                                                                  .reference,
                                                          archived: false,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'users': [
                                                              searchResultsItem
                                                                  .reference
                                                            ],
                                                            'userswithNotificationsOn':
                                                                [
                                                              searchResultsItem
                                                                  .reference
                                                            ],
                                                          },
                                                        ),
                                                      });
                                                      _model.newGroupCopy =
                                                          MessageChatsRecord
                                                              .getDocumentFromData({
                                                        ...createMessageChatsRecordData(
                                                          authenticatedUser:
                                                              currentUserReference,
                                                          otherUser:
                                                              searchResultsItem
                                                                  .reference,
                                                          archived: false,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'users': [
                                                              searchResultsItem
                                                                  .reference
                                                            ],
                                                            'userswithNotificationsOn':
                                                                [
                                                              searchResultsItem
                                                                  .reference
                                                            ],
                                                          },
                                                        ),
                                                      }, messageChatsRecordReference2);

                                                      await searchResultsItem
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'messageChats':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              _model
                                                                  .newGroupCopy
                                                                  ?.reference
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                      if (Navigator.of(context)
                                                          .canPop()) {
                                                        context.pop();
                                                      }
                                                      context.pushNamed(
                                                        'ChatPage',
                                                        queryParameters: {
                                                          'chatUsers':
                                                              serializeParam(
                                                            searchResultsItem
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                          'chatChosen':
                                                              serializeParam(
                                                            _model.newGroupCopy,
                                                            ParamType.Document,
                                                          ),
                                                          'otherUserDoc':
                                                              serializeParam(
                                                            searchResultsItem,
                                                            ParamType.Document,
                                                          ),
                                                          'otherUserRef':
                                                              serializeParam(
                                                            searchResultsItem
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'chatChosen': _model
                                                              .newGroupCopy,
                                                          'otherUserDoc':
                                                              searchResultsItem,
                                                        },
                                                      );
                                                    }

                                                    setState(() {
                                                      FFAppState()
                                                          .showFullList = true;
                                                    });

                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .tertiarySystemBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  6.0,
                                                                  5.0,
                                                                  6.0,
                                                                  5.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'o938ax9y' /* Message */,
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
                                                      ),
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
                        Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
