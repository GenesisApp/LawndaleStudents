import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_tab_icon_model.dart';
export 'profile_tab_icon_model.dart';

class ProfileTabIconWidget extends StatefulWidget {
  const ProfileTabIconWidget({Key? key}) : super(key: key);

  @override
  _ProfileTabIconWidgetState createState() => _ProfileTabIconWidgetState();
}

class _ProfileTabIconWidgetState extends State<ProfileTabIconWidget> {
  late ProfileTabIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileTabIconModel());
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
        color: FlutterFlowTheme.of(context).secondayGrey5,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (Theme.of(context).brightness == Brightness.dark)
            SvgPicture.asset(
              'assets/images/user-fill_(2).svg',
              width: 28.0,
              height: 28.0,
              fit: BoxFit.cover,
            ),
          if (!(Theme.of(context).brightness == Brightness.dark))
            SvgPicture.asset(
              'assets/images/user-fill_(1).svg',
              width: 28.0,
              height: 28.0,
              fit: BoxFit.cover,
            ),
        ],
      ),
    );
  }
}
