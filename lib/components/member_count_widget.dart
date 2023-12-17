import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'member_count_model.dart';
export 'member_count_model.dart';

class MemberCountWidget extends StatefulWidget {
  const MemberCountWidget({
    Key? key,
    this.parameter1,
    this.parameter2,
  }) : super(key: key);

  final DocumentReference? parameter1;
  final int? parameter2;

  @override
  _MemberCountWidgetState createState() => _MemberCountWidgetState();
}

class _MemberCountWidgetState extends State<MemberCountWidget>
    with TickerProviderStateMixin {
  late MemberCountModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-15.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1400.ms,
          begin: Offset(-15.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1800.ms,
          begin: Offset(-15.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MemberCountModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(25.0, 16.0, 25.0, 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<List<UsersRecord>>(
                stream: queryUsersRecord(
                  queryBuilder: (usersRecord) => usersRecord.where(
                    'videos_watched',
                    arrayContains: widget.parameter1,
                  ),
                  limit: 6,
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
                  List<UsersRecord> rowUsersRecordList = snapshot.data!;
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    children:
                        List.generate(rowUsersRecordList.length, (rowIndex) {
                      final rowUsersRecord = rowUsersRecordList[rowIndex];
                      return Align(
                        alignment: AlignmentDirectional(-0.98, 0.0),
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                valueOrDefault<String>(
                                  rowUsersRecord.photoUrl,
                                  'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                                ),
                              ),
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                          alignment: AlignmentDirectional(-0.8, 0.0),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation1']!),
                      );
                    }),
                  );
                },
              ),
            ],
          ),
        ),
        if (widget.parameter2! >= 1)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
            child: StreamBuilder<List<UsersRecord>>(
              stream: queryUsersRecord(
                queryBuilder: (usersRecord) => usersRecord.where(
                  'videos_watched',
                  arrayContains: widget.parameter1,
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
                List<UsersRecord> containerUsersRecordList = snapshot.data!;
                return Container(
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'otpnly38' /* + */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).tertiary,
                              ),
                        ),
                      ),
                      if (containerUsersRecordList.length <= 4)
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'x99y25lb' /* 0 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                ),
                          ),
                        ),
                      if (containerUsersRecordList.length > 6)
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              (containerUsersRecordList.length - 6).toString(),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                ),
                          ),
                        ),
                      if (widget.parameter2! >= 1)
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'v0gj771g' /* members */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                  ),
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation']!),
                          ),
                        ),
                    ],
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation2']!);
              },
            ),
          ),
      ],
    );
  }
}
