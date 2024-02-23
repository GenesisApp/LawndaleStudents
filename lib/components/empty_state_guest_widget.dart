import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_state_guest_model.dart';
export 'empty_state_guest_model.dart';

class EmptyStateGuestWidget extends StatefulWidget {
  const EmptyStateGuestWidget({super.key});

  @override
  State<EmptyStateGuestWidget> createState() => _EmptyStateGuestWidgetState();
}

class _EmptyStateGuestWidgetState extends State<EmptyStateGuestWidget> {
  late EmptyStateGuestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyStateGuestModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            FFLocalizations.of(context).getText(
              'ju3va5e5' /* No Guests Yet! */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).tertiary,
                ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(50.0, 8.0, 50.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'd1pgo7yt' /* Create a guest through the "Ad... */,
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
