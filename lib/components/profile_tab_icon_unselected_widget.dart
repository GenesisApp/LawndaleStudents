import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_tab_icon_unselected_model.dart';
export 'profile_tab_icon_unselected_model.dart';

class ProfileTabIconUnselectedWidget extends StatefulWidget {
  const ProfileTabIconUnselectedWidget({super.key});

  @override
  State<ProfileTabIconUnselectedWidget> createState() =>
      _ProfileTabIconUnselectedWidgetState();
}

class _ProfileTabIconUnselectedWidgetState
    extends State<ProfileTabIconUnselectedWidget> {
  late ProfileTabIconUnselectedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileTabIconUnselectedModel());
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
          if (Navigator.of(context).canPop()) {
            context.pop();
          }
          context.pushNamed(
            'ProfilePage',
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
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (Theme.of(context).brightness == Brightness.dark)
                SvgPicture.asset(
                  'assets/images/user-fill_(dark_mode).svg',
                  width: 28.0,
                  height: 28.0,
                  fit: BoxFit.cover,
                ),
              if (!(Theme.of(context).brightness == Brightness.dark))
                SvgPicture.asset(
                  'assets/images/user-fill_(light_mode).svg',
                  width: 28.0,
                  height: 28.0,
                  fit: BoxFit.cover,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
