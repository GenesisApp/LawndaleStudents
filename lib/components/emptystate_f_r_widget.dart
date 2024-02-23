import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'emptystate_f_r_model.dart';
export 'emptystate_f_r_model.dart';

class EmptystateFRWidget extends StatefulWidget {
  const EmptystateFRWidget({super.key});

  @override
  State<EmptystateFRWidget> createState() => _EmptystateFRWidgetState();
}

class _EmptystateFRWidgetState extends State<EmptystateFRWidget> {
  late EmptystateFRModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptystateFRModel());
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
      children: [
        Text(
          FFLocalizations.of(context).getText(
            'xvpfsiu9' /* That's all! You don't have any... */,
          ),
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                color: FlutterFlowTheme.of(context).tertiary,
              ),
        ),
      ],
    );
  }
}
