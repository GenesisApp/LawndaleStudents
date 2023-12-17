import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_date_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'chat_poll_creation_model.dart';
export 'chat_poll_creation_model.dart';

class ChatPollCreationWidget extends StatefulWidget {
  const ChatPollCreationWidget({
    Key? key,
    this.chatChosen,
  }) : super(key: key);

  final DocumentReference? chatChosen;

  @override
  _ChatPollCreationWidgetState createState() => _ChatPollCreationWidgetState();
}

class _ChatPollCreationWidgetState extends State<ChatPollCreationWidget> {
  late ChatPollCreationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatPollCreationModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();

    _model.textController6 ??= TextEditingController();
    _model.textFieldFocusNode6 ??= FocusNode();

    _model.textController7 ??= TextEditingController();
    _model.textFieldFocusNode7 ??= FocusNode();
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
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                              color: FlutterFlowTheme.of(context).systemGray,
                              size: 35.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(50.0, 20.0, 50.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'nl02hzrd' /* Enter the poll information bel... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color:
                                FlutterFlowTheme.of(context).lightSecondaryText,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        child: TextFormField(
                          controller: _model.textController1,
                          focusNode: _model.textFieldFocusNode1,
                          textCapitalization: TextCapitalization.sentences,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              'ivugf730' /* Poll Name */,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondarySystemBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .lightSecondaryText,
                                  ),
                          validator: _model.textController1Validator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        child: TextFormField(
                          controller: _model.textController2,
                          focusNode: _model.textFieldFocusNode2,
                          textCapitalization: TextCapitalization.sentences,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              'w3dhk67q' /* Poll Description/Question */,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondarySystemBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .lightSecondaryText,
                                  ),
                          validator: _model.textController2Validator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '8ol139jd' /* Voting Options */,
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
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 35.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            child: TextFormField(
                              controller: _model.textController3,
                              focusNode: _model.textFieldFocusNode3,
                              textCapitalization: TextCapitalization.sentences,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  'gnyk8yaj' /* Option A */,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondarySystemBackground,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .lightSecondaryText,
                                  ),
                              validator: _model.textController3Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 20.0, 35.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            child: TextFormField(
                              controller: _model.textController4,
                              focusNode: _model.textFieldFocusNode4,
                              textCapitalization: TextCapitalization.sentences,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  '09he5omh' /* Option B */,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondarySystemBackground,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .lightSecondaryText,
                                  ),
                              validator: _model.textController4Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (!_model.optionCvisible!)
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    _model.optionCvisible = true;
                                  });
                                },
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'ox7luizb' /* + Option */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (_model.optionCvisible ?? true)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 20.0, 35.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              child: TextFormField(
                                controller: _model.textController5,
                                focusNode: _model.textFieldFocusNode5,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    '9jcpnsht' /* Option C (optional) */,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondarySystemBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .lightSecondaryText,
                                    ),
                                validator: _model.textController5Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (!_model.optionDvisible!)
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (_model.optionCvisible ?? true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.optionDvisible = true;
                                    });
                                  },
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'fc2iqiiw' /* + Option */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    if (_model.optionDvisible ?? true)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 20.0, 35.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              child: TextFormField(
                                controller: _model.textController6,
                                focusNode: _model.textFieldFocusNode6,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'o2waaor7' /* Option D (optional) */,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondarySystemBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .lightSecondaryText,
                                    ),
                                validator: _model.textController6Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (!_model.optionEvisible!)
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (_model.optionDvisible ?? true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.optionEvisible = true;
                                    });
                                  },
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'dym1t0at' /* + Option */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    if (_model.optionEvisible ?? true)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 20.0, 35.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              child: TextFormField(
                                controller: _model.textController7,
                                focusNode: _model.textFieldFocusNode7,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    '33e0i2fn' /* Option E (optional) */,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondarySystemBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .lightSecondaryText,
                                    ),
                                validator: _model.textController7Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              final _datePickedDate = await showDatePicker(
                                context: context,
                                initialDate: getCurrentTimestamp,
                                firstDate: getCurrentTimestamp,
                                lastDate: DateTime(2050),
                              );

                              if (_datePickedDate != null) {
                                safeSetState(() {
                                  _model.datePicked = DateTime(
                                    _datePickedDate.year,
                                    _datePickedDate.month,
                                    _datePickedDate.day,
                                  );
                                });
                              }
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondarySystemBackground,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'x24xknb6' /* Day to Run Poll */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          (_model.datePicked != null
                                                  ? true
                                                  : false)
                                              ? dateTimeFormat(
                                                  'yMd',
                                                  _model.datePicked,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                )
                                              : 'N/A',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondarySystemBackground,
                            borderRadius: BorderRadius.circular(20.0),
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
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Icon(
                                                Icons.public,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 24.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'fzg8sndb' /* Answers Public? */,
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
                                            Expanded(
                                              child: Container(
                                                width: 100.0,
                                                height: 10.0,
                                                decoration: BoxDecoration(),
                                              ),
                                            ),
                                            Switch(
                                              value: _model.switchValue ??=
                                                  false,
                                              onChanged: (newValue) async {
                                                setState(() => _model
                                                    .switchValue = newValue!);
                                              },
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .worshipRing,
                                              activeTrackColor:
                                                  Color(0xFFFEFDEC),
                                              inactiveTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .lightSecondaryText,
                                              inactiveThumbColor: Colors.white,
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 75.0),
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
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '2kirdntn' /* Cancel */,
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
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                if (_model.datePicked == null) {
                                  return;
                                }
                                if ((_model.datePicked != null) &&
                                    (_model.textController1.text != null &&
                                        _model.textController1.text != '') &&
                                    (_model.textController2.text != null &&
                                        _model.textController2.text != '') &&
                                    (_model.textController3.text != null &&
                                        _model.textController3.text != '') &&
                                    (_model.textController4.text != null &&
                                        _model.textController4.text != '')) {
                                  var chatPollRecordReference =
                                      ChatPollRecord.collection.doc();
                                  await chatPollRecordReference
                                      .set(createChatPollRecordData(
                                    pollName: _model.textController1.text,
                                    pollDescription:
                                        _model.textController2.text,
                                    optionA: _model.textController3.text,
                                    optionB: _model.textController4.text,
                                    optionC: _model.textController5.text !=
                                                null &&
                                            _model.textController5.text != ''
                                        ? _model.textController5.text
                                        : null,
                                    optionD: _model.textController6.text !=
                                                null &&
                                            _model.textController6.text != ''
                                        ? _model.textController6.text
                                        : null,
                                    optionE: _model.textController7.text !=
                                                null &&
                                            _model.textController7.text != ''
                                        ? _model.textController7.text
                                        : null,
                                    chatReference: widget.chatChosen,
                                    answersPublic:
                                        _model.switchValue! ? true : false,
                                    pollOpen: _model.datePicked,
                                    creator: currentUserReference,
                                    creatorName: currentUserDisplayName,
                                    timeCreated: getCurrentTimestamp,
                                  ));
                                  _model.pollCreated =
                                      ChatPollRecord.getDocumentFromData(
                                          createChatPollRecordData(
                                            pollName:
                                                _model.textController1.text,
                                            pollDescription:
                                                _model.textController2.text,
                                            optionA:
                                                _model.textController3.text,
                                            optionB:
                                                _model.textController4.text,
                                            optionC: _model.textController5
                                                            .text !=
                                                        null &&
                                                    _model.textController5
                                                            .text !=
                                                        ''
                                                ? _model.textController5.text
                                                : null,
                                            optionD: _model.textController6
                                                            .text !=
                                                        null &&
                                                    _model.textController6
                                                            .text !=
                                                        ''
                                                ? _model.textController6.text
                                                : null,
                                            optionE: _model.textController7
                                                            .text !=
                                                        null &&
                                                    _model.textController7
                                                            .text !=
                                                        ''
                                                ? _model.textController7.text
                                                : null,
                                            chatReference: widget.chatChosen,
                                            answersPublic: _model.switchValue!
                                                ? true
                                                : false,
                                            pollOpen: _model.datePicked,
                                            creator: currentUserReference,
                                            creatorName: currentUserDisplayName,
                                            timeCreated: getCurrentTimestamp,
                                          ),
                                          chatPollRecordReference);

                                  await widget.chatChosen!
                                      .update(createMessageChatsRecordData(
                                    currentPoll: _model.pollCreated?.reference,
                                  ));

                                  var messagesRecordReference =
                                      MessagesRecord.collection.doc();
                                  await messagesRecordReference
                                      .set(createMessagesRecordData(
                                    messageText: '${valueOrDefault<String>(
                                      currentUserDisplayName,
                                      'Guest User',
                                    )} just created a poll!',
                                    timeSent: getCurrentTimestamp,
                                    userName: 'System Message',
                                    chatReference: widget.chatChosen,
                                    user: currentUserReference,
                                  ));
                                  _model.systemMessage =
                                      MessagesRecord.getDocumentFromData(
                                          createMessagesRecordData(
                                            messageText:
                                                '${valueOrDefault<String>(
                                              currentUserDisplayName,
                                              'Guest User',
                                            )} just created a poll!',
                                            timeSent: getCurrentTimestamp,
                                            userName: 'System Message',
                                            chatReference: widget.chatChosen,
                                            user: currentUserReference,
                                          ),
                                          messagesRecordReference);

                                  await widget.chatChosen!
                                      .update(createMessageChatsRecordData(
                                    lastMessageTime: getCurrentTimestamp,
                                    lastMessage:
                                        _model.systemMessage?.messageText,
                                    lastMessageSentByName: 'System Message',
                                  ));
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
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: AddDateWidget(),
                                      ));
                                    },
                                  ).then((value) => safeSetState(() {}));
                                }

                                setState(() {});
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
                                      'evv418ul' /* Submit */,
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
            ),
          ],
        ),
      ),
    );
  }
}
