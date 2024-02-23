import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_practice_response_model.dart';
export 'edit_practice_response_model.dart';

class EditPracticeResponseWidget extends StatefulWidget {
  const EditPracticeResponseWidget({
    super.key,
    this.usersResponse,
    this.usersResponseDoc,
  });

  final DocumentReference? usersResponse;
  final PersonalJournalsRecord? usersResponseDoc;

  @override
  State<EditPracticeResponseWidget> createState() =>
      _EditPracticeResponseWidgetState();
}

class _EditPracticeResponseWidgetState
    extends State<EditPracticeResponseWidget> {
  late EditPracticeResponseModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditPracticeResponseModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textController ??=
        TextEditingController(text: widget.usersResponseDoc?.journalText);
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        Navigator.pop(context);
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).systemBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                    child: StreamBuilder<List<AdminDataRecord>>(
                      stream: queryAdminDataRecord(
                        queryBuilder: (adminDataRecord) =>
                            adminDataRecord.orderBy('day', descending: true),
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
                        List<AdminDataRecord> containerAdminDataRecordList =
                            snapshot.data!;
                        final containerAdminDataRecord =
                            containerAdminDataRecordList.isNotEmpty
                                ? containerAdminDataRecordList.first
                                : null;
                        return Container(
                          width: MediaQuery.sizeOf(context).width * 0.95,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondarySystemBackground,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 2.0, 8.0, 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textController',
                                          Duration(milliseconds: 0),
                                          () => setState(() {}),
                                        ),
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'wrrhkzas' /* Edit your response */,
                                          ),
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lightSecondaryText,
                                              ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            '4orkydwr' /* Your response here... */,
                                          ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lightSecondaryText,
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
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .label,
                                            ),
                                        maxLines: 8,
                                        minLines: 1,
                                        keyboardType: TextInputType.multiline,
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await widget.usersResponse!.delete();
                                      if (widget
                                              .usersResponseDoc?.journalUser ==
                                          currentUserReference) {
                                        await currentUserReference!.update({
                                          ...createUsersRecordData(
                                            percentageCompleted1: 0,
                                            completed1: false,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'completedtime1':
                                                  FieldValue.delete(),
                                            },
                                          ),
                                        });
                                        if (valueOrDefault(
                                                currentUserDocument
                                                    ?.timesCompletedJournal,
                                                0) >=
                                            1) {
                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'timesCompletedJournal':
                                                    FieldValue.increment(-(1)),
                                              },
                                            ),
                                          });
                                        }
                                      }
                                      if (dateTimeFormat(
                                            'yMMMd',
                                            getCurrentTimestamp,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ) ==
                                          dateTimeFormat(
                                            'yMMMd',
                                            containerAdminDataRecord
                                                ?.currentDay,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )) {
                                        await containerAdminDataRecord!
                                            .reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'times_1Completed':
                                                  FieldValue.increment(-(1)),
                                            },
                                          ),
                                        });
                                      }
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.cancel_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 26.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (_model.textController.text == null ||
                                      _model.textController.text == '')
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (!(_model.textController.text !=
                                                null &&
                                            _model.textController.text != '')) {
                                          return;
                                        }

                                        await widget.usersResponse!.update(
                                            createPersonalJournalsRecordData(
                                          journalUser: currentUserReference,
                                          journalDate: getCurrentTimestamp,
                                          journalText:
                                              _model.textController.text,
                                        ));
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.arrowCircleUp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .systemGray,
                                                size: 26.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  if (_model.textController.text != null &&
                                      _model.textController.text != '')
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (!(_model.textController.text !=
                                                null &&
                                            _model.textController.text != '')) {
                                          return;
                                        }

                                        await widget.usersResponse!.update(
                                            createPersonalJournalsRecordData(
                                          journalDate: getCurrentTimestamp,
                                          journalText:
                                              _model.textController.text,
                                        ));
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.arrowCircleUp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .worshipRing,
                                                size: 26.0,
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
                      },
                    ),
                  ),
                  if (!(isWeb
                      ? MediaQuery.viewInsetsOf(context).bottom > 0
                      : _isKeyboardVisible))
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.06,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  if (isWeb
                      ? MediaQuery.viewInsetsOf(context).bottom > 0
                      : _isKeyboardVisible)
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.02,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
