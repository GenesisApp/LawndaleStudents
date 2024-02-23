import '/backend/backend.dart';
import '/components/profile_quickview_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'all_profiles_with_tag_model.dart';
export 'all_profiles_with_tag_model.dart';

class AllProfilesWithTagWidget extends StatefulWidget {
  const AllProfilesWithTagWidget({
    super.key,
    this.tagSelected,
  });

  final ProfileTagsRecord? tagSelected;

  @override
  State<AllProfilesWithTagWidget> createState() =>
      _AllProfilesWithTagWidgetState();
}

class _AllProfilesWithTagWidgetState extends State<AllProfilesWithTagWidget> {
  late AllProfilesWithTagModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllProfilesWithTagModel());

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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.05,
                decoration: BoxDecoration(),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.05,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          FFAppState().update(() {
                            FFAppState().showFullList = true;
                          });
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
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.tagSelected!.tagName,
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).label,
                            fontSize: 22.0,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'AddTagPeople',
                            queryParameters: {
                              'tagChosen': serializeParam(
                                widget.tagSelected,
                                ParamType.Document,
                              ),
                              'tagChosenRef': serializeParam(
                                widget.tagSelected?.reference,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'tagChosen': widget.tagSelected,
                            },
                          );
                        },
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondarySystemBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Icon(
                            Icons.group_add,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 26.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 35.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.85,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Text(
                          widget.tagSelected!.tagDescription,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).systemGray,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.89,
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
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onFieldSubmitted: (_) async {
                                  await queryUsersRecordOnce()
                                      .then(
                                        (records) => _model
                                            .simpleSearchResults = TextSearch(
                                          records
                                              .map(
                                                (record) =>
                                                    TextSearchItem.fromTerms(
                                                        record, [
                                                  record.displayName!,
                                                  record.email!
                                                ]),
                                              )
                                              .toList(),
                                        )
                                            .search(_model.textController.text)
                                            .map((r) => r.object)
                                            .take(50)
                                            .toList(),
                                      )
                                      .onError((_, __) =>
                                          _model.simpleSearchResults = [])
                                      .whenComplete(() => setState(() {}));

                                  if (_model.textController.text != null &&
                                      _model.textController.text != '') {
                                    FFAppState().update(() {
                                      FFAppState().showFullList = false;
                                    });
                                  }
                                },
                                textCapitalization: TextCapitalization.words,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'i2vggon5' /* Search by Name or Email... */,
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
              if (FFAppState().showFullList)
                StreamBuilder<List<UsersRecord>>(
                  stream: queryUsersRecord(
                    queryBuilder: (usersRecord) => usersRecord
                        .where(
                          'tags',
                          arrayContains: widget.tagSelected?.reference,
                        )
                        .orderBy('display_name'),
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
                    List<UsersRecord> columnUsersRecordList = snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(columnUsersRecordList.length,
                            (columnIndex) {
                          final columnUsersRecord =
                              columnUsersRecordList[columnIndex];
                          return ProfileQuickviewWidget(
                            key: Key(
                                'Key9xa_${columnIndex}_of_${columnUsersRecordList.length}'),
                            userInListRef: columnUsersRecord.reference,
                            userInListDoc: columnUsersRecord,
                          );
                        }),
                      ),
                    );
                  },
                ),
              if (!FFAppState().showFullList)
                Builder(
                  builder: (context) {
                    final searchResults = _model.simpleSearchResults.toList();
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(searchResults.length,
                            (searchResultsIndex) {
                          final searchResultsItem =
                              searchResults[searchResultsIndex];
                          return Visibility(
                            visible: searchResultsItem.tags
                                .contains(widget.tagSelected?.reference),
                            child: ProfileQuickviewWidget(
                              key: Key(
                                  'Key6x6_${searchResultsIndex}_of_${searchResults.length}'),
                              userInListRef: searchResultsItem.reference,
                              userInListDoc: searchResultsItem,
                            ),
                          );
                        }),
                      ),
                    );
                  },
                ),
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
