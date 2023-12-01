import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/people_added_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_friends_chat_model.dart';
export 'add_friends_chat_model.dart';

class AddFriendsChatWidget extends StatefulWidget {
  const AddFriendsChatWidget({
    Key? key,
    this.chatChosen,
    this.chatUsers,
  }) : super(key: key);

  final MessageChatsRecord? chatChosen;
  final DocumentReference? chatUsers;

  @override
  _AddFriendsChatWidgetState createState() => _AddFriendsChatWidgetState();
}

class _AddFriendsChatWidgetState extends State<AddFriendsChatWidget> {
  late AddFriendsChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddFriendsChatModel());

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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var messagesRecordReference = MessagesRecord.collection.doc();
            await messagesRecordReference.set(createMessagesRecordData(
              messageText: '${valueOrDefault<String>(
                currentUserDisplayName,
                'Guest User',
              )} just added more people to the chat!',
              timeSent: getCurrentTimestamp,
              userName: 'System Message',
              chatReference: widget.chatChosen?.reference,
              user: currentUserReference,
            ));
            _model.systemMessage = MessagesRecord.getDocumentFromData(
                createMessagesRecordData(
                  messageText: '${valueOrDefault<String>(
                    currentUserDisplayName,
                    'Guest User',
                  )} just added more people to the chat!',
                  timeSent: getCurrentTimestamp,
                  userName: 'System Message',
                  chatReference: widget.chatChosen?.reference,
                  user: currentUserReference,
                ),
                messagesRecordReference);

            await widget.chatChosen!.reference
                .update(createMessageChatsRecordData(
              authenticatedUser: currentUserReference,
              lastMessageTime: getCurrentTimestamp,
              lastMessage: _model.systemMessage?.messageText,
              lastMessageSentByName: 'System Message',
            ));
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              barrierColor: Color(0x80000000),
              context: context,
              builder: (context) {
                return WebViewAware(
                    child: GestureDetector(
                  onTap: () => _model.unfocusNode.canRequestFocus
                      ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                      : FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: PeopleAddedWidget(
                      chatChosen: widget.chatChosen?.reference,
                      chatChosenDoc: widget.chatChosen,
                    ),
                  ),
                ));
              },
            ).then((value) => safeSetState(() {}));

            setState(() {});
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
            child: Icon(
              Icons.mark_chat_read_rounded,
              color: FlutterFlowTheme.of(context).tertiary,
              size: 26.0,
            ),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 60.0, 40.0, 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
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
                  Text(
                    FFLocalizations.of(context).getText(
                      'gweruc1d' /* Add People */,
                    ),
                    style: FlutterFlowTheme.of(context).displaySmall,
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
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
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
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    onFieldSubmitted: (_) async {
                                      await queryUsersRecordOnce()
                                          .then(
                                            (records) =>
                                                _model.simpleSearchResults =
                                                    TextSearch(
                                              records
                                                  .map(
                                                    (record) => TextSearchItem
                                                        .fromTerms(record, [
                                                      record.email!,
                                                      record.displayName!
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
                                          .onError((_, __) =>
                                              _model.simpleSearchResults = [])
                                          .whenComplete(() => setState(() {}));

                                      if (_model.textController.text != null &&
                                          _model.textController.text != '') {
                                        setState(() {
                                          FFAppState().showFullList = false;
                                        });
                                      }
                                    },
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        'p18hzwp1' /* Search People... */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .lightSecondaryText,
                                            fontSize: 16.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .lightSecondaryText,
                                            fontSize: 16.0,
                                          ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: FlutterFlowTheme.of(context)
                                            .lightSecondaryText,
                                        size: 18.0,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .lightSecondaryText,
                                          fontSize: 16.0,
                                        ),
                                    validator: _model.textControllerValidator
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'v8hh8lh2' /* Search Results */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color:
                                FlutterFlowTheme.of(context).lightSecondaryText,
                            fontSize: 16.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            if (FFAppState().showFullList)
              Expanded(
                child: FutureBuilder<List<UsersRecord>>(
                  future: queryUsersRecordOnce(
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
                    List<UsersRecord> listViewUsersRecordList = snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewUsersRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewUsersRecord =
                            listViewUsersRecordList[listViewIndex];
                        return Visibility(
                          visible: !(currentUserDocument?.blockedPeople
                                          ?.toList() ??
                                      [])
                                  .contains(listViewUsersRecord.reference) &&
                              listViewUsersRecord.messageChats
                                  .contains(widget.chatChosen?.reference),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 16.0, 20.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
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
                                                    listViewUsersRecord] ??= widget
                                                        .chatChosen?.users
                                                        ?.contains(
                                                            listViewUsersRecord
                                                                .reference) ==
                                                    true,
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                              .checkboxListTileValueMap1[
                                                          listViewUsersRecord] =
                                                      newValue!);
                                                  if (newValue!) {
                                                    await listViewUsersRecord
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'messageChats':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            widget.chatChosen
                                                                ?.reference
                                                          ]),
                                                        },
                                                      ),
                                                    });

                                                    await widget
                                                        .chatChosen!.reference
                                                        .update({
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
                                                  } else {
                                                    await listViewUsersRecord
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'messageChats':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            widget.chatChosen
                                                                ?.reference
                                                          ]),
                                                        },
                                                      ),
                                                    });

                                                    await widget
                                                        .chatChosen!.reference
                                                        .update({
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
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            if (!FFAppState().showFullList)
              Expanded(
                child: Builder(
                  builder: (context) {
                    final searchResults = _model.simpleSearchResults.toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: searchResults.length,
                      itemBuilder: (context, searchResultsIndex) {
                        final searchResultsItem =
                            searchResults[searchResultsIndex];
                        return Visibility(
                          visible:
                              !(currentUserDocument?.blockedPeople?.toList() ??
                                      [])
                                  .contains(searchResultsItem.reference),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 16.0, 20.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
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
                                                    searchResultsItem.photoUrl,
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
                                                        .checkboxListTileValueMap2[
                                                    searchResultsItem] ??= widget
                                                        .chatChosen?.users
                                                        ?.contains(
                                                            searchResultsItem
                                                                .reference) ==
                                                    true,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkboxListTileValueMap2[
                                                              searchResultsItem] =
                                                          newValue!);
                                                  if (newValue!) {
                                                    await searchResultsItem
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'messageChats':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            widget.chatChosen
                                                                ?.reference
                                                          ]),
                                                        },
                                                      ),
                                                    });

                                                    await widget
                                                        .chatChosen!.reference
                                                        .update({
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
                                                  } else {
                                                    await searchResultsItem
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'messageChats':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            widget.chatChosen
                                                                ?.reference
                                                          ]),
                                                        },
                                                      ),
                                                    });

                                                    await widget
                                                        .chatChosen!.reference
                                                        .update({
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
                                                  }
                                                },
                                                title: Text(
                                                  searchResultsItem.displayName,
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
    );
  }
}
