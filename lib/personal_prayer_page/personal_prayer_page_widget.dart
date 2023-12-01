import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/chat_tab_icon_unselected_widget.dart';
import '/components/create_prayer_widget.dart';
import '/components/empty_state_p_r_widget.dart';
import '/components/personal_prayer_request_widget.dart';
import '/components/profile_tab_icon_unselected_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'personal_prayer_page_model.dart';
export 'personal_prayer_page_model.dart';

class PersonalPrayerPageWidget extends StatefulWidget {
  const PersonalPrayerPageWidget({Key? key}) : super(key: key);

  @override
  _PersonalPrayerPageWidgetState createState() =>
      _PersonalPrayerPageWidgetState();
}

class _PersonalPrayerPageWidgetState extends State<PersonalPrayerPageWidget>
    with TickerProviderStateMixin {
  late PersonalPrayerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'listViewOnPageLoadAnimation': AnimationInfo(
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
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PersonalPrayerPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation();
    });
  }

  @override
  void dispose() {
    _model.dispose();

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primary,
      body: Align(
        alignment: AlignmentDirectional(0.00, 0.00),
        child: Stack(
          alignment: AlignmentDirectional(0.0, 0.0),
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.06,
                    decoration: BoxDecoration(),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'i1hilp86' /* Prayer Requests */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).label,
                                useGoogleFonts: false,
                              ),
                        ),
                        Container(
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
                              HapticFeedback.lightImpact();
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
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.75,
                                      child: CreatePrayerWidget(),
                                    ),
                                  ));
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (Theme.of(context).brightness ==
                                      Brightness.dark)
                                    SvgPicture.asset(
                                      'assets/images/note-pencil-fill.svg',
                                      width: 28.0,
                                      height: 28.0,
                                      fit: BoxFit.cover,
                                    ),
                                  if (!(Theme.of(context).brightness ==
                                      Brightness.dark))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 6.0, 6.0, 6.0),
                                      child: SvgPicture.asset(
                                        'assets/images/note-pencil-fill_(1).svg',
                                        width: 28.0,
                                        height: 28.0,
                                        fit: BoxFit.cover,
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
                        EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: 35.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (Navigator.of(context).canPop()) {
                                context.pop();
                              }
                              context.pushNamed(
                                'CommunityPrayerPage',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondarySystemBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'on28ffl7' /* Community */,
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
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 1.0,
                          height: 38.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).systemGray,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: 35.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0x1C000000),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryGrey12,
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'pgkk3279' /* Personal */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: PagedListView<DocumentSnapshot<Object?>?,
                          PrayerRequestsRecord>(
                        pagingController: _model.setListViewController(
                          PrayerRequestsRecord.collection
                              .where(
                                'user',
                                isEqualTo: currentUserReference,
                              )
                              .orderBy('timeUploaded', descending: true),
                        ),
                        padding: EdgeInsets.zero,
                        reverse: false,
                        scrollDirection: Axis.vertical,
                        builderDelegate:
                            PagedChildBuilderDelegate<PrayerRequestsRecord>(
                          // Customize what your widget looks like when it's loading the first page.
                          firstPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 75.0,
                              height: 75.0,
                              child: SpinKitRipple(
                                color: Color(0xFF7F95AD),
                                size: 75.0,
                              ),
                            ),
                          ),
                          // Customize what your widget looks like when it's loading another page.
                          newPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 75.0,
                              height: 75.0,
                              child: SpinKitRipple(
                                color: Color(0xFF7F95AD),
                                size: 75.0,
                              ),
                            ),
                          ),
                          noItemsFoundIndicatorBuilder: (_) => Center(
                            child: EmptyStatePRWidget(),
                          ),
                          itemBuilder: (context, _, listViewIndex) {
                            final listViewPrayerRequestsRecord = _model
                                .listViewPagingController!
                                .itemList![listViewIndex];
                            return PersonalPrayerRequestWidget(
                              key: Key(
                                  'Key5qk_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                              chosenPrayerRequestDoc:
                                  listViewPrayerRequestsRecord,
                              chosenPrayerRequestRef:
                                  listViewPrayerRequestsRecord.reference,
                            );
                          },
                        ),
                      ).animateOnPageLoad(
                          animationsMap['listViewOnPageLoadAnimation']!),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.12,
                    decoration: BoxDecoration(),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.00, 1.00),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.125,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        FlutterFlowTheme.of(context).secondarySystemBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 40.0,
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
                                      FFAppState().update(() {
                                        FFAppState().showFullList = true;
                                      });
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed(
                                        'HomePage',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
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
                                          if (Theme.of(context).brightness ==
                                              Brightness.dark)
                                            SvgPicture.asset(
                                              'assets/images/house-fill_(1).svg',
                                              width: 28.0,
                                              height: 28.0,
                                              fit: BoxFit.cover,
                                            ),
                                          if (!(Theme.of(context).brightness ==
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
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    HapticFeedback.lightImpact();
                                    FFAppState().update(() {
                                      FFAppState().showFullList = true;
                                    });

                                    context.pushNamed(
                                      'GrowPage',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (Theme.of(context).brightness ==
                                            Brightness.dark)
                                          SvgPicture.asset(
                                            'assets/images/leaf-fill_(4).svg',
                                            width: 28.0,
                                            height: 28.0,
                                            fit: BoxFit.cover,
                                          ),
                                        if (!(Theme.of(context).brightness ==
                                            Brightness.dark))
                                          SvgPicture.asset(
                                            'assets/images/leaf-fill_(5).svg',
                                            width: 28.0,
                                            height: 28.0,
                                            fit: BoxFit.cover,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.chatTabIconUnselectedModel,
                                  updateCallback: () => setState(() {}),
                                  child: ChatTabIconUnselectedWidget(),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().update(() {
                                        FFAppState().showFullList = true;
                                      });
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed(
                                        'CommunityPrayerPage',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiarySystemBackground,
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
                                              'assets/images/handsclapping(dark_mode).svg',
                                              width: 28.0,
                                              height: 28.0,
                                              fit: BoxFit.cover,
                                            ),
                                          if (!(Theme.of(context).brightness ==
                                              Brightness.dark))
                                            SvgPicture.asset(
                                              'assets/images/handsclapping(light_mode).svg',
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
                                  model: _model.profileTabIconUnselectedModel,
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
    );
  }
}
