import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_tab_unselected_dashboard_model.dart';
export 'chat_tab_unselected_dashboard_model.dart';

class ChatTabUnselectedDashboardWidget extends StatefulWidget {
  const ChatTabUnselectedDashboardWidget({super.key});

  @override
  State<ChatTabUnselectedDashboardWidget> createState() =>
      _ChatTabUnselectedDashboardWidgetState();
}

class _ChatTabUnselectedDashboardWidgetState
    extends State<ChatTabUnselectedDashboardWidget> {
  late ChatTabUnselectedDashboardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatTabUnselectedDashboardModel());
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
      width: 50.0,
      child: Stack(
        alignment: AlignmentDirectional(0.0, 0.0),
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                HapticFeedback.lightImpact();
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamed(
                  'AllChats',
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
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (Theme.of(context).brightness == Brightness.dark)
                        SvgPicture.asset(
                          'assets/images/chat-circle-dots-fill_(dark_mode).svg',
                          width: 22.0,
                          height: 22.0,
                          fit: BoxFit.cover,
                        ),
                      if (!(Theme.of(context).brightness == Brightness.dark))
                        SvgPicture.asset(
                          'assets/images/chat-circle-dots-fill_(light_mode).svg',
                          width: 22.0,
                          height: 22.0,
                          fit: BoxFit.cover,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
