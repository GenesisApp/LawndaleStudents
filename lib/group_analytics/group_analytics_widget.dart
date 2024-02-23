import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'group_analytics_model.dart';
export 'group_analytics_model.dart';

class GroupAnalyticsWidget extends StatefulWidget {
  const GroupAnalyticsWidget({super.key});

  @override
  State<GroupAnalyticsWidget> createState() => _GroupAnalyticsWidgetState();
}

class _GroupAnalyticsWidgetState extends State<GroupAnalyticsWidget> {
  late GroupAnalyticsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GroupAnalyticsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().OneWeekAdmin = true;
        FFAppState().OneMonthAdmin = false;
        FFAppState().SixMonthsAdmin = false;
        FFAppState().OneYearAdmin = false;
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<GroupsRecord>>(
      future: queryGroupsRecordOnce(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).systemBackground,
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
        List<GroupsRecord> groupAnalyticsGroupsRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).systemBackground,
            body: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                  's9phvsaq' /* Hello, */,
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
                              FaIcon(
                                FontAwesomeIcons.chartPie,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              22.0, 8.0, 0.0, 35.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'xb5p2ks9' /* Welcome to your Groups Dashboa... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .lightSecondaryText,
                                ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  22.0, 0.0, 22.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondarySystemBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                  'adminGroupsViewAll');
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.people_alt,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        size: 24.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: SelectionArea(
                                                            child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '5cjce3sj' /* Total Groups: */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 16.0,
                                                              ),
                                                        )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 20.0, 0.0),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    groupAnalyticsGroupsRecordList
                                                        .length
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          fontSize: 16.0,
                                                        ),
                                                  )),
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
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'cp9pmy1o' /* Avg. Group Size:  */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          fontSize: 14.0,
                                        ),
                                  ),
                                  Text(
                                    functions
                                        .avgMembers(
                                            groupAnalyticsGroupsRecordList
                                                .map((e) => e.members.length)
                                                .toList())
                                        .toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          fontSize: 14.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              22.0, 20.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'g084se4v' /* Total Groups Stats */,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              22.0, 20.0, 22.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!FFAppState().OneWeekAdmin)
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.2,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondarySystemBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            HapticFeedback.lightImpact();
                                            FFAppState().update(() {
                                              FFAppState().OneWeekAdmin = true;
                                              FFAppState().OneMonthAdmin =
                                                  false;
                                            });
                                            FFAppState().update(() {
                                              FFAppState().SixMonthsAdmin =
                                                  false;
                                              FFAppState().OneYearAdmin = false;
                                            });
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'poa5jsd0' /* 1 Week */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 14.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (FFAppState().OneWeekAdmin)
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.2,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x1C000000),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: Color(0x66000000),
                                        ),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiarySystemBackground,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '7iwna87y' /* 1 Week */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 14.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!FFAppState().OneMonthAdmin)
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.2,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondarySystemBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Visibility(
                                          visible: !FFAppState().OneMonthAdmin,
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              HapticFeedback.lightImpact();
                                              FFAppState().update(() {
                                                FFAppState().OneWeekAdmin =
                                                    false;
                                                FFAppState().OneMonthAdmin =
                                                    true;
                                              });
                                              FFAppState().update(() {
                                                FFAppState().SixMonthsAdmin =
                                                    false;
                                                FFAppState().OneYearAdmin =
                                                    false;
                                              });
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '1wvqnww7' /* 1 Month */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (FFAppState().OneMonthAdmin)
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.2,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x1C000000),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: Color(0x66000000),
                                        ),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiarySystemBackground,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '9iy20j31' /* 1 Month */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 14.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!FFAppState().SixMonthsAdmin)
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.2,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondarySystemBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            HapticFeedback.lightImpact();
                                            FFAppState().update(() {
                                              FFAppState().OneWeekAdmin = false;
                                              FFAppState().OneMonthAdmin =
                                                  false;
                                            });
                                            FFAppState().update(() {
                                              FFAppState().SixMonthsAdmin =
                                                  true;
                                              FFAppState().OneYearAdmin = false;
                                            });
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'awf1xr0y' /* 6 Months */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 14.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (FFAppState().SixMonthsAdmin)
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.2,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x1C000000),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: Color(0x66000000),
                                        ),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiarySystemBackground,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'purmsgob' /* 6 Months */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 14.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!FFAppState().OneYearAdmin)
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.2,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondarySystemBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            HapticFeedback.lightImpact();
                                            FFAppState().update(() {
                                              FFAppState().OneWeekAdmin = false;
                                              FFAppState().OneMonthAdmin =
                                                  false;
                                            });
                                            FFAppState().update(() {
                                              FFAppState().SixMonthsAdmin =
                                                  false;
                                              FFAppState().OneYearAdmin = true;
                                            });
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'uy44alun' /* 1 Year */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 14.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (FFAppState().OneYearAdmin)
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.2,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x1C000000),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: Color(0x66000000),
                                        ),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiarySystemBackground,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ibf7p7cx' /* 1 Year */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 14.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (FFAppState().OneWeekAdmin)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                22.0, 20.0, 22.0, 0.0),
                            child: FutureBuilder<List<GlobalGroupsDataRecord>>(
                              future: queryGlobalGroupsDataRecordOnce(
                                queryBuilder: (globalGroupsDataRecord) =>
                                    globalGroupsDataRecord.orderBy('dayInteger',
                                        descending: true),
                                limit: 7,
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
                                List<GlobalGroupsDataRecord>
                                    containerGlobalGroupsDataRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondarySystemBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Container(
                                            width: 350.0,
                                            height: 300.0,
                                            child: Stack(
                                              children: [
                                                FlutterFlowLineChart(
                                                  data: [
                                                    FFLineChartData(
                                                      xData:
                                                          containerGlobalGroupsDataRecordList
                                                              .map((d) =>
                                                                  d.dayInteger)
                                                              .toList(),
                                                      yData: containerGlobalGroupsDataRecordList
                                                          .map((d) => d
                                                              .totalAttendancefortheDay)
                                                          .toList(),
                                                      settings:
                                                          LineChartBarData(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .worshipRing,
                                                        barWidth: 1.0,
                                                        isCurved: true,
                                                        preventCurveOverShooting:
                                                            true,
                                                      ),
                                                    ),
                                                    FFLineChartData(
                                                      xData:
                                                          containerGlobalGroupsDataRecordList
                                                              .map((d) =>
                                                                  d.dayInteger)
                                                              .toList(),
                                                      yData:
                                                          containerGlobalGroupsDataRecordList
                                                              .map((d) =>
                                                                  d.peopleAdded)
                                                              .toList(),
                                                      settings:
                                                          LineChartBarData(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .scriptureRing,
                                                        barWidth: 1.0,
                                                        isCurved: true,
                                                        preventCurveOverShooting:
                                                            true,
                                                      ),
                                                    ),
                                                    FFLineChartData(
                                                      xData:
                                                          containerGlobalGroupsDataRecordList
                                                              .map((d) =>
                                                                  d.dayInteger)
                                                              .toList(),
                                                      yData:
                                                          containerGlobalGroupsDataRecordList
                                                              .map((d) => d
                                                                  .peopleRemoved)
                                                              .toList(),
                                                      settings:
                                                          LineChartBarData(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .prayerRing,
                                                        barWidth: 1.0,
                                                        isCurved: true,
                                                        preventCurveOverShooting:
                                                            true,
                                                      ),
                                                    )
                                                  ],
                                                  chartStylingInfo:
                                                      ChartStylingInfo(
                                                    enableTooltip: true,
                                                    tooltipBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondarySystemBackground,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    showGrid: true,
                                                    showBorder: false,
                                                  ),
                                                  axisBounds: AxisBounds(),
                                                  xAxisLabelInfo:
                                                      AxisLabelInfo(),
                                                  yAxisLabelInfo:
                                                      AxisLabelInfo(),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child:
                                                      FlutterFlowChartLegendWidget(
                                                    entries: [
                                                      LegendEntry(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .worshipRing,
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'x9hi7c3i' /* Attendance */,
                                                          )),
                                                      LegendEntry(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .scriptureRing,
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'p8ktshus' /* People Added */,
                                                          )),
                                                      LegendEntry(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .prayerRing,
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'uuuhuwea' /* People Removed */,
                                                          )),
                                                    ],
                                                    width: 100.0,
                                                    height: 50.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                    textPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    borderWidth: 0.0,
                                                    borderColor:
                                                        Colors.transparent,
                                                    indicatorSize: 10.0,
                                                  ),
                                                ),
                                              ],
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
                        if (FFAppState().OneMonthAdmin)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                22.0, 20.0, 22.0, 0.0),
                            child: FutureBuilder<List<GlobalGroupsDataRecord>>(
                              future: queryGlobalGroupsDataRecordOnce(
                                queryBuilder: (globalGroupsDataRecord) =>
                                    globalGroupsDataRecord.orderBy('dayInteger',
                                        descending: true),
                                limit: 30,
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
                                List<GlobalGroupsDataRecord>
                                    containerGlobalGroupsDataRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondarySystemBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Container(
                                            width: 350.0,
                                            height: 300.0,
                                            child: Stack(
                                              children: [
                                                FlutterFlowLineChart(
                                                  data: [
                                                    FFLineChartData(
                                                      xData:
                                                          containerGlobalGroupsDataRecordList
                                                              .map((d) =>
                                                                  d.dayInteger)
                                                              .toList(),
                                                      yData: containerGlobalGroupsDataRecordList
                                                          .map((d) => d
                                                              .totalAttendancefortheDay)
                                                          .toList(),
                                                      settings:
                                                          LineChartBarData(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .worshipRing,
                                                        barWidth: 1.0,
                                                        isCurved: true,
                                                        preventCurveOverShooting:
                                                            true,
                                                      ),
                                                    ),
                                                    FFLineChartData(
                                                      xData:
                                                          containerGlobalGroupsDataRecordList
                                                              .map((d) =>
                                                                  d.dayInteger)
                                                              .toList(),
                                                      yData:
                                                          containerGlobalGroupsDataRecordList
                                                              .map((d) =>
                                                                  d.peopleAdded)
                                                              .toList(),
                                                      settings:
                                                          LineChartBarData(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .scriptureRing,
                                                        barWidth: 1.0,
                                                        isCurved: true,
                                                        preventCurveOverShooting:
                                                            true,
                                                      ),
                                                    ),
                                                    FFLineChartData(
                                                      xData:
                                                          containerGlobalGroupsDataRecordList
                                                              .map((d) =>
                                                                  d.dayInteger)
                                                              .toList(),
                                                      yData:
                                                          containerGlobalGroupsDataRecordList
                                                              .map((d) => d
                                                                  .peopleRemoved)
                                                              .toList(),
                                                      settings:
                                                          LineChartBarData(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .prayerRing,
                                                        barWidth: 1.0,
                                                        isCurved: true,
                                                        preventCurveOverShooting:
                                                            true,
                                                      ),
                                                    )
                                                  ],
                                                  chartStylingInfo:
                                                      ChartStylingInfo(
                                                    enableTooltip: true,
                                                    tooltipBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondarySystemBackground,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    showGrid: true,
                                                    showBorder: false,
                                                  ),
                                                  axisBounds: AxisBounds(),
                                                  xAxisLabelInfo:
                                                      AxisLabelInfo(),
                                                  yAxisLabelInfo:
                                                      AxisLabelInfo(),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child:
                                                      FlutterFlowChartLegendWidget(
                                                    entries: [
                                                      LegendEntry(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .worshipRing,
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'a0jh0xy3' /* Attendance */,
                                                          )),
                                                      LegendEntry(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .scriptureRing,
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'z5xnt76w' /* People Added */,
                                                          )),
                                                      LegendEntry(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .prayerRing,
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'nbnvi8es' /* People Removed */,
                                                          )),
                                                    ],
                                                    width: 100.0,
                                                    height: 50.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                    textPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    borderWidth: 0.0,
                                                    borderColor:
                                                        Colors.transparent,
                                                    indicatorSize: 10.0,
                                                  ),
                                                ),
                                              ],
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
                        if (FFAppState().SixMonthsAdmin)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                22.0, 20.0, 22.0, 0.0),
                            child: FutureBuilder<List<GlobalGroupsDataRecord>>(
                              future: queryGlobalGroupsDataRecordOnce(
                                queryBuilder: (globalGroupsDataRecord) =>
                                    globalGroupsDataRecord.orderBy('dayInteger',
                                        descending: true),
                                limit: 180,
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
                                List<GlobalGroupsDataRecord>
                                    containerGlobalGroupsDataRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondarySystemBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Container(
                                            width: 350.0,
                                            height: 300.0,
                                            child: Stack(
                                              children: [
                                                FlutterFlowLineChart(
                                                  data: [
                                                    FFLineChartData(
                                                      xData:
                                                          containerGlobalGroupsDataRecordList
                                                              .map((d) =>
                                                                  d.dayInteger)
                                                              .toList(),
                                                      yData: containerGlobalGroupsDataRecordList
                                                          .map((d) => d
                                                              .totalAttendancefortheDay)
                                                          .toList(),
                                                      settings:
                                                          LineChartBarData(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .worshipRing,
                                                        barWidth: 1.0,
                                                        isCurved: true,
                                                        preventCurveOverShooting:
                                                            true,
                                                      ),
                                                    ),
                                                    FFLineChartData(
                                                      xData:
                                                          containerGlobalGroupsDataRecordList
                                                              .map((d) =>
                                                                  d.dayInteger)
                                                              .toList(),
                                                      yData:
                                                          containerGlobalGroupsDataRecordList
                                                              .map((d) =>
                                                                  d.peopleAdded)
                                                              .toList(),
                                                      settings:
                                                          LineChartBarData(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .scriptureRing,
                                                        barWidth: 1.0,
                                                        isCurved: true,
                                                        preventCurveOverShooting:
                                                            true,
                                                      ),
                                                    ),
                                                    FFLineChartData(
                                                      xData:
                                                          containerGlobalGroupsDataRecordList
                                                              .map((d) =>
                                                                  d.dayInteger)
                                                              .toList(),
                                                      yData:
                                                          containerGlobalGroupsDataRecordList
                                                              .map((d) => d
                                                                  .peopleRemoved)
                                                              .toList(),
                                                      settings:
                                                          LineChartBarData(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .prayerRing,
                                                        barWidth: 1.0,
                                                        isCurved: true,
                                                        preventCurveOverShooting:
                                                            true,
                                                      ),
                                                    )
                                                  ],
                                                  chartStylingInfo:
                                                      ChartStylingInfo(
                                                    enableTooltip: true,
                                                    tooltipBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondarySystemBackground,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    showGrid: true,
                                                    showBorder: false,
                                                  ),
                                                  axisBounds: AxisBounds(),
                                                  xAxisLabelInfo:
                                                      AxisLabelInfo(),
                                                  yAxisLabelInfo:
                                                      AxisLabelInfo(),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child:
                                                      FlutterFlowChartLegendWidget(
                                                    entries: [
                                                      LegendEntry(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .worshipRing,
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'aj3mc7me' /* Attendance */,
                                                          )),
                                                      LegendEntry(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .scriptureRing,
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '2aclrr1t' /* People Added */,
                                                          )),
                                                      LegendEntry(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .prayerRing,
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '2u5b2k5t' /* People Removed */,
                                                          )),
                                                    ],
                                                    width: 100.0,
                                                    height: 50.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                    textPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    borderWidth: 0.0,
                                                    borderColor:
                                                        Colors.transparent,
                                                    indicatorSize: 10.0,
                                                  ),
                                                ),
                                              ],
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
                        if (FFAppState().OneYearAdmin)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                22.0, 20.0, 22.0, 0.0),
                            child: FutureBuilder<List<GlobalGroupsDataRecord>>(
                              future: queryGlobalGroupsDataRecordOnce(
                                queryBuilder: (globalGroupsDataRecord) =>
                                    globalGroupsDataRecord.orderBy('dayInteger',
                                        descending: true),
                                limit: 365,
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
                                List<GlobalGroupsDataRecord>
                                    containerGlobalGroupsDataRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondarySystemBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Container(
                                            width: 350.0,
                                            height: 300.0,
                                            child: Stack(
                                              children: [
                                                FlutterFlowLineChart(
                                                  data: [
                                                    FFLineChartData(
                                                      xData:
                                                          containerGlobalGroupsDataRecordList
                                                              .map((d) =>
                                                                  d.dayInteger)
                                                              .toList(),
                                                      yData: containerGlobalGroupsDataRecordList
                                                          .map((d) => d
                                                              .totalAttendancefortheDay)
                                                          .toList(),
                                                      settings:
                                                          LineChartBarData(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .worshipRing,
                                                        barWidth: 1.0,
                                                        isCurved: true,
                                                        preventCurveOverShooting:
                                                            true,
                                                      ),
                                                    ),
                                                    FFLineChartData(
                                                      xData:
                                                          containerGlobalGroupsDataRecordList
                                                              .map((d) =>
                                                                  d.dayInteger)
                                                              .toList(),
                                                      yData:
                                                          containerGlobalGroupsDataRecordList
                                                              .map((d) =>
                                                                  d.peopleAdded)
                                                              .toList(),
                                                      settings:
                                                          LineChartBarData(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .scriptureRing,
                                                        barWidth: 1.0,
                                                        isCurved: true,
                                                        preventCurveOverShooting:
                                                            true,
                                                      ),
                                                    ),
                                                    FFLineChartData(
                                                      xData:
                                                          containerGlobalGroupsDataRecordList
                                                              .map((d) =>
                                                                  d.dayInteger)
                                                              .toList(),
                                                      yData:
                                                          containerGlobalGroupsDataRecordList
                                                              .map((d) => d
                                                                  .peopleRemoved)
                                                              .toList(),
                                                      settings:
                                                          LineChartBarData(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .prayerRing,
                                                        barWidth: 1.0,
                                                        isCurved: true,
                                                        preventCurveOverShooting:
                                                            true,
                                                      ),
                                                    )
                                                  ],
                                                  chartStylingInfo:
                                                      ChartStylingInfo(
                                                    enableTooltip: true,
                                                    tooltipBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondarySystemBackground,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    showGrid: true,
                                                    showBorder: false,
                                                  ),
                                                  axisBounds: AxisBounds(),
                                                  xAxisLabelInfo:
                                                      AxisLabelInfo(),
                                                  yAxisLabelInfo:
                                                      AxisLabelInfo(),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child:
                                                      FlutterFlowChartLegendWidget(
                                                    entries: [
                                                      LegendEntry(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .worshipRing,
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'n7pwpyge' /* Attendance */,
                                                          )),
                                                      LegendEntry(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .scriptureRing,
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'mafqt3wt' /* People Added */,
                                                          )),
                                                      LegendEntry(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .prayerRing,
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'ogtvxcfa' /* People Removed */,
                                                          )),
                                                    ],
                                                    width: 100.0,
                                                    height: 50.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                    textPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    borderWidth: 0.0,
                                                    borderColor:
                                                        Colors.transparent,
                                                    indicatorSize: 10.0,
                                                  ),
                                                ),
                                              ],
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              22.0, 20.0, 22.0, 0.0),
                          child: FutureBuilder<int>(
                            future: queryUsersRecordCount(
                              queryBuilder: (usersRecord) => usersRecord
                                  .where(
                                    'inaGroup',
                                    isEqualTo: true,
                                  )
                                  .where(
                                    'lastAttendance',
                                    isLessThanOrEqualTo:
                                        functions.dateFromThirtyDaysAgo(),
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
                              int menuItemCount = snapshot.data!;
                              return Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('FollowupNeeded');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondarySystemBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 2.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons
                                                        .heartBroken,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 20.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '8ymlngm2' /* Follow Up Needed: */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 20.0, 0.0),
                                            child: Text(
                                              menuItemCount.toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              22.0, 20.0, 22.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.42,
                                height: 75.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('adminGroupsViewOpen');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondarySystemBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          18.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ahhjr45m' /* Open Groups */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                        ),
                                              ),
                                              Icon(
                                                Icons.chevron_right_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 18.0,
                                              ),
                                            ],
                                          ),
                                          Text(
                                            groupAnalyticsGroupsRecordList
                                                .where((e) => e.openGroup)
                                                .toList()
                                                .length
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 16.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 20.0,
                                  decoration: BoxDecoration(),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.42,
                                height: 75.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('adminGroupsViewClosed');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondarySystemBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          18.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '443jq5jc' /* Closed Groups */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                        ),
                                              ),
                                              Icon(
                                                Icons.chevron_right_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 18.0,
                                              ),
                                            ],
                                          ),
                                          Text(
                                            groupAnalyticsGroupsRecordList
                                                .where((e) => e.closedGroup)
                                                .toList()
                                                .length
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 16.0,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              22.0, 20.0, 22.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.42,
                                height: 75.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: FutureBuilder<int>(
                                  future: queryGroupRatingsRecordCount(),
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
                                    int containerCount = snapshot.data!;
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                            'adminGroupsRatingsView');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondarySystemBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  18.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '3hzg6wnn' /* All Ratings */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons.chevron_right_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 18.0,
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                containerCount.toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          fontSize: 16.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 20.0,
                                  decoration: BoxDecoration(),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.42,
                                height: 75.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: FutureBuilder<
                                    List<GlobalGroupRatingsRecord>>(
                                  future: queryGlobalGroupRatingsRecordOnce(),
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
                                    List<GlobalGroupRatingsRecord>
                                        containerGlobalGroupRatingsRecordList =
                                        snapshot.data!;
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondarySystemBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            18.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'tcqn9s6e' /* Average Rating */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '${functions.percentagefromList(containerGlobalGroupRatingsRecordList.map((e) => e.groupRatingNumber).toList(), containerGlobalGroupRatingsRecordList.map((e) => e.reference).toList(), containerGlobalGroupRatingsRecordList.toList()).toString()}%',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
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
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              22.0, 20.0, 22.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.42,
                                height: 75.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: FutureBuilder<int>(
                                  future: queryUsersRecordCount(
                                    queryBuilder: (usersRecord) =>
                                        usersRecord.where(
                                      'lastAttendance',
                                      isGreaterThanOrEqualTo:
                                          functions.dateFromThirtyDaysAgo(),
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
                                    int containerCount = snapshot.data!;
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('recentCheckins');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondarySystemBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  18.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '2gjh345t' /* Recent People */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons.chevron_right_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 18.0,
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  containerCount.toString(),
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          fontSize: 16.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 20.0,
                                  decoration: BoxDecoration(),
                                ),
                              ),
                              FutureBuilder<int>(
                                future: queryUsersRecordCount(
                                  queryBuilder: (usersRecord) =>
                                      usersRecord.where(
                                    'inaGroup',
                                    isEqualTo: true,
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
                                  int containerCount = snapshot.data!;
                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.42,
                                    height: 75.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context
                                            .pushNamed('AllProfilesinGroups');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondarySystemBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  18.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '6rhhujoc' /* People in Groups */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons.chevron_right_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 18.0,
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                containerCount.toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          fontSize: 16.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.15,
                          decoration: BoxDecoration(),
                        ),
                      ],
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
