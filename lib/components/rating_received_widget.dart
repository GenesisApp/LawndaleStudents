import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'rating_received_model.dart';
export 'rating_received_model.dart';

class RatingReceivedWidget extends StatefulWidget {
  const RatingReceivedWidget({Key? key}) : super(key: key);

  @override
  _RatingReceivedWidgetState createState() => _RatingReceivedWidgetState();
}

class _RatingReceivedWidgetState extends State<RatingReceivedWidget> {
  late RatingReceivedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingReceivedModel());
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
          padding: EdgeInsetsDirectional.fromSTEB(35.0, 0.0, 35.0, 0.0),
          child: StreamBuilder<List<GlobalGroupsDataRecord>>(
            stream: queryGlobalGroupsDataRecord(
              queryBuilder: (globalGroupsDataRecord) => globalGroupsDataRecord
                  .orderBy('dayInteger', descending: true),
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
              List<GlobalGroupsDataRecord> containerGlobalGroupsDataRecordList =
                  snapshot.data!;
              final containerGlobalGroupsDataRecord =
                  containerGlobalGroupsDataRecordList.isNotEmpty
                      ? containerGlobalGroupsDataRecordList.first
                      : null;
              return Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).systemBackground,
                  borderRadius: BorderRadius.circular(12.0),
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
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 125.0,
                              height: 125.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondarySystemBackground,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.check_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          size: 40.0,
                                        ),
                                      ],
                                    ),
                                    CircularPercentIndicator(
                                      percent: 1.0,
                                      radius: MediaQuery.sizeOf(context).width *
                                          0.165,
                                      lineWidth: 7.0,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      progressColor:
                                          FlutterFlowTheme.of(context)
                                              .worshipRing,
                                      backgroundColor: Color(0x1A000000),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  50.0, 20.0, 50.0, 10.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '7cirneel' /* Thank you for rating! */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 20.0),
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
                                  context.safePop();
                                },
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondarySystemBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '9g8fd9dt' /* Done */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
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
              );
            },
          ),
        ),
      ],
    );
  }
}
