import '/backend/backend.dart';
import '/components/community_prayer_request_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'all_prayer_list_model.dart';
export 'all_prayer_list_model.dart';

class AllPrayerListWidget extends StatefulWidget {
  const AllPrayerListWidget({Key? key}) : super(key: key);

  @override
  _AllPrayerListWidgetState createState() => _AllPrayerListWidgetState();
}

class _AllPrayerListWidgetState extends State<AllPrayerListWidget> {
  late AllPrayerListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllPrayerListModel());

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primary,
      body: SafeArea(
        top: true,
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Stack(
            alignment: AlignmentDirectional(0.0, 0.0),
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
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
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'oend1loc' /* Prayer Requests */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context).label,
                                      fontSize: 22.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
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
                                    color: Colors.transparent,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.89,
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
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        onFieldSubmitted: (_) async {
                                          await queryPrayerRequestsRecordOnce()
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
                                                          record.usersName!
                                                        ]),
                                                      )
                                                      .toList(),
                                                )
                                                        .search(_model
                                                            .textController
                                                            .text)
                                                        .map((r) => r.object)
                                                        .take(50)
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
                                            FFAppState().update(() {
                                              FFAppState().showFullList = false;
                                            });
                                          }
                                        },
                                        textCapitalization:
                                            TextCapitalization.words,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            '2y0basl4' /* Search People... */,
                                          ),
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lightSecondaryText,
                                                fontSize: 16.0,
                                              ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                            color: FlutterFlowTheme.of(context)
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
                      if (FFAppState().showFullList)
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 20.0),
                            child: FutureBuilder<List<PrayerRequestsRecord>>(
                              future: queryPrayerRequestsRecordOnce(
                                queryBuilder: (prayerRequestsRecord) =>
                                    prayerRequestsRecord
                                        .where(
                                          'public',
                                          isEqualTo: true,
                                        )
                                        .orderBy('timeUploaded',
                                            descending: true),
                                limit: 20,
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
                                List<PrayerRequestsRecord>
                                    columnPrayerRequestsRecordList =
                                    snapshot.data!;
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      columnPrayerRequestsRecordList.length,
                                      (columnIndex) {
                                    final columnPrayerRequestsRecord =
                                        columnPrayerRequestsRecordList[
                                            columnIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: FutureBuilder<UsersRecord>(
                                        future: UsersRecord.getDocumentOnce(
                                            columnPrayerRequestsRecord.user!),
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
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            constraints: BoxConstraints(
                                              maxWidth: double.infinity,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                            child: CommunityPrayerRequestWidget(
                                              key: Key(
                                                  'Keynqe_${columnIndex}_of_${columnPrayerRequestsRecordList.length}'),
                                              chosenPrayerRequestDoc:
                                                  columnPrayerRequestsRecord,
                                              chosenPrayerRequestRef:
                                                  columnPrayerRequestsRecord
                                                      .reference,
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                        ),
                      if (!FFAppState().showFullList)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 20.0),
                          child: Builder(
                            builder: (context) {
                              final searchResult =
                                  _model.simpleSearchResults.toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: searchResult.length,
                                itemBuilder: (context, searchResultIndex) {
                                  final searchResultItem =
                                      searchResult[searchResultIndex];
                                  return CommunityPrayerRequestWidget(
                                    key: Key(
                                        'Key6w6_${searchResultIndex}_of_${searchResult.length}'),
                                    chosenPrayerRequestDoc: searchResultItem,
                                    chosenPrayerRequestRef:
                                        searchResultItem.reference,
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
            ],
          ),
        ),
      ),
    );
  }
}
