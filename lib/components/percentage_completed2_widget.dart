import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'percentage_completed2_model.dart';
export 'percentage_completed2_model.dart';

class PercentageCompleted2Widget extends StatefulWidget {
  const PercentageCompleted2Widget({Key? key}) : super(key: key);

  @override
  _PercentageCompleted2WidgetState createState() =>
      _PercentageCompleted2WidgetState();
}

class _PercentageCompleted2WidgetState
    extends State<PercentageCompleted2Widget> {
  late PercentageCompleted2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PercentageCompleted2Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).systemBackground,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: Colors.transparent,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.35,
                              height: MediaQuery.sizeOf(context).width * 0.35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondarySystemBackground,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => CircularPercentIndicator(
                                  percent: valueOrDefault(
                                          currentUserDocument
                                              ?.percentageCompleted2,
                                          0)
                                      .toDouble(),
                                  radius:
                                      MediaQuery.sizeOf(context).width * 0.175,
                                  lineWidth: 7.0,
                                  animation: true,
                                  animateFromLastPercent: true,
                                  progressColor: Color(0xFF6D6DAE),
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .tertiarySystemBackground,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (valueOrDefault<bool>(
                                    currentUserDocument?.completed2, false))
                                  AuthUserStreamWidget(
                                    builder: (context) => Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.11,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.05,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (Theme.of(context).brightness ==
                                              Brightness.dark)
                                            SvgPicture.asset(
                                              'assets/images/bookmarks-simple-fill_(1).svg',
                                              width: 40.0,
                                              height: 40.0,
                                              fit: BoxFit.cover,
                                            ),
                                          if (!(Theme.of(context).brightness ==
                                              Brightness.dark))
                                            SvgPicture.asset(
                                              'assets/images/bookmarks-simple-fill.svg',
                                              width: 40.0,
                                              height: 40.0,
                                              fit: BoxFit.cover,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                if (!valueOrDefault<bool>(
                                    currentUserDocument?.completed2, false))
                                  AuthUserStreamWidget(
                                    builder: (context) => Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.11,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.05,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (Theme.of(context).brightness ==
                                              Brightness.light)
                                            SvgPicture.asset(
                                              'assets/images/bookmarks-simple-fill_(5).svg',
                                              width: 40.0,
                                              height: 40.0,
                                              fit: BoxFit.cover,
                                            ),
                                          if (Theme.of(context).brightness ==
                                              Brightness.dark)
                                            SvgPicture.asset(
                                              'assets/images/bookmarks-simple-fill_(6).svg',
                                              width: 40.0,
                                              height: 40.0,
                                              fit: BoxFit.cover,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              50.0, 20.0, 50.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'kybloip1' /* Congratulations! You've comple... */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).label,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 100.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              HapticFeedback.lightImpact();
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondarySystemBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'u89gadse' /* Done */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .label,
                                            fontWeight: FontWeight.w500,
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
