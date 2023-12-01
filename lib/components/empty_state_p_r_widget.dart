import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_state_p_r_model.dart';
export 'empty_state_p_r_model.dart';

class EmptyStatePRWidget extends StatefulWidget {
  const EmptyStatePRWidget({Key? key}) : super(key: key);

  @override
  _EmptyStatePRWidgetState createState() => _EmptyStatePRWidgetState();
}

class _EmptyStatePRWidgetState extends State<EmptyStatePRWidget> {
  late EmptyStatePRModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyStatePRModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            FFLocalizations.of(context).getText(
              'k62lu55r' /* You don't have any prayer requ... */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).tertiary,
                ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'u0vv2ptw' /* Click the button in the top ri... */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).lightSecondaryText,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
