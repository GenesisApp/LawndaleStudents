import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/account_approval_widget.dart';
import '/components/going_live_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'admin_dashboard_model.dart';
export 'admin_dashboard_model.dart';

class AdminDashboardWidget extends StatefulWidget {
  const AdminDashboardWidget({super.key});

  @override
  State<AdminDashboardWidget> createState() => _AdminDashboardWidgetState();
}

class _AdminDashboardWidgetState extends State<AdminDashboardWidget> {
  late AdminDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminDashboardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation();
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

    return FutureBuilder<int>(
      future: queryUsersRecordCount(
        queryBuilder: (usersRecord) => usersRecord.where(
          'accountApproved',
          isEqualTo: true,
        ),
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
        int adminDashboardCount = snapshot.data!;
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
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 22.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '2vxxm33q' /* Hello, */,
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 0.0, 35.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '8r1n8krs' /* Welcome to your Admin Dashboar... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color:
                                FlutterFlowTheme.of(context).lightSecondaryText,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: FutureBuilder<List<UsersRecord>>(
                                future: queryUsersRecordOnce(
                                  queryBuilder: (usersRecord) =>
                                      usersRecord.where(
                                    'accountWaiting',
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
                                  List<UsersRecord> containerUsersRecordList =
                                      snapshot.data!;
                                  return Container(
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
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
                                              FlutterFlowTheme.of(context)
                                                  .opagueSeparator,
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                              child: GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: Container(
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.8,
                                                    child:
                                                        AccountApprovalWidget(),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondarySystemBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.person,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 24.0,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: SelectionArea(
                                                        child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'afwyku3s' /* Awaiting Approval: */,
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
                                                                    .secondary,
                                                                fontSize: 16.0,
                                                              ),
                                                    )),
                                                  ),
                                                ],
                                              ),
                                              if (containerUsersRecordList
                                                      .length ==
                                                  0)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 20.0, 0.0),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    containerUsersRecordList
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
                                              if (containerUsersRecordList
                                                      .length >
                                                  0)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 0.0, 20.0, 0.0),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    containerUsersRecordList
                                                        .length
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .prayerRing,
                                                          fontSize: 16.0,
                                                        ),
                                                  )),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: SelectionArea(
                                    child: Text(
                                  FFLocalizations.of(context).getText(
                                    'qg8atf16' /* Total Accounts:  */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 14.0,
                                      ),
                                )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 20.0, 0.0),
                          child: SelectionArea(
                              child: Text(
                            adminDashboardCount.toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 14.0,
                                ),
                          )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(22.0, 20.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'vbff8mid' /* Total Journal Completions */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color:
                                FlutterFlowTheme.of(context).lightSecondaryText,
                            fontSize: 16.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          children: [
                            FutureBuilder<int>(
                              future: queryPersonalJournalsRecordCount(
                                queryBuilder: (personalJournalsRecord) =>
                                    personalJournalsRecord.where(
                                  'journalOne',
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
                                      MediaQuery.sizeOf(context).width * 0.275,
                                  height:
                                      MediaQuery.sizeOf(context).width * 0.275,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width *
                                        0.275,
                                    height: MediaQuery.sizeOf(context).width *
                                        0.275,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondarySystemBackground,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: AutoSizeText(
                                          containerCount.toString(),
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                fontSize: 20.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: CircularPercentIndicator(
                                percent: 1.0,
                                radius:
                                    MediaQuery.sizeOf(context).width * 0.138,
                                lineWidth: 5.0,
                                animation: true,
                                animateFromLastPercent: true,
                                progressColor:
                                    FlutterFlowTheme.of(context).worshipRing,
                                backgroundColor: Color(0x1A000000),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          children: [
                            FutureBuilder<int>(
                              future: queryPersonalJournalsRecordCount(
                                queryBuilder: (personalJournalsRecord) =>
                                    personalJournalsRecord.where(
                                  'journalTwo',
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
                                      MediaQuery.sizeOf(context).width * 0.275,
                                  height:
                                      MediaQuery.sizeOf(context).width * 0.275,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondarySystemBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width *
                                        0.275,
                                    height: MediaQuery.sizeOf(context).width *
                                        0.275,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondarySystemBackground,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: AutoSizeText(
                                          containerCount.toString(),
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                fontSize: 20.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: CircularPercentIndicator(
                                percent: 1.0,
                                radius:
                                    MediaQuery.sizeOf(context).width * 0.138,
                                lineWidth: 5.0,
                                animation: true,
                                animateFromLastPercent: true,
                                progressColor: Color(0xFF6D6DAE),
                                backgroundColor: Color(0x1A000000),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 2.0, 0.0),
                          child: Stack(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            children: [
                              FutureBuilder<int>(
                                future: queryPersonalJournalsRecordCount(
                                  queryBuilder: (personalJournalsRecord) =>
                                      personalJournalsRecord.where(
                                    'journalThree',
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
                                    width: MediaQuery.sizeOf(context).width *
                                        0.275,
                                    height: MediaQuery.sizeOf(context).width *
                                        0.275,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondarySystemBackground,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.275,
                                      height: MediaQuery.sizeOf(context).width *
                                          0.275,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondarySystemBackground,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: AutoSizeText(
                                            containerCount.toString(),
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 20.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: CircularPercentIndicator(
                                  percent: 1.0,
                                  radius:
                                      MediaQuery.sizeOf(context).width * 0.138,
                                  lineWidth: 5.0,
                                  animation: true,
                                  animateFromLastPercent: true,
                                  progressColor:
                                      FlutterFlowTheme.of(context).prayerRing,
                                  backgroundColor: Color(0x1A000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(22.0, 20.0, 22.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (!FFAppState().OneWeekAdmin)
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondarySystemBackground,
                                    borderRadius: BorderRadius.circular(8.0),
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
                                        FFAppState().OneMonthAdmin = false;
                                      });
                                      FFAppState().update(() {
                                        FFAppState().SixMonthsAdmin = false;
                                        FFAppState().OneYearAdmin = false;
                                      });
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'dw65iofe' /* 1 Week */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0x1C000000),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0x66000000),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .tertiarySystemBackground,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '456iur5a' /* 1 Week */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondarySystemBackground,
                                    borderRadius: BorderRadius.circular(8.0),
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
                                          FFAppState().OneWeekAdmin = false;
                                          FFAppState().OneMonthAdmin = true;
                                        });
                                        FFAppState().update(() {
                                          FFAppState().SixMonthsAdmin = false;
                                          FFAppState().OneYearAdmin = false;
                                        });
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'kiz5xrq7' /* 1 Month */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
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
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0x1C000000),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0x66000000),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .tertiarySystemBackground,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'xmjlm5c5' /* 1 Month */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondarySystemBackground,
                                    borderRadius: BorderRadius.circular(8.0),
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
                                        FFAppState().OneMonthAdmin = false;
                                      });
                                      FFAppState().update(() {
                                        FFAppState().SixMonthsAdmin = true;
                                        FFAppState().OneYearAdmin = false;
                                      });
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'jg2tngps' /* 6 Months */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0x1C000000),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0x66000000),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .tertiarySystemBackground,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'cryy3o83' /* 6 Months */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondarySystemBackground,
                                    borderRadius: BorderRadius.circular(8.0),
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
                                        FFAppState().OneMonthAdmin = false;
                                      });
                                      FFAppState().update(() {
                                        FFAppState().SixMonthsAdmin = false;
                                        FFAppState().OneYearAdmin = true;
                                      });
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'lxv2xbqb' /* 1 Year */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0x1C000000),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0x66000000),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .tertiarySystemBackground,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '12fwitnt' /* 1 Year */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(22.0, 20.0, 22.0, 0.0),
                      child: FutureBuilder<List<AdminDataRecord>>(
                        future: queryAdminDataRecordOnce(
                          queryBuilder: (adminDataRecord) =>
                              adminDataRecord.orderBy('day', descending: true),
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
                          List<AdminDataRecord> containerAdminDataRecordList =
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 16.0, 0.0),
                                    child: Container(
                                      width: 350.0,
                                      height: 300.0,
                                      child: FlutterFlowLineChart(
                                        data: [
                                          FFLineChartData(
                                            xData: containerAdminDataRecordList
                                                .map((d) => d.day)
                                                .toList(),
                                            yData: containerAdminDataRecordList
                                                .map((d) => d.times1Completed)
                                                .toList(),
                                            settings: LineChartBarData(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .worshipRing,
                                              barWidth: 1.0,
                                              isCurved: true,
                                              preventCurveOverShooting: true,
                                            ),
                                          ),
                                          FFLineChartData(
                                            xData: containerAdminDataRecordList
                                                .map((d) => d.day)
                                                .toList(),
                                            yData: containerAdminDataRecordList
                                                .map((d) => d.times2Completed)
                                                .toList(),
                                            settings: LineChartBarData(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .scriptureRing,
                                              barWidth: 1.0,
                                              isCurved: true,
                                              preventCurveOverShooting: true,
                                            ),
                                          ),
                                          FFLineChartData(
                                            xData: containerAdminDataRecordList
                                                .map((d) => d.day)
                                                .toList(),
                                            yData: containerAdminDataRecordList
                                                .map((d) => d.times3Completed)
                                                .toList(),
                                            settings: LineChartBarData(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .prayerRing,
                                              barWidth: 1.0,
                                              isCurved: true,
                                              preventCurveOverShooting: true,
                                            ),
                                          )
                                        ],
                                        chartStylingInfo: ChartStylingInfo(
                                          enableTooltip: true,
                                          tooltipBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondarySystemBackground,
                                          backgroundColor: Colors.transparent,
                                          showGrid: true,
                                          showBorder: false,
                                        ),
                                        axisBounds: AxisBounds(),
                                        xAxisLabelInfo: AxisLabelInfo(
                                          title: FFLocalizations.of(context)
                                              .getText(
                                            'dlcs3mks' /* Recent Journals */,
                                          ),
                                          titleTextStyle: GoogleFonts.getFont(
                                            'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .lightSecondaryText,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        yAxisLabelInfo: AxisLabelInfo(
                                          title: FFLocalizations.of(context)
                                              .getText(
                                            'adnftese' /* Completions */,
                                          ),
                                          titleTextStyle: GoogleFonts.getFont(
                                            'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .lightSecondaryText,
                                            fontSize: 12.0,
                                          ),
                                        ),
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(22.0, 20.0, 22.0, 0.0),
                      child: FutureBuilder<List<AdminDataRecord>>(
                        future: queryAdminDataRecordOnce(
                          queryBuilder: (adminDataRecord) =>
                              adminDataRecord.orderBy('day', descending: true),
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
                          List<AdminDataRecord> containerAdminDataRecordList =
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 16.0, 0.0),
                                    child: Container(
                                      width: 350.0,
                                      height: 300.0,
                                      child: FlutterFlowLineChart(
                                        data: [
                                          FFLineChartData(
                                            xData: containerAdminDataRecordList
                                                .map((d) => d.day)
                                                .toList(),
                                            yData: containerAdminDataRecordList
                                                .map((d) => d.times1Completed)
                                                .toList(),
                                            settings: LineChartBarData(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .worshipRing,
                                              barWidth: 1.0,
                                              isCurved: true,
                                              preventCurveOverShooting: true,
                                            ),
                                          ),
                                          FFLineChartData(
                                            xData: containerAdminDataRecordList
                                                .map((d) => d.day)
                                                .toList(),
                                            yData: containerAdminDataRecordList
                                                .map((d) => d.times2Completed)
                                                .toList(),
                                            settings: LineChartBarData(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .scriptureRing,
                                              barWidth: 1.0,
                                              isCurved: true,
                                              preventCurveOverShooting: true,
                                            ),
                                          ),
                                          FFLineChartData(
                                            xData: containerAdminDataRecordList
                                                .map((d) => d.day)
                                                .toList(),
                                            yData: containerAdminDataRecordList
                                                .map((d) => d.times3Completed)
                                                .toList(),
                                            settings: LineChartBarData(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .prayerRing,
                                              barWidth: 1.0,
                                              isCurved: true,
                                              preventCurveOverShooting: true,
                                            ),
                                          )
                                        ],
                                        chartStylingInfo: ChartStylingInfo(
                                          enableTooltip: true,
                                          tooltipBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondarySystemBackground,
                                          backgroundColor: Colors.transparent,
                                          showGrid: true,
                                          showBorder: false,
                                        ),
                                        axisBounds: AxisBounds(),
                                        xAxisLabelInfo: AxisLabelInfo(
                                          title: FFLocalizations.of(context)
                                              .getText(
                                            'q4rhq8iy' /* Recent Journals */,
                                          ),
                                          titleTextStyle: GoogleFonts.getFont(
                                            'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .lightSecondaryText,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        yAxisLabelInfo: AxisLabelInfo(
                                          title: FFLocalizations.of(context)
                                              .getText(
                                            'x38ioc7s' /* Completions */,
                                          ),
                                          titleTextStyle: GoogleFonts.getFont(
                                            'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .lightSecondaryText,
                                            fontSize: 12.0,
                                          ),
                                        ),
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(22.0, 20.0, 22.0, 0.0),
                      child: FutureBuilder<List<AdminDataRecord>>(
                        future: queryAdminDataRecordOnce(
                          queryBuilder: (adminDataRecord) =>
                              adminDataRecord.orderBy('day', descending: true),
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
                          List<AdminDataRecord> containerAdminDataRecordList =
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 16.0, 0.0),
                                    child: Container(
                                      width: 350.0,
                                      height: 300.0,
                                      child: FlutterFlowLineChart(
                                        data: [
                                          FFLineChartData(
                                            xData: containerAdminDataRecordList
                                                .map((d) => d.day)
                                                .toList(),
                                            yData: containerAdminDataRecordList
                                                .map((d) => d.times1Completed)
                                                .toList(),
                                            settings: LineChartBarData(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .worshipRing,
                                              barWidth: 1.0,
                                              isCurved: true,
                                              preventCurveOverShooting: true,
                                            ),
                                          ),
                                          FFLineChartData(
                                            xData: containerAdminDataRecordList
                                                .map((d) => d.day)
                                                .toList(),
                                            yData: containerAdminDataRecordList
                                                .map((d) => d.times2Completed)
                                                .toList(),
                                            settings: LineChartBarData(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .scriptureRing,
                                              barWidth: 1.0,
                                              isCurved: true,
                                              preventCurveOverShooting: true,
                                            ),
                                          ),
                                          FFLineChartData(
                                            xData: containerAdminDataRecordList
                                                .map((d) => d.day)
                                                .toList(),
                                            yData: containerAdminDataRecordList
                                                .map((d) => d.times3Completed)
                                                .toList(),
                                            settings: LineChartBarData(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .prayerRing,
                                              barWidth: 1.0,
                                              isCurved: true,
                                              preventCurveOverShooting: true,
                                            ),
                                          )
                                        ],
                                        chartStylingInfo: ChartStylingInfo(
                                          enableTooltip: true,
                                          tooltipBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondarySystemBackground,
                                          backgroundColor: Colors.transparent,
                                          showGrid: true,
                                          showBorder: false,
                                        ),
                                        axisBounds: AxisBounds(),
                                        xAxisLabelInfo: AxisLabelInfo(
                                          title: FFLocalizations.of(context)
                                              .getText(
                                            'rugygg2g' /* Recent Journals */,
                                          ),
                                          titleTextStyle: GoogleFonts.getFont(
                                            'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .lightSecondaryText,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        yAxisLabelInfo: AxisLabelInfo(
                                          title: FFLocalizations.of(context)
                                              .getText(
                                            '87w9av74' /* Completions */,
                                          ),
                                          titleTextStyle: GoogleFonts.getFont(
                                            'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .lightSecondaryText,
                                            fontSize: 12.0,
                                          ),
                                        ),
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(22.0, 20.0, 22.0, 0.0),
                      child: FutureBuilder<List<AdminDataRecord>>(
                        future: queryAdminDataRecordOnce(
                          queryBuilder: (adminDataRecord) =>
                              adminDataRecord.orderBy('day', descending: true),
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
                          List<AdminDataRecord> containerAdminDataRecordList =
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 16.0, 0.0),
                                    child: Container(
                                      width: 350.0,
                                      height: 300.0,
                                      child: FlutterFlowLineChart(
                                        data: [
                                          FFLineChartData(
                                            xData: containerAdminDataRecordList
                                                .map((d) => d.day)
                                                .toList(),
                                            yData: containerAdminDataRecordList
                                                .map((d) => d.times1Completed)
                                                .toList(),
                                            settings: LineChartBarData(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .worshipRing,
                                              barWidth: 1.0,
                                              isCurved: true,
                                              preventCurveOverShooting: true,
                                            ),
                                          ),
                                          FFLineChartData(
                                            xData: containerAdminDataRecordList
                                                .map((d) => d.day)
                                                .toList(),
                                            yData: containerAdminDataRecordList
                                                .map((d) => d.times2Completed)
                                                .toList(),
                                            settings: LineChartBarData(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .scriptureRing,
                                              barWidth: 1.0,
                                              isCurved: true,
                                              preventCurveOverShooting: true,
                                            ),
                                          ),
                                          FFLineChartData(
                                            xData: containerAdminDataRecordList
                                                .map((d) => d.day)
                                                .toList(),
                                            yData: containerAdminDataRecordList
                                                .map((d) => d.times3Completed)
                                                .toList(),
                                            settings: LineChartBarData(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .prayerRing,
                                              barWidth: 1.0,
                                              isCurved: true,
                                              preventCurveOverShooting: true,
                                            ),
                                          )
                                        ],
                                        chartStylingInfo: ChartStylingInfo(
                                          enableTooltip: true,
                                          tooltipBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondarySystemBackground,
                                          backgroundColor: Colors.transparent,
                                          showGrid: true,
                                          showBorder: false,
                                        ),
                                        axisBounds: AxisBounds(),
                                        xAxisLabelInfo: AxisLabelInfo(
                                          title: FFLocalizations.of(context)
                                              .getText(
                                            'j66i1qvx' /* Recent Journals */,
                                          ),
                                          titleTextStyle: GoogleFonts.getFont(
                                            'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .lightSecondaryText,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        yAxisLabelInfo: AxisLabelInfo(
                                          title: FFLocalizations.of(context)
                                              .getText(
                                            'g3u7i0k5' /* Completions */,
                                          ),
                                          titleTextStyle: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .lightSecondaryText,
                                            fontSize: 12.0,
                                          ),
                                        ),
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(22.0, 20.0, 22.0, 0.0),
                    child: Container(
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
                          context.pushNamed('DailyPracticeScheduling');
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
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.schedule_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 24.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'q3i0cpqv' /* Schedule Helper: */,
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
                                                                    .secondary,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      8.0, 0.0, 20.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'yopnlwca' /* Daily Practices */,
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
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
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
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(22.0, 20.0, 22.0, 0.0),
                    child: Container(
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
                          context.pushNamed('NotificationsSelection');
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
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .edit_notifications_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 24.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '5dqr6mu9' /* Notifications: */,
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
                                                                    .secondary,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      8.0, 0.0, 16.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'gnpb5mgr' /* Send Push Notifications */,
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
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
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
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(22.0, 20.0, 22.0, 0.0),
                    child: StreamBuilder<List<LiveServicesRecord>>(
                      stream: queryLiveServicesRecord(
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
                        List<LiveServicesRecord>
                            menuItemLiveServicesRecordList = snapshot.data!;
                        final menuItemLiveServicesRecord =
                            menuItemLiveServicesRecordList.isNotEmpty
                                ? menuItemLiveServicesRecordList.first
                                : null;
                        return Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 50.0,
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
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'mltascn3' /* Live Stream Banner */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 12.0, 0.0),
                                                child: Switch(
                                                  value: _model.switchValue ??=
                                                      menuItemLiveServicesRecord!
                                                          .visibleBanner,
                                                  onChanged: (newValue) async {
                                                    setState(() =>
                                                        _model.switchValue =
                                                            newValue!);
                                                    if (newValue!) {
                                                      await menuItemLiveServicesRecord!
                                                          .reference
                                                          .update(
                                                              createLiveServicesRecordData(
                                                        visibleBanner: true,
                                                      ));
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        barrierColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .opagueSeparator,
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
                                                                    GoingLiveWidget(),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await menuItemLiveServicesRecord!
                                                          .reference
                                                          .update(
                                                              createLiveServicesRecordData(
                                                        visibleBanner: false,
                                                      ));
                                                    }
                                                  },
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .worshipRing,
                                                  activeTrackColor:
                                                      Color(0xFFFEFDEC),
                                                  inactiveTrackColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .lightSecondaryText,
                                                  inactiveThumbColor:
                                                      Colors.white,
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
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(22.0, 20.0, 22.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FutureBuilder<int>(
                          future: queryMessageChatsRecordCount(
                            queryBuilder: (messageChatsRecord) =>
                                messageChatsRecord
                                    .where(
                                      'pastoralRequest',
                                      isEqualTo: true,
                                    )
                                    .where(
                                      'lastMessageTime',
                                      isLessThanOrEqualTo: getCurrentTimestamp,
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
                                  context.pushNamed('AllPastoralRequests');
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
                                                '26kj8mjs' /* Pastoral Requests */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                          containerCount.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                        Expanded(
                          child: Container(
                            height: 20.0,
                            decoration: BoxDecoration(),
                          ),
                        ),
                        FutureBuilder<int>(
                          future: queryProfileTagsRecordCount(),
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
                                  context.pushNamed('ProfileTags');
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
                                                '852skxwr' /* Profile Tags */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                          containerCount.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(22.0, 20.0, 22.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FutureBuilder<int>(
                          future: queryGuestsRecordCount(
                            queryBuilder: (guestsRecord) => guestsRecord.where(
                              'newGuest',
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
                                  context.pushNamed('NewGuests');
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
                                                'gk084e26' /* New Guests */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                          containerCount.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                        Expanded(
                          child: Container(
                            height: 20.0,
                            decoration: BoxDecoration(),
                          ),
                        ),
                        FutureBuilder<int>(
                          future: queryPrayerRequestsRecordCount(
                            queryBuilder: (prayerRequestsRecord) =>
                                prayerRequestsRecord.where(
                              'public',
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
                                  if (Navigator.of(context).canPop()) {
                                    context.pop();
                                  }
                                  context.pushNamed('AllPrayerList');
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
                                                'iae6f6bz' /* Prayer Requests */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                          containerCount.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(22.0, 20.0, 22.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FutureBuilder<int>(
                          future: queryHeartCheckRecordCount(),
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
                                  context.pushNamed('AllHeartChecks');
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
                                                '45xqz0nt' /* Heart Checks */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                          containerCount.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                        Expanded(
                          child: Container(
                            height: 20.0,
                            decoration: BoxDecoration(),
                          ),
                        ),
                        FutureBuilder<int>(
                          future: queryGroupsRecordCount(),
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
                                  context.pushNamed('groupAnalytics');
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
                                                'atu4z587' /* Group Stats */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                          '${containerCount.toString()} Groups',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
          ),
        );
      },
    );
  }
}
