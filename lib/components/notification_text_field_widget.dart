import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notification_text_field_model.dart';
export 'notification_text_field_model.dart';

class NotificationTextFieldWidget extends StatefulWidget {
  const NotificationTextFieldWidget({
    super.key,
    required this.parameter1,
    required this.parameter2,
    required this.parameter3,
    required this.parameter4,
  });

  final String? parameter1;
  final String? parameter2;
  final String? parameter3;
  final DocumentReference? parameter4;

  @override
  State<NotificationTextFieldWidget> createState() =>
      _NotificationTextFieldWidgetState();
}

class _NotificationTextFieldWidgetState
    extends State<NotificationTextFieldWidget> {
  late NotificationTextFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationTextFieldModel());

    _model.textField1Controller ??=
        TextEditingController(text: widget.parameter1);
    _model.textField1FocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: (currentUserDocument?.tags?.toList() ?? [])
          .contains(widget.parameter4),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
        child: AuthUserStreamWidget(
          builder: (context) => Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 6.0, 20.0, 6.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.95,
                child: TextFormField(
                  controller: _model.textField1Controller,
                  focusNode: _model.textField1FocusNode,
                  textCapitalization: TextCapitalization.sentences,
                  readOnly: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: '${widget.parameter2} - ${widget.parameter3}',
                    labelStyle:
                        FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).worshipRing,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
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
                        color: FlutterFlowTheme.of(context)
                            .textFieldColorSecondary,
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
                    fillColor:
                        FlutterFlowTheme.of(context).secondarySystemBackground,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).label,
                      ),
                  textAlign: TextAlign.center,
                  maxLines: 6,
                  minLines: 1,
                  validator:
                      _model.textField1ControllerValidator.asValidator(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
