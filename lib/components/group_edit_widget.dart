import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/delete_group_widget.dart';
import '/components/featured_notification_groups_widget.dart';
import '/components/group_leaders_set_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'group_edit_model.dart';
export 'group_edit_model.dart';

class GroupEditWidget extends StatefulWidget {
  const GroupEditWidget({
    Key? key,
    this.chosenGroup,
  }) : super(key: key);

  final GroupsRecord? chosenGroup;

  @override
  _GroupEditWidgetState createState() => _GroupEditWidgetState();
}

class _GroupEditWidgetState extends State<GroupEditWidget>
    with TickerProviderStateMixin {
  late GroupEditModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(-30.0, 0.0),
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
    _model = createModel(context, () => GroupEditModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().groupLeaders = [];
      });
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textController1 ??= TextEditingController(
        text: widget.chosenGroup?.videoName != null &&
                widget.chosenGroup?.videoName != ''
            ? widget.chosenGroup?.videoName
            : 'type here... (required)');
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: widget.chosenGroup?.messageDescription);
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(22.0, 20.0, 22.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'yr0iws62' /* Hello, */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color:
                              FlutterFlowTheme.of(context).lightSecondaryText,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Text(
                        currentUserDisplayName,
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 10.0,
                      decoration: BoxDecoration(),
                    ),
                  ),
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (Theme.of(context).brightness == Brightness.dark)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 8.0, 10.0, 10.0),
                            child: SvgPicture.asset(
                              'assets/images/leaf-fill_(4).svg',
                              width: double.infinity,
                              height: 25.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        if (!(Theme.of(context).brightness == Brightness.dark))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 8.0, 10.0, 10.0),
                            child: SvgPicture.asset(
                              'assets/images/leaf-fill_(5).svg',
                              width: double.infinity,
                              height: 25.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(22.0, 8.0, 0.0, 25.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'vglakeec' /* Please edit your fields below. */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).lightSecondaryText,
                    ),
              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
            ),
            Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
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
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              textColor: FlutterFlowTheme.of(context).tertiary,
                              pickerFontFamily: 'Rubik',
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              setState(() => _model.isDataUploading1 = true);
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
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _model.isDataUploading1 = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile1 =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl1 = downloadUrls.first;
                                });
                                showUploadMessage(context, 'Success!');
                              } else {
                                setState(() {});
                                showUploadMessage(
                                    context, 'Failed to upload data');
                                return;
                              }
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.2,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondarySystemBackground,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(
                                  _model.uploadedFileUrl1 != null &&
                                          _model.uploadedFileUrl1 != ''
                                      ? _model.uploadedFileUrl1
                                      : widget.chosenGroup!.imageThumbnail,
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
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 35.0,
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '8twt6ql7' /* Add your group photo here (req... */,
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
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context)
                              .secondarySystemBackground,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 8.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '7p3a1nc2' /* Group Leaders */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .systemGray,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.1,
                                        height: 10.0,
                                        decoration: BoxDecoration(),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('ChooseUser');
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '5ukpaoay' /* Set */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          FaIcon(
                                            FontAwesomeIcons.userPlus,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 16.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (FFAppState().groupLeaders.length >= 1)
                                    Container(
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                      child: StreamBuilder<List<UsersRecord>>(
                                        stream: queryUsersRecord(),
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
                                          List<UsersRecord>
                                              listViewUsersRecordList =
                                              snapshot.data!;
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                listViewUsersRecordList.length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewUsersRecord =
                                                  listViewUsersRecordList[
                                                      listViewIndex];
                                              return Visibility(
                                                visible: FFAppState()
                                                    .groupLeaders
                                                    .contains(
                                                        listViewUsersRecord
                                                            .reference),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 5.0),
                                                  child: Container(
                                                    width: 90.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Container(
                                                            width: 68.0,
                                                            height: 68.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .transparent,
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  listViewUsersRecord.heartCheckActive
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .worshipRing
                                                                      : Colors
                                                                          .transparent,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(1.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'OtherUserProfile',
                                                                    queryParameters:
                                                                        {
                                                                      'selectedUser':
                                                                          serializeParam(
                                                                        listViewUsersRecord,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                      'selectedUserRef':
                                                                          serializeParam(
                                                                        listViewUsersRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'selectedUser':
                                                                          listViewUsersRecord,
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              100.0),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    fadeInDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    fadeOutDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    imageUrl:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      listViewUsersRecord
                                                                          .photoUrl,
                                                                      'https://www.chocolatebayou.org/wp-content/uploads/No-Image-Person-2048x2048.jpeg',
                                                                    ),
                                                                    width: 68.0,
                                                                    height:
                                                                        68.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'containerOnPageLoadAnimation']!),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      1.05),
                                                              child: Text(
                                                                listViewUsersRecord
                                                                    .displayName
                                                                    .maybeHandleOverflow(
                                                                  maxChars: 10,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .lightSecondaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  if (FFAppState().groupLeaders.length == 0)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 12.0, 12.0, 8.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'vhmcpym8' /* You must reset leaders wheneve... */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lightSecondaryText,
                                            ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final selectedFiles = await selectFiles(
                                  allowedExtensions: ['pdf'],
                                  multiFile: false,
                                );
                                if (selectedFiles != null) {
                                  setState(
                                      () => _model.isDataUploading2 = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  var downloadUrls = <String>[];
                                  try {
                                    selectedUploadedFiles = selectedFiles
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                            ))
                                        .toList();

                                    downloadUrls = (await Future.wait(
                                      selectedFiles.map(
                                        (f) async => await uploadData(
                                            f.storagePath, f.bytes),
                                      ),
                                    ))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                  } finally {
                                    _model.isDataUploading2 = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedFiles.length &&
                                      downloadUrls.length ==
                                          selectedFiles.length) {
                                    setState(() {
                                      _model.uploadedLocalFile2 =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl2 =
                                          downloadUrls.first;
                                    });
                                  } else {
                                    setState(() {});
                                    return;
                                  }
                                }
                              },
                              child: Container(
                                height: 52.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondarySystemBackground,
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .secondarySystemBackground,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'a64wadsz' /* Group Document */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 16.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 8.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'a4ux2ne6' /* Upload */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lightSecondaryText,
                                                  fontSize: 14.0,
                                                ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.upload_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .lightSecondaryText,
                                          size: 20.0,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.textController1,
                          focusNode: _model.textFieldFocusNode1,
                          textCapitalization: TextCapitalization.sentences,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              'h2inp11n' /* Group Name */,
                            ),
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                            hintText: widget.chosenGroup?.videoName != null &&
                                    widget.chosenGroup?.videoName != ''
                                ? widget.chosenGroup?.videoName
                                : 'type here... (required)',
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
                                color: FlutterFlowTheme.of(context).prayerRing,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).prayerRing,
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
                                color: FlutterFlowTheme.of(context).tertiary,
                              ),
                          validator: _model.textController1Validator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.textController2,
                          focusNode: _model.textFieldFocusNode2,
                          textCapitalization: TextCapitalization.sentences,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              'hnx1dynf' /* Group Description */,
                            ),
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                            hintText: widget.chosenGroup?.messageDescription,
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
                                color: FlutterFlowTheme.of(context).prayerRing,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).prayerRing,
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
                                color: FlutterFlowTheme.of(context).tertiary,
                              ),
                          keyboardType: TextInputType.multiline,
                          validator: _model.textController2Validator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondarySystemBackground,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'ptn8ugzf' /* Category */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .systemGray,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.1,
                                              height: 10.0,
                                              decoration: BoxDecoration(),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 12.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '23kuf451' /* View all */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          if (!_model.categoryAll)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model.categoryAll = true;
                                                });
                                              },
                                              child: Icon(
                                                Icons.chevron_right_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryLabel,
                                                size: 24.0,
                                              ),
                                            ),
                                          if (_model.categoryAll)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model.categoryAll = false;
                                                });
                                              },
                                              child: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryLabel,
                                                size: 24.0,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    if (_model.categoryAll)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: FutureBuilder<
                                              List<GroupsCategoriesRecord>>(
                                            future:
                                                queryGroupsCategoriesRecordOnce(),
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
                                              List<GroupsCategoriesRecord>
                                                  categoryChipsAllGroupsCategoriesRecordList =
                                                  snapshot.data!;
                                              return FlutterFlowChoiceChips(
                                                options:
                                                    categoryChipsAllGroupsCategoriesRecordList
                                                        .map((e) =>
                                                            e.nameofCategory)
                                                        .toList()
                                                        .map((label) =>
                                                            ChipData(label))
                                                        .toList(),
                                                onChanged: (val) => setState(() =>
                                                    _model.categoryChipsAllValue =
                                                        val?.first),
                                                selectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .systemGray3,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  iconSize: 18.0,
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                unselectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .systemBackground,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                      ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary,
                                                  iconSize: 18.0,
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                chipSpacing: 12.0,
                                                rowSpacing: 12.0,
                                                multiselect: false,
                                                initialized: _model
                                                        .categoryChipsAllValue !=
                                                    null,
                                                alignment: WrapAlignment.start,
                                                controller: _model
                                                        .categoryChipsAllValueController ??=
                                                    FormFieldController<
                                                        List<String>>(
                                                  [
                                                    widget.chosenGroup!
                                                        .groupCategory
                                                  ],
                                                ),
                                                wrapped: true,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    if (!_model.categoryAll)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: FutureBuilder<
                                              List<GroupsCategoriesRecord>>(
                                            future:
                                                queryGroupsCategoriesRecordOnce(
                                              limit: 5,
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
                                              List<GroupsCategoriesRecord>
                                                  categoryChipsNotAllGroupsCategoriesRecordList =
                                                  snapshot.data!;
                                              return FlutterFlowChoiceChips(
                                                options:
                                                    categoryChipsNotAllGroupsCategoriesRecordList
                                                        .map((e) =>
                                                            e.nameofCategory)
                                                        .toList()
                                                        .map((label) =>
                                                            ChipData(label))
                                                        .toList(),
                                                onChanged: (val) => setState(() =>
                                                    _model.categoryChipsNotAllValue =
                                                        val?.first),
                                                selectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .systemGray3,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  iconSize: 18.0,
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                unselectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .systemBackground,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                      ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary,
                                                  iconSize: 18.0,
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                chipSpacing: 12.0,
                                                rowSpacing: 12.0,
                                                multiselect: false,
                                                initialized: _model
                                                        .categoryChipsNotAllValue !=
                                                    null,
                                                alignment: WrapAlignment.start,
                                                controller: _model
                                                        .categoryChipsNotAllValueController ??=
                                                    FormFieldController<
                                                        List<String>>(
                                                  [
                                                    widget.chosenGroup!
                                                        .groupCategory
                                                  ],
                                                ),
                                                wrapped: true,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondarySystemBackground,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 8.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '3owgmqh5' /* Day of the Week */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .systemGray,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.1,
                                              height: 10.0,
                                              decoration: BoxDecoration(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 12.0, 0.0, 0.0),
                                        child: FlutterFlowChoiceChips(
                                          options: [
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'f3imt59s' /* Monday */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'aktrbow9' /* Tuesday */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'ki7se90t' /* Wednesday */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              '2hg9j7kf' /* Thursday */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'opb30ysa' /* Friday */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'hyi9ddqh' /* Saturday */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'l90ujdg3' /* Sunday */,
                                            ))
                                          ],
                                          onChanged: (val) => setState(() =>
                                              _model.dayoftheWeekChipsValue =
                                                  val?.first),
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .systemGray3,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 15.0,
                                                    ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            iconSize: 18.0,
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .systemBackground,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                    ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiary,
                                            iconSize: 18.0,
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          chipSpacing: 12.0,
                                          rowSpacing: 12.0,
                                          multiselect: false,
                                          initialized:
                                              _model.dayoftheWeekChipsValue !=
                                                  null,
                                          alignment: WrapAlignment.start,
                                          controller: _model
                                                  .dayoftheWeekChipsValueController ??=
                                              FormFieldController<List<String>>(
                                            [widget.chosenGroup!.meetingDay],
                                          ),
                                          wrapped: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondarySystemBackground,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 8.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '4p1rbe36' /* Time of Day */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .systemGray,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.1,
                                              height: 10.0,
                                              decoration: BoxDecoration(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 12.0, 0.0, 0.0),
                                        child: FlutterFlowChoiceChips(
                                          options: [
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              '68f4ltxt' /* Morning */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'ui9h92tv' /* Midday */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              '9nv89l6q' /* Afternoon */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'd2a7mx47' /* Evening */,
                                            ))
                                          ],
                                          onChanged: (val) => setState(() =>
                                              _model.toDChipsValue =
                                                  val?.first),
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .systemGray3,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            iconSize: 18.0,
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .systemBackground,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                    ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiary,
                                            iconSize: 18.0,
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          chipSpacing: 12.0,
                                          rowSpacing: 12.0,
                                          multiselect: false,
                                          initialized:
                                              _model.toDChipsValue != null,
                                          alignment: WrapAlignment.start,
                                          controller: _model
                                                  .toDChipsValueController ??=
                                              FormFieldController<List<String>>(
                                            [widget.chosenGroup!.meetingTime],
                                          ),
                                          wrapped: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondarySystemBackground,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'h6ywu4e4' /* Age Range */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .systemGray,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.1,
                                              height: 10.0,
                                              decoration: BoxDecoration(),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 12.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '64z3cqip' /* View all */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          if (!_model.ageAll)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model.ageAll = true;
                                                });
                                              },
                                              child: Icon(
                                                Icons.chevron_right_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryLabel,
                                                size: 24.0,
                                              ),
                                            ),
                                          if (_model.ageAll)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model.ageAll = false;
                                                });
                                              },
                                              child: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryLabel,
                                                size: 24.0,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    if (!_model.ageAll)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 12.0, 0.0, 0.0),
                                          child: FlutterFlowChoiceChips(
                                            options: [
                                              ChipData(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'ezzymthe' /* High School (9th-12th Grade) */,
                                              )),
                                              ChipData(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'sov4gcch' /* College (18-25) */,
                                              )),
                                              ChipData(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'rdmtqiul' /* Adult (30-60) */,
                                              ))
                                            ],
                                            onChanged: (val) => setState(() =>
                                                _model.ageRangeChipsNotAllValue =
                                                    val?.first),
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .systemGray3,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              iconSize: 18.0,
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .systemBackground,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                      ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              iconSize: 18.0,
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            chipSpacing: 12.0,
                                            rowSpacing: 12.0,
                                            multiselect: false,
                                            initialized: _model
                                                    .ageRangeChipsNotAllValue !=
                                                null,
                                            alignment: WrapAlignment.start,
                                            controller: _model
                                                    .ageRangeChipsNotAllValueController ??=
                                                FormFieldController<
                                                    List<String>>(
                                              [widget.chosenGroup!.targetAge],
                                            ),
                                            wrapped: true,
                                          ),
                                        ),
                                      ),
                                    if (_model.ageAll)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 12.0, 0.0, 0.0),
                                          child: FlutterFlowChoiceChips(
                                            options: [
                                              ChipData(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                's93o652g' /* Elementary (1st-5th Grade) */,
                                              )),
                                              ChipData(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'llz3r075' /* Middle School (6th-8th Grade) */,
                                              )),
                                              ChipData(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'xvhnonwv' /* High School (9th-12th Grade) */,
                                              )),
                                              ChipData(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'mbacwflu' /* College (18-25) */,
                                              )),
                                              ChipData(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '3lbrijdu' /* Young Adult  (25-30) */,
                                              )),
                                              ChipData(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'cralpidz' /* Adult (30-60) */,
                                              )),
                                              ChipData(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '10qt2t2f' /* Seniors (60+) */,
                                              ))
                                            ],
                                            onChanged: (val) => setState(() =>
                                                _model.ageRangeChipsAllValue =
                                                    val?.first),
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .systemGray3,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              iconSize: 18.0,
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .systemBackground,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                      ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              iconSize: 18.0,
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            chipSpacing: 12.0,
                                            rowSpacing: 12.0,
                                            multiselect: false,
                                            initialized:
                                                _model.ageRangeChipsAllValue !=
                                                    null,
                                            alignment: WrapAlignment.start,
                                            controller: _model
                                                    .ageRangeChipsAllValueController ??=
                                                FormFieldController<
                                                    List<String>>(
                                              [widget.chosenGroup!.targetAge],
                                            ),
                                            wrapped: true,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondarySystemBackground,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 8.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '1xub9f5i' /* Gender */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .systemGray,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 12.0, 0.0, 0.0),
                                        child: FlutterFlowRadioButton(
                                          options: [
                                            FFLocalizations.of(context).getText(
                                              'da99cih3' /* Male */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '322iy4l7' /* Female */,
                                            )
                                          ].toList(),
                                          onChanged: (val) => setState(() {}),
                                          controller: _model
                                                  .radioButtonValueController ??=
                                              FormFieldController<String>(widget
                                                  .chosenGroup!.targetGender),
                                          optionHeight: 32.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .systemGray,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                              ),
                                          selectedTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .label,
                                                    useGoogleFonts: false,
                                                  ),
                                          buttonPosition:
                                              RadioButtonPosition.left,
                                          direction: Axis.vertical,
                                          radioButtonColor:
                                              FlutterFlowTheme.of(context)
                                                  .label,
                                          inactiveRadioButtonColor:
                                              FlutterFlowTheme.of(context)
                                                  .systemGray5,
                                          toggleable: true,
                                          horizontalAlignment:
                                              WrapAlignment.start,
                                          verticalAlignment:
                                              WrapCrossAlignment.start,
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: SwitchListTile(
                        value: _model.switchListTileValue ??=
                            widget.chosenGroup!.featuredMessage,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.switchListTileValue = newValue!);
                        },
                        title: Text(
                          FFLocalizations.of(context).getText(
                            '1joo3i3i' /* Make this group featured? */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        activeColor: FlutterFlowTheme.of(context).prayerRing,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                    SwitchListTile(
                      value: _model.groupPrivateSelectorValue ??=
                          widget.chosenGroup!.closedGroup,
                      onChanged: (newValue) async {
                        setState(
                            () => _model.groupPrivateSelectorValue = newValue!);
                      },
                      title: Text(
                        FFLocalizations.of(context).getText(
                          'p4uixvr3' /* Make this group private? */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                      ),
                      activeColor: FlutterFlowTheme.of(context).worshipRing,
                      dense: true,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                    Container(
                      decoration: BoxDecoration(),
                    ),
                    StreamBuilder<List<GlobalGroupsDataRecord>>(
                      stream: queryGlobalGroupsDataRecord(
                        queryBuilder: (globalGroupsDataRecord) =>
                            globalGroupsDataRecord.orderBy('dayInteger',
                                descending: true),
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
                        List<GlobalGroupsDataRecord>
                            containerGlobalGroupsDataRecordList =
                            snapshot.data!;
                        final containerGlobalGroupsDataRecord =
                            containerGlobalGroupsDataRecordList.isNotEmpty
                                ? containerGlobalGroupsDataRecordList.first
                                : null;
                        return Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 16.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (_model.groupPrivateSelectorValue!) {
                                  await containerGlobalGroupsDataRecord!
                                      .reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'closedGroups':
                                            FieldValue.increment(-(1)),
                                      },
                                    ),
                                  });
                                } else {
                                  await containerGlobalGroupsDataRecord!
                                      .reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'openGroups':
                                            FieldValue.increment(-(1)),
                                      },
                                    ),
                                  });
                                }

                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: FlutterFlowTheme.of(context)
                                      .opagueSeparator,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                        child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: DeleteGroupWidget(
                                        group: widget.chosenGroup!.reference,
                                        groupDoc: widget.chosenGroup!,
                                      ),
                                    ));
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'r80a8pg2' /* Delete Group */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .lightSecondaryText,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.cancel_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .prayerRing,
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    FlutterFlowTimer(
                      initialTime: _model.timerSecondPageMilliseconds,
                      getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                          value,
                          milliSecond: false),
                      controller: _model.timerSecondPageController,
                      updateStateInterval: Duration(milliseconds: 10),
                      onChanged: (value, displayTime, shouldUpdate) {
                        _model.timerSecondPageMilliseconds = value;
                        _model.timerSecondPageValue = displayTime;
                        if (shouldUpdate) setState(() {});
                      },
                      onEnded: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor:
                              FlutterFlowTheme.of(context).opagueSeparator,
                          isDismissible: false,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                                child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: FeaturedNotificationGroupsWidget(
                                chosenResource: widget.chosenGroup!,
                              ),
                            ));
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: Colors.transparent,
                          ),
                    ),
                    if (!(isWeb
                        ? MediaQuery.viewInsetsOf(context).bottom > 0
                        : _isKeyboardVisible))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 50.0),
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
                                        'q8umnzh1' /* Cancel */,
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
                            StreamBuilder<List<GlobalGroupsDataRecord>>(
                              stream: queryGlobalGroupsDataRecord(
                                queryBuilder: (globalGroupsDataRecord) =>
                                    globalGroupsDataRecord.orderBy('dayInteger',
                                        descending: true),
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
                                List<GlobalGroupsDataRecord>
                                    containerGlobalGroupsDataRecordList =
                                    snapshot.data!;
                                final containerGlobalGroupsDataRecord =
                                    containerGlobalGroupsDataRecordList
                                            .isNotEmpty
                                        ? containerGlobalGroupsDataRecordList
                                            .first
                                        : null;
                                return Container(
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
                                      if (_model.switchListTileValue!) {
                                        if (FFAppState()
                                            .groupLeaders
                                            .isNotEmpty) {
                                          HapticFeedback.lightImpact();

                                          await widget.chosenGroup!.reference
                                              .update({
                                            ...createGroupsRecordData(
                                              imageThumbnail: _model
                                                              .uploadedFileUrl1 !=
                                                          null &&
                                                      _model.uploadedFileUrl1 !=
                                                          ''
                                                  ? _model.uploadedFileUrl1
                                                  : widget.chosenGroup
                                                      ?.imageThumbnail,
                                              videoName: _model.textController1
                                                              .text !=
                                                          null &&
                                                      _model.textController1
                                                              .text !=
                                                          ''
                                                  ? _model.textController1.text
                                                  : widget
                                                      .chosenGroup?.videoName,
                                              messageDescription: _model
                                                              .textController2
                                                              .text !=
                                                          null &&
                                                      _model.textController2
                                                              .text !=
                                                          ''
                                                  ? _model.textController2.text
                                                  : widget.chosenGroup
                                                      ?.messageDescription,
                                              messageNotes: _model
                                                              .uploadedFileUrl2 !=
                                                          null &&
                                                      _model.uploadedFileUrl2 !=
                                                          ''
                                                  ? _model.uploadedFileUrl2
                                                  : widget.chosenGroup
                                                      ?.messageNotes,
                                              meetingDay:
                                                  _model.dayoftheWeekChipsValue,
                                              meetingTime: _model.toDChipsValue,
                                              targetGender:
                                                  _model.radioButtonValue,
                                              targetAge: () {
                                                if (_model.ageRangeChipsAllValue !=
                                                        null &&
                                                    _model.ageRangeChipsAllValue !=
                                                        '') {
                                                  return _model
                                                      .ageRangeChipsAllValue;
                                                } else if (_model
                                                            .ageRangeChipsNotAllValue !=
                                                        null &&
                                                    _model.ageRangeChipsNotAllValue !=
                                                        '') {
                                                  return _model
                                                      .ageRangeChipsNotAllValue;
                                                } else {
                                                  return '';
                                                }
                                              }(),
                                              groupCategory: () {
                                                if (_model.categoryChipsAllValue !=
                                                        null &&
                                                    _model.categoryChipsAllValue !=
                                                        '') {
                                                  return _model
                                                      .categoryChipsAllValue;
                                                } else if (_model
                                                            .categoryChipsNotAllValue !=
                                                        null &&
                                                    _model.categoryChipsNotAllValue !=
                                                        '') {
                                                  return _model
                                                      .categoryChipsNotAllValue;
                                                } else {
                                                  return '';
                                                }
                                              }(),
                                              featuredMessage:
                                                  _model.switchListTileValue,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'groupLeaders':
                                                    FFAppState().groupLeaders,
                                              },
                                            ),
                                          });

                                          await FFAppState()
                                              .groupLeaders
                                              .first
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'groups':
                                                    FieldValue.arrayUnion([
                                                  widget.chosenGroup?.reference
                                                ]),
                                              },
                                            ),
                                          });

                                          await FFAppState()
                                              .groupLeaders
                                              .last
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'groups':
                                                    FieldValue.arrayUnion([
                                                  widget.chosenGroup?.reference
                                                ]),
                                              },
                                            ),
                                          });
                                          _model.updatePage(() {
                                            FFAppState().groupLeaders = [];
                                          });
                                          _model.timerSecondPageController
                                              .onStartTimer();
                                          Navigator.pop(context);
                                        } else {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor:
                                                FlutterFlowTheme.of(context)
                                                    .opagueSeparator,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                  child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: GroupLeadersSetWidget(),
                                              ));
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        }
                                      } else {
                                        if (FFAppState()
                                            .groupLeaders
                                            .isNotEmpty) {
                                          HapticFeedback.lightImpact();

                                          await widget.chosenGroup!.reference
                                              .update({
                                            ...createGroupsRecordData(
                                              imageThumbnail: _model
                                                              .uploadedFileUrl1 !=
                                                          null &&
                                                      _model.uploadedFileUrl1 !=
                                                          ''
                                                  ? _model.uploadedFileUrl1
                                                  : widget.chosenGroup
                                                      ?.imageThumbnail,
                                              videoName: _model.textController1
                                                              .text !=
                                                          null &&
                                                      _model.textController1
                                                              .text !=
                                                          ''
                                                  ? _model.textController1.text
                                                  : widget
                                                      .chosenGroup?.videoName,
                                              messageDescription: _model
                                                              .textController2
                                                              .text !=
                                                          null &&
                                                      _model.textController2
                                                              .text !=
                                                          ''
                                                  ? _model.textController2.text
                                                  : widget.chosenGroup
                                                      ?.messageDescription,
                                              messageNotes: _model
                                                              .uploadedFileUrl2 !=
                                                          null &&
                                                      _model.uploadedFileUrl2 !=
                                                          ''
                                                  ? _model.uploadedFileUrl2
                                                  : widget.chosenGroup
                                                      ?.messageNotes,
                                              meetingDay:
                                                  _model.dayoftheWeekChipsValue,
                                              meetingTime: _model.toDChipsValue,
                                              targetGender:
                                                  _model.radioButtonValue,
                                              targetAge: () {
                                                if (_model.ageRangeChipsAllValue !=
                                                        null &&
                                                    _model.ageRangeChipsAllValue !=
                                                        '') {
                                                  return _model
                                                      .ageRangeChipsAllValue;
                                                } else if (_model
                                                            .ageRangeChipsNotAllValue !=
                                                        null &&
                                                    _model.ageRangeChipsNotAllValue !=
                                                        '') {
                                                  return _model
                                                      .ageRangeChipsNotAllValue;
                                                } else {
                                                  return '';
                                                }
                                              }(),
                                              groupCategory: () {
                                                if (_model.categoryChipsAllValue !=
                                                        null &&
                                                    _model.categoryChipsAllValue !=
                                                        '') {
                                                  return _model
                                                      .categoryChipsAllValue;
                                                } else if (_model
                                                            .categoryChipsNotAllValue !=
                                                        null &&
                                                    _model.categoryChipsNotAllValue !=
                                                        '') {
                                                  return _model
                                                      .categoryChipsNotAllValue;
                                                } else {
                                                  return '';
                                                }
                                              }(),
                                              featuredMessage:
                                                  _model.switchListTileValue,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'groupLeaders':
                                                    FFAppState().groupLeaders,
                                              },
                                            ),
                                          });

                                          await FFAppState()
                                              .groupLeaders
                                              .first
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'groups':
                                                    FieldValue.arrayUnion([
                                                  widget.chosenGroup?.reference
                                                ]),
                                              },
                                            ),
                                          });

                                          await FFAppState()
                                              .groupLeaders
                                              .last
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'groups':
                                                    FieldValue.arrayUnion([
                                                  widget.chosenGroup?.reference
                                                ]),
                                              },
                                            ),
                                          });
                                          _model.updatePage(() {
                                            FFAppState().groupLeaders = [];
                                          });
                                          _model.timerSecondPageController
                                              .onStartTimer();
                                          Navigator.pop(context);
                                        } else {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor:
                                                FlutterFlowTheme.of(context)
                                                    .opagueSeparator,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                  child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: GroupLeadersSetWidget(),
                                              ));
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondarySystemBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '6pdsrwvp' /* Submit */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                fontWeight: FontWeight.w500,
                                              ),
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
