import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/chat_tab_icon_unselected_widget.dart';
import '/components/event_edit_widget.dart';
import '/components/group_filter_widget.dart';
import '/components/group_upload_only_widget.dart';
import '/components/profile_tab_icon_unselected_widget.dart';
import '/components/video_details_b_s_widget.dart';
import '/components/video_upload_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'grow_page_model.dart';
export 'grow_page_model.dart';

class GrowPageWidget extends StatefulWidget {
  const GrowPageWidget({Key? key}) : super(key: key);

  @override
  _GrowPageWidgetState createState() => _GrowPageWidgetState();
}

class _GrowPageWidgetState extends State<GrowPageWidget>
    with TickerProviderStateMixin {
  late GrowPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = {
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
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
          begin: Offset(20.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(-30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'stackOnPageLoadAnimation': AnimationInfo(
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
    'textOnPageLoadAnimation2': AnimationInfo(
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
    'containerOnPageLoadAnimation3': AnimationInfo(
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
    'columnOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
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
          begin: Offset(-30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(-30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
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
    'containerOnPageLoadAnimation4': AnimationInfo(
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
    'containerOnPageLoadAnimation5': AnimationInfo(
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
    'textOnPageLoadAnimation5': AnimationInfo(
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
    'textOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(-30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(-30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation5': AnimationInfo(
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
          begin: Offset(-30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation8': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(-30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation6': AnimationInfo(
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
          begin: Offset(-30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation7': AnimationInfo(
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
          begin: Offset(-30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation9': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(-30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation8': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation10': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(-30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation9': AnimationInfo(
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
          begin: Offset(-30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation10': AnimationInfo(
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
          begin: Offset(-30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation11': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(-30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GrowPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation();
      FFAppState().update(() {
        FFAppState().showFullList = true;
      });
      setState(() {
        _model.searchFieldVisible = false;
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

    _model.textFieldPage1Controller ??= TextEditingController();
    _model.textFieldPage1FocusNode ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).systemBackground,
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.06,
                    decoration: BoxDecoration(),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'cz33h4ix' /* Resources */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).label,
                                useGoogleFonts: false,
                              ),
                        ),
                        Expanded(
                          child: Container(
                            height: 2.0,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        if (!(valueOrDefault<bool>(
                                currentUserDocument?.admin, false) ||
                            valueOrDefault<bool>(
                                currentUserDocument?.groupsLeader, false)))
                          AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (Theme.of(context).brightness ==
                                      Brightness.dark)
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
                                  if (!(Theme.of(context).brightness ==
                                      Brightness.dark))
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
                          ),
                        if (valueOrDefault<bool>(
                            currentUserDocument?.admin, false))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: 40.0,
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
                                    setState(() {
                                      FFAppState().series = false;
                                    });
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: FlutterFlowTheme.of(context)
                                          .systemGray6,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                            child: GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.92,
                                              child: VideoUploadWidget(),
                                            ),
                                          ),
                                        ));
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.file_upload_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 26.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (!valueOrDefault<bool>(
                                currentUserDocument?.admin, false) &&
                            valueOrDefault<bool>(
                                currentUserDocument?.groupsLeader, false))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: 40.0,
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
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: FlutterFlowTheme.of(context)
                                          .systemGray6,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                            child: GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.92,
                                              child: GroupUploadOnlyWidget(),
                                            ),
                                          ),
                                        ));
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.file_upload_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 26.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Container(
                      width: 200.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 8.0, 12.0, 8.0),
                        child: FlutterFlowChoiceChips(
                          options: [
                            ChipData(FFLocalizations.of(context).getText(
                              'n65zqtwt' /* Videos */,
                            )),
                            ChipData(FFLocalizations.of(context).getText(
                              'k7ebize0' /* Groups */,
                            )),
                            ChipData(FFLocalizations.of(context).getText(
                              'u97q7kq6' /* Events */,
                            )),
                            ChipData(FFLocalizations.of(context).getText(
                              'cjugnasg' /* Notes */,
                            ))
                          ],
                          onChanged: (val) async {
                            setState(
                                () => _model.choiceChipsValue = val?.first);
                            if ((_model.choiceChipsValue == 'Videos') ||
                                (_model.choiceChipsValue == 'Vídeos')) {
                              await _model.pageViewController?.animateToPage(
                                0,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                              setState(() {
                                FFAppState().resourceTabSelector = 0;
                              });
                            }
                            if ((_model.choiceChipsValue == 'Groups') ||
                                (_model.choiceChipsValue == 'Grupos')) {
                              await _model.pageViewController?.animateToPage(
                                1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                              setState(() {
                                FFAppState().resourceTabSelector = 1;
                              });
                            }
                            if ((_model.choiceChipsValue == 'Events') ||
                                (_model.choiceChipsValue == 'Eventos')) {
                              await _model.pageViewController?.animateToPage(
                                2,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                              setState(() {
                                FFAppState().resourceTabSelector = 2;
                              });
                            }
                            if ((_model.choiceChipsValue == 'Notes') ||
                                (_model.choiceChipsValue == 'Guías')) {
                              await _model.pageViewController?.animateToPage(
                                3,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                              setState(() {
                                FFAppState().resourceTabSelector = 3;
                              });
                            }
                          },
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).systemGray3,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).label,
                                ),
                            iconColor: FlutterFlowTheme.of(context).primary,
                            iconSize: 18.0,
                            elevation: 0.0,
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).systemGray6,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryLabel,
                                ),
                            iconColor: FlutterFlowTheme.of(context).primary,
                            iconSize: 18.0,
                            elevation: 0.0,
                          ),
                          chipSpacing: 12.0,
                          rowSpacing: 12.0,
                          multiselect: false,
                          initialized: _model.choiceChipsValue != null,
                          alignment: WrapAlignment.spaceEvenly,
                          controller: _model.choiceChipsValueController ??=
                              FormFieldController<List<String>>(
                            [
                              () {
                                if (FFAppState().resourceTabSelector == 0) {
                                  return 'Videos';
                                } else if (FFAppState().resourceTabSelector ==
                                    1) {
                                  return 'Groups';
                                } else if (FFAppState().resourceTabSelector ==
                                    2) {
                                  return 'Events';
                                } else if (FFAppState().resourceTabSelector ==
                                    3) {
                                  return 'Notes';
                                } else {
                                  return 'Vidoes';
                                }
                              }()
                            ],
                          ),
                          wrapped: true,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _model.pageViewController ??=
                            PageController(
                                initialPage: min(
                                    valueOrDefault<int>(
                                      FFAppState().resourceTabSelector,
                                      0,
                                    ),
                                    3)),
                        scrollDirection: Axis.horizontal,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 20.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      height: 45.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondarySystemBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Container(
                                                        width: 100.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondarySystemBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 100.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .textFieldPage1Controller,
                                                                    focusNode:
                                                                        _model
                                                                            .textFieldPage1FocusNode,
                                                                    onFieldSubmitted:
                                                                        (_) async {
                                                                      await queryResourceVideosRecordOnce()
                                                                          .then(
                                                                            (records) =>
                                                                                _model.simpleSearchResults1 = TextSearch(
                                                                              records
                                                                                  .map(
                                                                                    (record) => TextSearchItem.fromTerms(record, [
                                                                                      record.videoName!,
                                                                                      record.messageDescription!,
                                                                                      record.speaker!
                                                                                    ]),
                                                                                  )
                                                                                  .toList(),
                                                                            ).search(_model.textFieldPage1Controller.text).map((r) => r.object).toList(),
                                                                          )
                                                                          .onError((_, __) => _model.simpleSearchResults1 =
                                                                              [])
                                                                          .whenComplete(() =>
                                                                              setState(() {}));

                                                                      if (_model.textFieldPage1Controller.text !=
                                                                              null &&
                                                                          _model.textFieldPage1Controller.text !=
                                                                              '') {
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().showFullList =
                                                                              false;
                                                                        });
                                                                      }
                                                                    },
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      labelText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'mrs4xdjx' /* Search recent... */,
                                                                      ),
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).lightSecondaryText,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).lightSecondaryText,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                      enabledBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      errorBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      prefixIcon:
                                                                          Icon(
                                                                        Icons
                                                                            .search,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lightSecondaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).label,
                                                                          fontSize:
                                                                              16.0,
                                                                        ),
                                                                    validator: _model
                                                                        .textFieldPage1ControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 40.0,
                                                              height: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Visibility(
                                                                visible:
                                                                    !FFAppState()
                                                                        .showFullList,
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
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
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .showFullList =
                                                                          true;
                                                                    });
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .textFieldPage1Controller
                                                                          ?.clear();
                                                                    });
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .clear_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lightSecondaryText,
                                                                    size: 20.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation1']!),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 20.0, 16.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '8nrvwa8i' /* Featured */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'textOnPageLoadAnimation1']!),
                                                  FlutterFlowTimer(
                                                    initialTime: _model
                                                        .timerMilliseconds,
                                                    getDisplayTime: (value) =>
                                                        StopWatchTimer
                                                            .getDisplayTime(
                                                                value,
                                                                milliSecond:
                                                                    false),
                                                    controller:
                                                        _model.timerController,
                                                    updateStateInterval:
                                                        Duration(
                                                            milliseconds: 1000),
                                                    onChanged: (value,
                                                        displayTime,
                                                        shouldUpdate) {
                                                      _model.timerMilliseconds =
                                                          value;
                                                      _model.timerValue =
                                                          displayTime;
                                                      if (shouldUpdate)
                                                        setState(() {});
                                                    },
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: StreamBuilder<
                                                  List<ResourceVideosRecord>>(
                                                stream:
                                                    queryResourceVideosRecord(
                                                  queryBuilder:
                                                      (resourceVideosRecord) =>
                                                          resourceVideosRecord
                                                              .where(
                                                                'featuredMessage',
                                                                isEqualTo: true,
                                                              )
                                                              .orderBy(
                                                                  'timeEdited',
                                                                  descending:
                                                                      true),
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
                                                          color:
                                                              Color(0xFF7F95AD),
                                                          size: 75.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<ResourceVideosRecord>
                                                      container1ResourceVideosRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final container1ResourceVideosRecord =
                                                      container1ResourceVideosRecordList
                                                              .isNotEmpty
                                                          ? container1ResourceVideosRecordList
                                                              .first
                                                          : null;
                                                  return Container(
                                                    width: double.infinity,
                                                    constraints: BoxConstraints(
                                                      maxHeight:
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.45,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Stack(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            children: [
                                                              InkWell(
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
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return WebViewAware(
                                                                          child:
                                                                              GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              VideoDetailsBSWidget(
                                                                            videoChosenRef:
                                                                                container1ResourceVideosRecord!.reference,
                                                                            videoChosenDoc:
                                                                                container1ResourceVideosRecord!,
                                                                          ),
                                                                        ),
                                                                      ));
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));

                                                                  await container1ResourceVideosRecord!
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'users_watched':
                                                                            FieldValue.arrayUnion([
                                                                          currentUserReference
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });

                                                                  await currentUserReference!
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'timesWatchedVideo':
                                                                            FieldValue.increment(1),
                                                                        'videos_watched':
                                                                            FieldValue.arrayUnion([
                                                                          container1ResourceVideosRecord
                                                                              ?.reference
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                },
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
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
                                                                      container1ResourceVideosRecord
                                                                          ?.imageThumbnail,
                                                                      'https://global-uploads.webflow.com/5ff4ff4b9e6b3968d59609e3/62d578a9b6ce9b58343b868d_Web-Card-p-800.jpg',
                                                                    ),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
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
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return WebViewAware(
                                                                            child:
                                                                                GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                VideoDetailsBSWidget(
                                                                              videoChosenRef: container1ResourceVideosRecord!.reference,
                                                                              videoChosenDoc: container1ResourceVideosRecord!,
                                                                            ),
                                                                          ),
                                                                        ));
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));

                                                                    await container1ResourceVideosRecord!
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'users_watched':
                                                                              FieldValue.arrayUnion([
                                                                            currentUserReference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });

                                                                    await currentUserReference!
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'timesWatchedVideo':
                                                                              FieldValue.increment(1),
                                                                          'videos_watched':
                                                                              FieldValue.arrayUnion([
                                                                            container1ResourceVideosRecord?.reference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondarySystemBackground,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .play_arrow_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .label,
                                                                        size:
                                                                            28.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'stackOnPageLoadAnimation']!),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        12.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                container1ResourceVideosRecord
                                                                    ?.videoName,
                                                                'Video Name',
                                                              ),
                                                              maxLines: 3,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .label,
                                                                    fontSize:
                                                                        18.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                              minFontSize: 16.0,
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'textOnPageLoadAnimation2']!),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                '${container1ResourceVideosRecord?.speaker} | ${container1ResourceVideosRecord?.timeofRecording}',
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
                                                                          14.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        8.0,
                                                                        25.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                StreamBuilder<
                                                                    List<
                                                                        UsersRecord>>(
                                                                  stream:
                                                                      queryUsersRecord(
                                                                    queryBuilder:
                                                                        (usersRecord) =>
                                                                            usersRecord.where(
                                                                      'videos_watched',
                                                                      arrayContains:
                                                                          container1ResourceVideosRecord
                                                                              ?.reference,
                                                                    ),
                                                                    limit: 4,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              75.0,
                                                                          height:
                                                                              75.0,
                                                                          child:
                                                                              SpinKitRipple(
                                                                            color:
                                                                                Color(0xFF7F95AD),
                                                                            size:
                                                                                75.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UsersRecord>
                                                                        rowUsersRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: List.generate(
                                                                          rowUsersRecordList
                                                                              .length,
                                                                          (rowIndex) {
                                                                        final rowUsersRecord =
                                                                            rowUsersRecordList[rowIndex];
                                                                        return Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -0.98,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                22.0,
                                                                            height:
                                                                                22.0,
                                                                            decoration:
                                                                                BoxDecoration(
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
                                                                            alignment:
                                                                                AlignmentDirectional(-0.8, 0.0),
                                                                          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation2']!),
                                                                        );
                                                                      }),
                                                                    );
                                                                  },
                                                                ),
                                                                if (container1ResourceVideosRecord!
                                                                        .usersWatched
                                                                        .length >
                                                                    4)
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -0.5,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              UsersRecord>>(
                                                                        stream:
                                                                            queryUsersRecord(
                                                                          queryBuilder: (usersRecord) =>
                                                                              usersRecord.where(
                                                                            'videos_watched',
                                                                            arrayContains:
                                                                                container1ResourceVideosRecord?.reference,
                                                                          ),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                              containerUsersRecordList =
                                                                              snapshot.data!;
                                                                          return Container(
                                                                            height:
                                                                                30.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.transparent,
                                                                              shape: BoxShape.rectangle,
                                                                              border: Border.all(
                                                                                color: Colors.transparent,
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'tn8j0a9y' /* + */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: FlutterFlowTheme.of(context).label,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                if (container1ResourceVideosRecord!.usersWatched.length <= 4)
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '26yvv7q8' /* 0 */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: FlutterFlowTheme.of(context).label,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ).animateOnPageLoad(
                                                                              animationsMap['containerOnPageLoadAnimation3']!);
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (container1ResourceVideosRecord!
                                                                        .usersWatched
                                                                        .length >
                                                                    4)
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        (container1ResourceVideosRecord!.usersWatched.length -
                                                                                4)
                                                                            .toString(),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).label,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'r6j1omlj' /* watched so far! */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).label,
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (FFAppState().showFullList)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 12.0),
                                    child: StreamBuilder<
                                        List<ResourceVideosRecord>>(
                                      stream: queryResourceVideosRecord(
                                        queryBuilder: (resourceVideosRecord) =>
                                            resourceVideosRecord.orderBy(
                                                'timeofRecording',
                                                descending: true),
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
                                        List<ResourceVideosRecord>
                                            staggeredViewResourceVideosRecordList =
                                            snapshot.data!;
                                        return MasonryGridView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                          ),
                                          crossAxisSpacing: 12.0,
                                          mainAxisSpacing: 12.0,
                                          itemCount:
                                              staggeredViewResourceVideosRecordList
                                                  .length,
                                          shrinkWrap: true,
                                          itemBuilder:
                                              (context, staggeredViewIndex) {
                                            final staggeredViewResourceVideosRecord =
                                                staggeredViewResourceVideosRecordList[
                                                    staggeredViewIndex];
                                            return Stack(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 1.0),
                                              children: [
                                                Container(
                                                  constraints: BoxConstraints(
                                                    minWidth: double.infinity,
                                                    minHeight: 175.0,
                                                    maxWidth: double.infinity,
                                                    maxHeight: 225.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (staggeredViewResourceVideosRecord
                                                          .series) {
                                                        context.pushNamed(
                                                          'SeriesOverview',
                                                          queryParameters: {
                                                            'chosenSeries':
                                                                serializeParam(
                                                              staggeredViewResourceVideosRecord
                                                                  .seriesVideoIsAPartOf,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
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
                                                                    VideoDetailsBSWidget(
                                                                  videoChosenRef:
                                                                      staggeredViewResourceVideosRecord
                                                                          .reference,
                                                                  videoChosenDoc:
                                                                      staggeredViewResourceVideosRecord,
                                                                ),
                                                              ),
                                                            ));
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      }

                                                      await staggeredViewResourceVideosRecord
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'users_watched':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              currentUserReference
                                                            ]),
                                                          },
                                                        ),
                                                      });

                                                      await currentUserReference!
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'timesWatchedVideo':
                                                                FieldValue
                                                                    .increment(
                                                                        1),
                                                            'videos_watched':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              staggeredViewResourceVideosRecord
                                                                  .reference
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                      child: CachedNetworkImage(
                                                        fadeInDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        fadeOutDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        imageUrl:
                                                            staggeredViewResourceVideosRecord
                                                                .imageThumbnail,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 8.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondarySystemBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(18.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        4.0,
                                                                        8.0,
                                                                        4.0),
                                                            child: Text(
                                                              () {
                                                                if (staggeredViewResourceVideosRecord
                                                                    .recommendedTalk) {
                                                                  return 'Message';
                                                                } else if (staggeredViewResourceVideosRecord
                                                                    .recommendedDevotional) {
                                                                  return 'Devotional';
                                                                } else if (staggeredViewResourceVideosRecord
                                                                    .announcements) {
                                                                  return 'Announcement';
                                                                } else {
                                                                  return 'Video';
                                                                }
                                                              }(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .label,
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Visibility(
                                    visible: !FFAppState().showFullList,
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Builder(
                                        builder: (context) {
                                          final searchResultsStaggered = _model
                                              .simpleSearchResults1
                                              .toList();
                                          return MasonryGridView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                                SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                            ),
                                            crossAxisSpacing: 12.0,
                                            mainAxisSpacing: 12.0,
                                            itemCount:
                                                searchResultsStaggered.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context,
                                                searchResultsStaggeredIndex) {
                                              final searchResultsStaggeredItem =
                                                  searchResultsStaggered[
                                                      searchResultsStaggeredIndex];
                                              return Stack(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 1.0),
                                                children: [
                                                  Container(
                                                    constraints: BoxConstraints(
                                                      minWidth: double.infinity,
                                                      minHeight: 175.0,
                                                      maxWidth: double.infinity,
                                                      maxHeight: 225.0,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (searchResultsStaggeredItem
                                                            .series) {
                                                          context.pushNamed(
                                                            'SeriesOverview',
                                                            queryParameters: {
                                                              'chosenSeries':
                                                                  serializeParam(
                                                                searchResultsStaggeredItem
                                                                    .seriesVideoIsAPartOf,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
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
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      VideoDetailsBSWidget(
                                                                    videoChosenRef:
                                                                        searchResultsStaggeredItem
                                                                            .reference,
                                                                    videoChosenDoc:
                                                                        searchResultsStaggeredItem,
                                                                  ),
                                                                ),
                                                              ));
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        }

                                                        await searchResultsStaggeredItem
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'users_watched':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                currentUserReference
                                                              ]),
                                                            },
                                                          ),
                                                        });

                                                        await currentUserReference!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'timesWatchedVideo':
                                                                  FieldValue
                                                                      .increment(
                                                                          1),
                                                              'videos_watched':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                searchResultsStaggeredItem
                                                                    .reference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
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
                                                              searchResultsStaggeredItem
                                                                  .imageThumbnail,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondarySystemBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        18.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            4.0,
                                                                            8.0,
                                                                            4.0),
                                                                child: Text(
                                                                  searchResultsStaggeredItem
                                                                          .series
                                                                      ? 'Series'
                                                                      : 'Stand Alone',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .label,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ].addToEnd(SizedBox(height: 300.0)),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['columnOnPageLoadAnimation2']!),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StreamBuilder<List<GroupsRecord>>(
                                  stream: queryGroupsRecord(
                                    queryBuilder: (groupsRecord) => groupsRecord
                                        .where(
                                          'featuredMessage',
                                          isEqualTo: true,
                                        )
                                        .orderBy('time_uploaded',
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
                                    List<GroupsRecord>
                                        container1GroupsRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final container1GroupsRecord =
                                        container1GroupsRecordList.isNotEmpty
                                            ? container1GroupsRecordList.first
                                            : null;
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 20.0, 16.0, 12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'scsykgbu' /* Featured */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'textOnPageLoadAnimation3']!),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'GroupDetails',
                                                queryParameters: {
                                                  'chosenGroup': serializeParam(
                                                    container1GroupsRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'chosenGroup':
                                                      container1GroupsRecord,
                                                },
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12.0, 16.0, 0.0,
                                                          16.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.45,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.25,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'GroupDetails',
                                                          queryParameters: {
                                                            'chosenGroup':
                                                                serializeParam(
                                                              container1GroupsRecord,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'chosenGroup':
                                                                container1GroupsRecord,
                                                          },
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 250.0,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                container1GroupsRecord
                                                                    ?.imageThumbnail,
                                                                'https://images.unsplash.com/photo-1502810365585-56ffa361fdde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                                                              ),
                                                            ).image,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 30.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 125.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x00EEEEEE),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                AutoSizeText(
                                                                  container1GroupsRecord!
                                                                      .videoName,
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .label,
                                                                        fontSize:
                                                                            18.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'textOnPageLoadAnimation4']!),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      AutoSizeText(
                                                                        'Leader: ${container1GroupsRecord?.groupLeaderName}',
                                                                        maxLines:
                                                                            1,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              fontSize: 14.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    'Meeting time: ${container1GroupsRecord?.meetingDay} ${container1GroupsRecord?.meetingTime}',
                                                                    maxLines: 1,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lightSecondaryText,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        16.0,
                                                                        25.0,
                                                                        6.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        UsersRecord>>(
                                                                  stream:
                                                                      queryUsersRecord(
                                                                    queryBuilder:
                                                                        (usersRecord) =>
                                                                            usersRecord.where(
                                                                      'groups',
                                                                      arrayContains:
                                                                          container1GroupsRecord
                                                                              ?.reference,
                                                                    ),
                                                                    limit: 4,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              75.0,
                                                                          height:
                                                                              75.0,
                                                                          child:
                                                                              SpinKitRipple(
                                                                            color:
                                                                                Color(0xFF7F95AD),
                                                                            size:
                                                                                75.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UsersRecord>
                                                                        rowUsersRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: List.generate(
                                                                          rowUsersRecordList
                                                                              .length,
                                                                          (rowIndex) {
                                                                        final rowUsersRecord =
                                                                            rowUsersRecordList[rowIndex];
                                                                        return Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.transparent,
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-0.98, 0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 20.0,
                                                                              height: 20.0,
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
                                                                            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation4']!),
                                                                          ),
                                                                        );
                                                                      }),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              Container(
                                                                height: 30.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '5bx6jfdj' /* + */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    if (container1GroupsRecord!
                                                                            .members
                                                                            .length <=
                                                                        4)
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '2jdq42j7' /* 0 */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    if (container1GroupsRecord!
                                                                            .members
                                                                            .length >
                                                                        4)
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            (container1GroupsRecord!.members.length - 4).toString(),
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
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'e25fls7v' /* members */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                              ),
                                                                        ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation5']!),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'containerOnPageLoadAnimation5']!),
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
                                        ],
                                      ).animateOnPageLoad(animationsMap[
                                          'columnOnPageLoadAnimation3']!),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 20.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'ywudscui' /* All Groups */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation6']!),
                                      if (!FFAppState().groupsFilterSet)
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor:
                                                  FlutterFlowTheme.of(context)
                                                      .opagueSeparator,
                                              useSafeArea: true,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                    child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
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
                                                          0.88,
                                                      child:
                                                          GroupFilterWidget(),
                                                    ),
                                                  ),
                                                ));
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Container(
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .secondarySystemBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.filter_list,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(6.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'e5t1fb0k' /* Filter */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (FFAppState().groupsFilterSet)
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              FFAppState().meetingDay = '';
                                              FFAppState().meetingTime = '';
                                              FFAppState().ageRange = '';
                                              FFAppState().gender = '';
                                              FFAppState().groupCategory = '';
                                              FFAppState().groupsFilterSet =
                                                  false;
                                            });
                                          },
                                          child: Container(
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .secondarySystemBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.cancel_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 22.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(6.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '5wicson1' /* Reset Filter */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
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
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 65.0),
                                      child: StreamBuilder<List<GroupsRecord>>(
                                        stream: queryGroupsRecord(
                                          queryBuilder: (groupsRecord) =>
                                              groupsRecord
                                                  .where(
                                                    'targetAge',
                                                    isEqualTo: FFAppState()
                                                                .ageRange !=
                                                            ''
                                                        ? FFAppState().ageRange
                                                        : null,
                                                  )
                                                  .where(
                                                    'meetingTime',
                                                    isEqualTo: FFAppState()
                                                                .meetingTime !=
                                                            ''
                                                        ? FFAppState()
                                                            .meetingTime
                                                        : null,
                                                  )
                                                  .where(
                                                    'meetingDay',
                                                    isEqualTo: FFAppState()
                                                                .meetingDay !=
                                                            ''
                                                        ? FFAppState()
                                                            .meetingDay
                                                        : null,
                                                  )
                                                  .where(
                                                    'groupCategory',
                                                    isEqualTo: FFAppState()
                                                                .groupCategory !=
                                                            ''
                                                        ? FFAppState()
                                                            .groupCategory
                                                        : null,
                                                  )
                                                  .where(
                                                    'targetGender',
                                                    isEqualTo: FFAppState()
                                                                .gender !=
                                                            ''
                                                        ? FFAppState().gender
                                                        : null,
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
                                          List<GroupsRecord>
                                              gridViewGroupsRecordList =
                                              snapshot.data!;
                                          return GridView.builder(
                                            padding: EdgeInsets.zero,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 12.0,
                                              mainAxisSpacing: 12.0,
                                              childAspectRatio: 1.0,
                                            ),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                gridViewGroupsRecordList.length,
                                            itemBuilder:
                                                (context, gridViewIndex) {
                                              final gridViewGroupsRecord =
                                                  gridViewGroupsRecordList[
                                                      gridViewIndex];
                                              return Visibility(
                                                visible: gridViewGroupsRecord
                                                        .groupLeaders.length >
                                                    0,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'GroupDetails',
                                                        queryParameters: {
                                                          'chosenGroup':
                                                              serializeParam(
                                                            gridViewGroupsRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'chosenGroup':
                                                              gridViewGroupsRecord,
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Container(
                                                        width: 100.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondarySystemBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.08,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    image:
                                                                        DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image:
                                                                          CachedNetworkImageProvider(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          gridViewGroupsRecord
                                                                              .imageThumbnail,
                                                                          'https://images.unsplash.com/photo-1502810365585-56ffa361fdde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              20.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              20.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          30.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children: [
                                                                          Stack(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            children: [
                                                                              StreamBuilder<UsersRecord>(
                                                                                stream: UsersRecord.getDocument(gridViewGroupsRecord.groupLeaders.first),
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
                                                                                  final cardUsersRecord = snapshot.data!;
                                                                                  return Card(
                                                                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                    color: FlutterFlowTheme.of(context).systemBackground,
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(100.0),
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(-0.3, 0.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(1.0),
                                                                                        child: Hero(
                                                                                          tag: valueOrDefault<String>(
                                                                                            cardUsersRecord.photoUrl,
                                                                                            'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg' + '$gridViewIndex',
                                                                                          ),
                                                                                          transitionOnUserGestures: true,
                                                                                          child: ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(100.0),
                                                                                            child: CachedNetworkImage(
                                                                                              fadeInDuration: Duration(milliseconds: 500),
                                                                                              fadeOutDuration: Duration(milliseconds: 500),
                                                                                              imageUrl: valueOrDefault<String>(
                                                                                                cardUsersRecord.photoUrl,
                                                                                                'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg',
                                                                                              ),
                                                                                              width: 70.0,
                                                                                              height: 70.0,
                                                                                              fit: BoxFit.cover,
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
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 18.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .transparent,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                  child: StreamBuilder<
                                                                      UsersRecord>(
                                                                    stream: UsersRecord.getDocument(gridViewGroupsRecord
                                                                        .groupLeaders
                                                                        .first),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                75.0,
                                                                            height:
                                                                                75.0,
                                                                            child:
                                                                                SpinKitRipple(
                                                                              color: Color(0xFF7F95AD),
                                                                              size: 75.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final textUsersRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return AutoSizeText(
                                                                        'Leader: ${textUsersRecord.displayName}'
                                                                            .maybeHandleOverflow(
                                                                          maxChars:
                                                                              25,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              fontSize: 12.0,
                                                                            ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 18.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .transparent,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          6.0,
                                                                          0.0,
                                                                          6.0,
                                                                          0.0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    gridViewGroupsRecord
                                                                        .videoName,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).label,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ].addToEnd(SizedBox(height: 65.0)),
                                ),
                              ].addToEnd(SizedBox(height: 150.0)),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 20.0, 12.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .secondarySystemBackground,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textController2,
                                                          focusNode: _model
                                                              .textFieldFocusNode1,
                                                          onFieldSubmitted:
                                                              (_) async {
                                                            await queryEventsRecordOnce()
                                                                .then(
                                                                  (records) => _model
                                                                          .simpleSearchResults2 =
                                                                      TextSearch(
                                                                    records
                                                                        .map(
                                                                          (record) =>
                                                                              TextSearchItem.fromTerms(record, [
                                                                            record.videoName!,
                                                                            record.messageDescription!,
                                                                            record.speaker!,
                                                                            record.registrationLink!
                                                                          ]),
                                                                        )
                                                                        .toList(),
                                                                  )
                                                                          .search(_model
                                                                              .textController2
                                                                              .text)
                                                                          .map((r) =>
                                                                              r.object)
                                                                          .toList(),
                                                                )
                                                                .onError((_,
                                                                        __) =>
                                                                    _model.simpleSearchResults2 =
                                                                        [])
                                                                .whenComplete(() =>
                                                                    setState(
                                                                        () {}));

                                                            if (_model.textController2
                                                                        .text !=
                                                                    null &&
                                                                _model.textController2
                                                                        .text !=
                                                                    '') {
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .showFullList =
                                                                    false;
                                                              });
                                                            }
                                                          },
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'n8usumdj' /* Search... */,
                                                            ),
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .lightSecondaryText,
                                                                      fontSize:
                                                                          16.0,
                                                                    ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .lightSecondaryText,
                                                                      fontSize:
                                                                          16.0,
                                                                    ),
                                                            enabledBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            prefixIcon: Icon(
                                                              Icons.search,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .lightSecondaryText,
                                                              size: 18.0,
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lightSecondaryText,
                                                                fontSize: 16.0,
                                                              ),
                                                          validator: _model
                                                              .textController2Validator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 40.0,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    child: Visibility(
                                                      visible: !FFAppState()
                                                          .showFullList,
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .showFullList =
                                                                true;
                                                          });
                                                          setState(() {
                                                            _model
                                                                .textController2
                                                                ?.clear();
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.clear_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lightSecondaryText,
                                                          size: 20.0,
                                                        ),
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
                                  StreamBuilder<List<EventsRecord>>(
                                    stream: queryEventsRecord(
                                      queryBuilder: (eventsRecord) =>
                                          eventsRecord
                                              .where(
                                                'featuredMessage',
                                                isEqualTo: true,
                                              )
                                              .orderBy('timeofRecording'),
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
                                      List<EventsRecord>
                                          containerEventsRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final containerEventsRecord =
                                          containerEventsRecordList.isNotEmpty
                                              ? containerEventsRecordList.first
                                              : null;
                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 20.0, 16.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'b4b7aa27' /* Featured */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'textOnPageLoadAnimation7']!),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.25,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Container(
                                                          width: 150.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondarySystemBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
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
                                                            onTap: () async {
                                                              await launchURL(
                                                                  containerEventsRecord!
                                                                      .registrationLink);
                                                            },
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
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
                                                                    containerEventsRecord!
                                                                        .imageThumbnail,
                                                                width: 100.0,
                                                                height: 100.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            containerEventsRecord!
                                                                .videoName,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .label,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      26.0,
                                                                      0.0),
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
                                                            onTap: () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                barrierColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .opagueSeparator,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return WebViewAware(
                                                                      child:
                                                                          GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          Container(
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.92,
                                                                        child:
                                                                            EventEditWidget(
                                                                          chosenEvent:
                                                                              containerEventsRecord,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ));
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            },
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .edit,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'M/d h:mm a',
                                                                  containerEventsRecord
                                                                      ?.startTime,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'N/A',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'dwhh9akl' /* - */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'M/d h:mm a',
                                                                  containerEventsRecord
                                                                      ?.endTime,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'N/A',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                    ),
                                                  ],
                                                ).animateOnPageLoad(animationsMap[
                                                    'columnOnPageLoadAnimation5']!),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 20.0, 0.0, 12.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '3iwdvh1h' /* All Events */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ).animateOnPageLoad(animationsMap[
                                        'textOnPageLoadAnimation8']!),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (FFAppState().showFullList)
                                          StreamBuilder<List<EventsRecord>>(
                                            stream: queryEventsRecord(
                                              queryBuilder: (eventsRecord) =>
                                                  eventsRecord.orderBy(
                                                      'timeofRecording'),
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
                                              List<EventsRecord>
                                                  columnEventsRecordList =
                                                  snapshot.data!;
                                              return SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      columnEventsRecordList
                                                          .length,
                                                      (columnIndex) {
                                                    final columnEventsRecord =
                                                        columnEventsRecordList[
                                                            columnIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          12.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.25,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: 150.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondarySystemBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await launchURL(
                                                                          columnEventsRecord
                                                                              .registrationLink);
                                                                    },
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fadeInDuration:
                                                                            Duration(milliseconds: 500),
                                                                        fadeOutDuration:
                                                                            Duration(milliseconds: 500),
                                                                        imageUrl:
                                                                            columnEventsRecord.imageThumbnail,
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            100.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    columnEventsRecord
                                                                        .videoName,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).label,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          26.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        barrierColor:
                                                                            FlutterFlowTheme.of(context).opagueSeparator,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return WebViewAware(
                                                                              child: GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: Container(
                                                                                height: MediaQuery.sizeOf(context).height * 0.92,
                                                                                child: EventEditWidget(
                                                                                  chosenEvent: columnEventsRecord,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ));
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                    child:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .edit,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        dateTimeFormat(
                                                                          'M/d h:mm a',
                                                                          columnEventsRecord
                                                                              .startTime,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        'N/A',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).lightSecondaryText,
                                                                            fontSize:
                                                                                12.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'k0ne5g16' /* - */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).lightSecondaryText,
                                                                            fontSize:
                                                                                12.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        dateTimeFormat(
                                                                          'M/d h:mm a',
                                                                          columnEventsRecord
                                                                              .endTime,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        'N/A',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).lightSecondaryText,
                                                                            fontSize:
                                                                                12.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ).animateOnPageLoad(
                                                            animationsMap[
                                                                'columnOnPageLoadAnimation6']!),
                                                      ),
                                                    );
                                                  }).addToEnd(
                                                      SizedBox(height: 150.0)),
                                                ),
                                              );
                                            },
                                          ),
                                        if (!FFAppState().showFullList)
                                          Builder(
                                            builder: (context) {
                                              final searchResults = _model
                                                  .simpleSearchResults2
                                                  .toList();
                                              return SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: List.generate(
                                                      searchResults.length,
                                                      (searchResultsIndex) {
                                                    final searchResultsItem =
                                                        searchResults[
                                                            searchResultsIndex];
                                                    return Container(
                                                      width: double.infinity,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        30.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'c0qrfghj' /* Results */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'textOnPageLoadAnimation9']!),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        16.0,
                                                                        12.0,
                                                                        16.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.25,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Container(
                                                                width: 150.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondarySystemBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
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
                                                                    await launchURL(
                                                                        searchResultsItem
                                                                            .registrationLink);
                                                                  },
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      fadeInDuration:
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                      fadeOutDuration:
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                      imageUrl:
                                                                          searchResultsItem
                                                                              .imageThumbnail,
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          100.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  searchResultsItem
                                                                      .videoName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .label,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            26.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
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
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      barrierColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .opagueSeparator,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return WebViewAware(
                                                                            child:
                                                                                GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                Container(
                                                                              height: MediaQuery.sizeOf(context).height * 0.92,
                                                                              child: EventEditWidget(
                                                                                chosenEvent: searchResultsItem,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ));
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  },
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .edit,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    size: 20.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      dateTimeFormat(
                                                                        'M/d h:mm a',
                                                                        searchResultsItem
                                                                            .startTime,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      'N/A',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lightSecondaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '0293rb7e' /* - */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lightSecondaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      dateTimeFormat(
                                                                        'M/d h:mm a',
                                                                        searchResultsItem
                                                                            .endTime,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      'N/A',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lightSecondaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'columnOnPageLoadAnimation7']!),
                                                    );
                                                  }).addToEnd(
                                                      SizedBox(height: 200.0)),
                                                ),
                                              );
                                            },
                                          ),
                                      ].addToEnd(SizedBox(height: 100.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ).animateOnPageLoad(
                                animationsMap['columnOnPageLoadAnimation4']!),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 20.0, 12.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .secondarySystemBackground,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textController3,
                                                          focusNode: _model
                                                              .textFieldFocusNode2,
                                                          onFieldSubmitted:
                                                              (_) async {
                                                            await queryGuidesRecordOnce()
                                                                .then(
                                                                  (records) => _model
                                                                          .simpleSearchResults3 =
                                                                      TextSearch(
                                                                    records
                                                                        .map(
                                                                          (record) => TextSearchItem.fromTerms(
                                                                              record,
                                                                              [
                                                                                record.videoName!,
                                                                                record.messageDescription!,
                                                                                record.speaker!
                                                                              ]),
                                                                        )
                                                                        .toList(),
                                                                  )
                                                                          .search(_model
                                                                              .textController3
                                                                              .text)
                                                                          .map((r) =>
                                                                              r.object)
                                                                          .toList(),
                                                                )
                                                                .onError((_,
                                                                        __) =>
                                                                    _model.simpleSearchResults3 =
                                                                        [])
                                                                .whenComplete(() =>
                                                                    setState(
                                                                        () {}));

                                                            if (_model.textController3
                                                                        .text !=
                                                                    null &&
                                                                _model.textController3
                                                                        .text !=
                                                                    '') {
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .showFullList =
                                                                    false;
                                                              });
                                                            }
                                                          },
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'j53v2ein' /* Search... */,
                                                            ),
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .lightSecondaryText,
                                                                      fontSize:
                                                                          16.0,
                                                                    ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .lightSecondaryText,
                                                                      fontSize:
                                                                          16.0,
                                                                    ),
                                                            enabledBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            prefixIcon: Icon(
                                                              Icons.search,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .lightSecondaryText,
                                                              size: 18.0,
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lightSecondaryText,
                                                                fontSize: 16.0,
                                                              ),
                                                          validator: _model
                                                              .textController3Validator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 40.0,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    child: Visibility(
                                                      visible: !FFAppState()
                                                          .showFullList,
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .showFullList =
                                                                true;
                                                          });
                                                          setState(() {
                                                            _model
                                                                .textController3
                                                                ?.clear();
                                                            _model
                                                                .textController2
                                                                ?.clear();
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.clear_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lightSecondaryText,
                                                          size: 20.0,
                                                        ),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 30.0, 0.0, 12.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '7nbqiv6b' /* All Notes */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ).animateOnPageLoad(animationsMap[
                                        'textOnPageLoadAnimation10']!),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (FFAppState().showFullList)
                                          StreamBuilder<List<GuidesRecord>>(
                                            stream: queryGuidesRecord(
                                              queryBuilder: (guidesRecord) =>
                                                  guidesRecord.orderBy(
                                                      'time_uploaded',
                                                      descending: true),
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
                                              List<GuidesRecord>
                                                  columnGuidesRecordList =
                                                  snapshot.data!;
                                              return SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: List.generate(
                                                      columnGuidesRecordList
                                                          .length,
                                                      (columnIndex) {
                                                    final columnGuidesRecord =
                                                        columnGuidesRecordList[
                                                            columnIndex];
                                                    return Container(
                                                      width: double.infinity,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.35,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    12.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.25,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
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
                                                                    'GrowPagePDF',
                                                                    queryParameters:
                                                                        {
                                                                      'chosenResourceGuide':
                                                                          serializeParam(
                                                                        columnGuidesRecord,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'chosenResourceGuide':
                                                                          columnGuidesRecord,
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 150.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondarySystemBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            12.0),
                                                                    child:
                                                                        FlutterFlowPdfViewer(
                                                                      networkPath:
                                                                          columnGuidesRecord
                                                                              .messageNotes,
                                                                      height:
                                                                          300.0,
                                                                      horizontalScroll:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  columnGuidesRecord
                                                                      .videoName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  columnGuidesRecord
                                                                      .speaker,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lightSecondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'columnOnPageLoadAnimation9']!),
                                                    );
                                                  }).addToEnd(
                                                      SizedBox(height: 200.0)),
                                                ),
                                              );
                                            },
                                          ),
                                        if (!FFAppState().showFullList)
                                          Builder(
                                            builder: (context) {
                                              final searchResults = _model
                                                  .simpleSearchResults3
                                                  .toList();
                                              return SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      searchResults.length,
                                                      (searchResultsIndex) {
                                                    final searchResultsItem =
                                                        searchResults[
                                                            searchResultsIndex];
                                                    return Container(
                                                      width: double.infinity,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.45,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        30.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'n2y8cq8v' /* Results */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'textOnPageLoadAnimation11']!),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        30.0,
                                                                        20.0,
                                                                        10.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.9,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.25,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
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
                                                                    'GrowPagePDF',
                                                                    queryParameters:
                                                                        {
                                                                      'chosenResourceGuide':
                                                                          serializeParam(
                                                                        searchResultsItem,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'chosenResourceGuide':
                                                                          searchResultsItem,
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 150.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondarySystemBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            12.0),
                                                                    child:
                                                                        FlutterFlowPdfViewer(
                                                                      networkPath:
                                                                          searchResultsItem
                                                                              .messageNotes,
                                                                      height:
                                                                          300.0,
                                                                      horizontalScroll:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              searchResultsItem
                                                                  .videoName,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lightSecondaryText,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              searchResultsItem
                                                                  .speaker,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'columnOnPageLoadAnimation10']!),
                                                    );
                                                  }).addToEnd(
                                                      SizedBox(height: 150.0)),
                                                ),
                                              );
                                            },
                                          ),
                                      ].addToEnd(SizedBox(height: 100.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ).animateOnPageLoad(
                                animationsMap['columnOnPageLoadAnimation8']!),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation1']!),
              if (!(isWeb
                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                  : _isKeyboardVisible))
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.125,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context)
                            .secondarySystemBackground,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          HapticFeedback.lightImpact();
                                          FFAppState().update(() {
                                            FFAppState().showFullList = true;
                                          });
                                          if (Navigator.of(context).canPop()) {
                                            context.pop();
                                          }
                                          context.pushNamed(
                                            'HomePage',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.dark)
                                                SvgPicture.asset(
                                                  'assets/images/house-fill_(1).svg',
                                                  width: 28.0,
                                                  height: 28.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              if (!(Theme.of(context)
                                                      .brightness ==
                                                  Brightness.dark))
                                                SvgPicture.asset(
                                                  'assets/images/house-fill_(2).svg',
                                                  width: 28.0,
                                                  height: 28.0,
                                                  fit: BoxFit.cover,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondayGrey5,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (Theme.of(context).brightness ==
                                              Brightness.dark)
                                            SvgPicture.asset(
                                              'assets/images/leaf-fill_(3).svg',
                                              width: 28.0,
                                              height: 28.0,
                                              fit: BoxFit.cover,
                                            ),
                                          if (!(Theme.of(context).brightness ==
                                              Brightness.dark))
                                            SvgPicture.asset(
                                              'assets/images/leaf-fill_(2).svg',
                                              width: 28.0,
                                              height: 28.0,
                                              fit: BoxFit.cover,
                                            ),
                                        ],
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.chatTabIconUnselectedModel,
                                      updateCallback: () => setState(() {}),
                                      child: ChatTabIconUnselectedWidget(),
                                    ),
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          HapticFeedback.lightImpact();
                                          FFAppState().update(() {
                                            FFAppState().showFullList = true;
                                          });
                                          if (Navigator.of(context).canPop()) {
                                            context.pop();
                                          }
                                          context.pushNamed(
                                            'CommunityPrayerPage',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.dark)
                                                SvgPicture.asset(
                                                  'assets/images/hands-clapping-fill_(8).svg',
                                                  width: 28.0,
                                                  height: 28.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              if (!(Theme.of(context)
                                                      .brightness ==
                                                  Brightness.dark))
                                                SvgPicture.asset(
                                                  'assets/images/hands-clapping-fill_(7).svg',
                                                  width: 28.0,
                                                  height: 28.0,
                                                  fit: BoxFit.cover,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    wrapWithModel(
                                      model:
                                          _model.profileTabIconUnselectedModel,
                                      updateCallback: () => setState(() {}),
                                      child: ProfileTabIconUnselectedWidget(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
