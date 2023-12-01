import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_tab_icon_model.dart';
export 'chat_tab_icon_model.dart';

class ChatTabIconWidget extends StatefulWidget {
  const ChatTabIconWidget({Key? key}) : super(key: key);

  @override
  _ChatTabIconWidgetState createState() => _ChatTabIconWidgetState();
}

class _ChatTabIconWidgetState extends State<ChatTabIconWidget> {
  late ChatTabIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatTabIconModel());
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
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondayGrey5,
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (Theme.of(context).brightness == Brightness.dark)
                  SvgPicture.asset(
                    'assets/images/chat-circle-dots-fill.svg',
                    width: 28.0,
                    height: 28.0,
                    fit: BoxFit.cover,
                  ),
                if (!(Theme.of(context).brightness == Brightness.dark))
                  SvgPicture.asset(
                    'assets/images/chat-circle-dots-fill_(1).svg',
                    width: 28.0,
                    height: 28.0,
                    fit: BoxFit.cover,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
