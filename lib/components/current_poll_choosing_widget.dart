import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/answer_needed_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'current_poll_choosing_model.dart';
export 'current_poll_choosing_model.dart';

class CurrentPollChoosingWidget extends StatefulWidget {
  const CurrentPollChoosingWidget({
    super.key,
    this.currentPoll,
    this.pollReference,
  });

  final ChatPollRecord? currentPoll;
  final DocumentReference? pollReference;

  @override
  State<CurrentPollChoosingWidget> createState() =>
      _CurrentPollChoosingWidgetState();
}

class _CurrentPollChoosingWidgetState extends State<CurrentPollChoosingWidget> {
  late CurrentPollChoosingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CurrentPollChoosingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      constraints: BoxConstraints(
                        maxHeight: double.infinity,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context)
                              .secondarySystemBackground,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: FaIcon(
                                FontAwesomeIcons.poll,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 35.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Text(
                  widget.currentPoll!.pollName,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
                child: Text(
                  widget.currentPoll!.pollDescription,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).lightSecondaryText,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                child: Text(
                  'Created by: ${valueOrDefault<String>(
                    widget.currentPoll?.creatorName,
                    'Guest User',
                  )}',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).lightSecondaryText,
                        fontSize: 12.0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            unselectedWidgetColor: Color(0xFF95A1AC),
                          ),
                          child: CheckboxListTile(
                            value: _model.checkboxListTileValue1 ??= false,
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.checkboxListTileValue1 = newValue!);
                              if (newValue!) {
                                await widget.pollReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'optionAusers': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                              } else {
                                await widget.pollReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'optionAusers': FieldValue.arrayRemove(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                              }
                            },
                            title: Text(
                              widget.currentPoll!.optionA.maybeHandleOverflow(
                                maxChars: 35,
                                replacement: '…',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            activeColor: FlutterFlowTheme.of(context).secondary,
                            dense: true,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          unselectedWidgetColor: Color(0xFF95A1AC),
                        ),
                        child: CheckboxListTile(
                          value: _model.checkboxListTileValue2 ??= false,
                          onChanged: (newValue) async {
                            setState(() =>
                                _model.checkboxListTileValue2 = newValue!);
                            if (newValue!) {
                              await widget.pollReference!.update({
                                ...mapToFirestore(
                                  {
                                    'optionBusers': FieldValue.arrayUnion(
                                        [currentUserReference]),
                                  },
                                ),
                              });
                            } else {
                              await widget.pollReference!.update({
                                ...mapToFirestore(
                                  {
                                    'optionBusers': FieldValue.arrayRemove(
                                        [currentUserReference]),
                                  },
                                ),
                              });
                            }
                          },
                          title: Text(
                            widget.currentPoll!.optionB.maybeHandleOverflow(
                              maxChars: 35,
                              replacement: '…',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          tileColor: Color(0xFFF5F5F5),
                          activeColor: FlutterFlowTheme.of(context).secondary,
                          dense: true,
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                      if (widget.currentPoll?.optionC != null &&
                          widget.currentPoll?.optionC != '')
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            unselectedWidgetColor: Color(0xFF95A1AC),
                          ),
                          child: CheckboxListTile(
                            value: _model.checkboxListTileValue3 ??= false,
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.checkboxListTileValue3 = newValue!);
                              if (newValue!) {
                                await widget.pollReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'optionCusers': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                              } else {
                                await widget.pollReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'optionCusers': FieldValue.arrayRemove(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                              }
                            },
                            title: Text(
                              widget.currentPoll!.optionC.maybeHandleOverflow(
                                maxChars: 35,
                                replacement: '…',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            activeColor: FlutterFlowTheme.of(context).secondary,
                            dense: true,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      if (widget.currentPoll?.optionD != null &&
                          widget.currentPoll?.optionD != '')
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            unselectedWidgetColor: Color(0xFF95A1AC),
                          ),
                          child: CheckboxListTile(
                            value: _model.checkboxListTileValue4 ??= false,
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.checkboxListTileValue4 = newValue!);
                              if (newValue!) {
                                await widget.pollReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'optionDusers': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                              } else {
                                await widget.pollReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'optionDusers': FieldValue.arrayRemove(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                              }
                            },
                            title: Text(
                              widget.currentPoll!.optionD.maybeHandleOverflow(
                                maxChars: 35,
                                replacement: '…',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            activeColor: FlutterFlowTheme.of(context).secondary,
                            dense: true,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      if (widget.currentPoll?.optionE != null &&
                          widget.currentPoll?.optionE != '')
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            unselectedWidgetColor: Color(0xFF95A1AC),
                          ),
                          child: CheckboxListTile(
                            value: _model.checkboxListTileValue5 ??= false,
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.checkboxListTileValue5 = newValue!);
                              if (newValue!) {
                                await widget.pollReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'optionEusers': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                              } else {
                                await widget.pollReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'optionEusers': FieldValue.arrayRemove(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                              }
                            },
                            title: Text(
                              widget.currentPoll!.optionE.maybeHandleOverflow(
                                maxChars: 35,
                                replacement: '…',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            activeColor: FlutterFlowTheme.of(context).secondary,
                            dense: true,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 75.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'y8oet0m7' /* Cancel */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
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
                          if (_model.checkboxListTileValue1! ||
                              _model.checkboxListTileValue2! ||
                              _model.checkboxListTileValue3! ||
                              _model.checkboxListTileValue4! ||
                              _model.checkboxListTileValue5!) {
                            await widget.pollReference!.update({
                              ...mapToFirestore(
                                {
                                  'usersVoted': FieldValue.arrayUnion(
                                      [currentUserReference]),
                                },
                              ),
                            });

                            await currentUserReference!.update({
                              ...mapToFirestore(
                                {
                                  'pollAnswersChosen': FieldValue.arrayUnion(
                                      [widget.currentPoll?.reference]),
                                },
                              ),
                            });
                            Navigator.pop(context);
                          } else {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor: Color(0x80000000),
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: AnswerNeededWidget(),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          }
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
                                'grof09z8' /* Submit */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
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
        ],
      ),
    );
  }
}
