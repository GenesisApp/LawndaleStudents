import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_state_approval_model.dart';
export 'empty_state_approval_model.dart';

class EmptyStateApprovalWidget extends StatefulWidget {
  const EmptyStateApprovalWidget({super.key});

  @override
  State<EmptyStateApprovalWidget> createState() =>
      _EmptyStateApprovalWidgetState();
}

class _EmptyStateApprovalWidgetState extends State<EmptyStateApprovalWidget> {
  late EmptyStateApprovalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyStateApprovalModel());
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
            '9l0sb2er' /* That's all! You don't have any... */,
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
