import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_state_tags_model.dart';
export 'empty_state_tags_model.dart';

class EmptyStateTagsWidget extends StatefulWidget {
  const EmptyStateTagsWidget({Key? key}) : super(key: key);

  @override
  _EmptyStateTagsWidgetState createState() => _EmptyStateTagsWidgetState();
}

class _EmptyStateTagsWidgetState extends State<EmptyStateTagsWidget> {
  late EmptyStateTagsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyStateTagsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          FFLocalizations.of(context).getText(
            'mhfe0x1o' /* No Tags Yet! */,
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
              'ass1zxjf' /* Create a tag through the "Prof... */,
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).lightSecondaryText,
                ),
          ),
        ),
      ],
    );
  }
}
