import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/notification_sent_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'custom_push_notification_model.dart';
export 'custom_push_notification_model.dart';

class CustomPushNotificationWidget extends StatefulWidget {
  const CustomPushNotificationWidget({
    super.key,
    required this.userGroupChosen,
    required this.tagChosen,
    required this.tagChosenDoc,
  });

  final List<DocumentReference>? userGroupChosen;
  final DocumentReference? tagChosen;
  final ProfileTagsRecord? tagChosenDoc;

  @override
  State<CustomPushNotificationWidget> createState() =>
      _CustomPushNotificationWidgetState();
}

class _CustomPushNotificationWidgetState
    extends State<CustomPushNotificationWidget> {
  late CustomPushNotificationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomPushNotificationModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
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
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).worshipRing,
                          width: 5.0,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.edit_notifications_rounded,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 35.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(50.0, 25.0, 50.0, 20.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '1pui4vnd' /* Customize your push noitificat... */,
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      final selectedMedia =
                          await selectMediaWithSourceBottomSheet(
                        context: context,
                        maxWidth: 1500.00,
                        maxHeight: 1500.00,
                        allowPhoto: true,
                        backgroundColor: FlutterFlowTheme.of(context)
                            .secondarySystemBackground,
                        textColor: FlutterFlowTheme.of(context).label,
                        pickerFontFamily: 'Rubik',
                      );
                      if (selectedMedia != null &&
                          selectedMedia.every((m) =>
                              validateFileFormat(m.storagePath, context))) {
                        setState(() => _model.isDataUploading = true);
                        var selectedUploadedFiles = <FFUploadedFile>[];

                        var downloadUrls = <String>[];
                        try {
                          showUploadMessage(
                            context,
                            'Uploading file...',
                            showLoading: true,
                          );
                          selectedUploadedFiles = selectedMedia
                              .map((m) => FFUploadedFile(
                                    name: m.storagePath.split('/').last,
                                    bytes: m.bytes,
                                    height: m.dimensions?.height,
                                    width: m.dimensions?.width,
                                    blurHash: m.blurHash,
                                  ))
                              .toList();

                          downloadUrls = (await Future.wait(
                            selectedMedia.map(
                              (m) async =>
                                  await uploadData(m.storagePath, m.bytes),
                            ),
                          ))
                              .where((u) => u != null)
                              .map((u) => u!)
                              .toList();
                        } finally {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          _model.isDataUploading = false;
                        }
                        if (selectedUploadedFiles.length ==
                                selectedMedia.length &&
                            downloadUrls.length == selectedMedia.length) {
                          setState(() {
                            _model.uploadedLocalFile =
                                selectedUploadedFiles.first;
                            _model.uploadedFileUrl = downloadUrls.first;
                          });
                          showUploadMessage(context, 'Success!');
                        } else {
                          setState(() {});
                          showUploadMessage(context, 'Failed to upload data');
                          return;
                        }
                      }
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      height: MediaQuery.sizeOf(context).height * 0.2,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context)
                            .secondarySystemBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                            _model.uploadedFileUrl,
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context)
                              .secondarySystemBackground,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.add_photo_alternate,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 35.0,
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'jgsf4lqh' /* Add your photo here (optional) */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .lightSecondaryText,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                            'k81684y8' /* Notification Title... */,
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
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                        EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 25.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      child: TextFormField(
                        controller: _model.textController2,
                        focusNode: _model.textFieldFocusNode2,
                        textCapitalization: TextCapitalization.sentences,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            'qcxj0hon' /* Notification Text... */,
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
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context)
                                  .lightSecondaryText,
                            ),
                        validator: _model.textController2Validator
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
                      final _datePickedDate = await showDatePicker(
                        context: context,
                        initialDate: getCurrentTimestamp,
                        firstDate: getCurrentTimestamp,
                        lastDate: DateTime(2050),
                      );

                      TimeOfDay? _datePickedTime;
                      if (_datePickedDate != null) {
                        _datePickedTime = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                        );
                      }

                      if (_datePickedDate != null && _datePickedTime != null) {
                        safeSetState(() {
                          _model.datePicked = DateTime(
                            _datePickedDate.year,
                            _datePickedDate.month,
                            _datePickedDate.day,
                            _datePickedTime!.hour,
                            _datePickedTime.minute,
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
                                  '98qzqfkq' /* Schedule for Later (optional) */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    _model.datePicked != null
                                        ? dateTimeFormat(
                                            'M/d h:mm a',
                                            _model.datePicked,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )
                                        : 'Click here',
                                    'Click here',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .worshipRing,
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
              padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      decoration: BoxDecoration(),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 75.0),
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
                                await actions.hapticFeedback(
                                  1,
                                );
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
                                      '2uzqrjwf' /* Cancel */,
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
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                HapticFeedback.lightImpact();

                                await NotificationsRecord.collection
                                    .doc()
                                    .set(createNotificationsRecordData(
                                      tagRef: widget.tagChosen,
                                      notificationText:
                                          _model.textController2.text,
                                      createdTime: getCurrentTimestamp,
                                      tagName: widget.tagChosenDoc?.tagName,
                                    ));
                                if (_model.datePicked != null) {
                                  triggerPushNotification(
                                    notificationTitle:
                                        _model.textController1.text,
                                    notificationText:
                                        _model.textController2.text,
                                    notificationImageUrl:
                                        _model.uploadedFileUrl != null &&
                                                _model.uploadedFileUrl != ''
                                            ? _model.uploadedFileUrl
                                            : null,
                                    scheduledTime: _model.datePicked!,
                                    userRefs: widget.userGroupChosen!.toList(),
                                    initialPageName: 'MessageBoard',
                                    parameterData: {},
                                  );
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    barrierColor: FlutterFlowTheme.of(context)
                                        .opagueSeparator,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: NotificationSentWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  Navigator.pop(context);
                                } else {
                                  triggerPushNotification(
                                    notificationTitle:
                                        _model.textController1.text,
                                    notificationText:
                                        _model.textController2.text,
                                    notificationImageUrl:
                                        _model.uploadedFileUrl != null &&
                                                _model.uploadedFileUrl != ''
                                            ? _model.uploadedFileUrl
                                            : null,
                                    userRefs: widget.userGroupChosen!.toList(),
                                    initialPageName: 'MessageBoard',
                                    parameterData: {},
                                  );
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    barrierColor: FlutterFlowTheme.of(context)
                                        .opagueSeparator,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: NotificationSentWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  Navigator.pop(context);
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
                                      'mo0pysyi' /* Send */,
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
