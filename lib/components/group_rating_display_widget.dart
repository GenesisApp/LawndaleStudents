import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'group_rating_display_model.dart';
export 'group_rating_display_model.dart';

class GroupRatingDisplayWidget extends StatefulWidget {
  const GroupRatingDisplayWidget({
    Key? key,
    this.parameter1,
    this.parameter2,
  }) : super(key: key);

  final int? parameter1;
  final String? parameter2;

  @override
  _GroupRatingDisplayWidgetState createState() =>
      _GroupRatingDisplayWidgetState();
}

class _GroupRatingDisplayWidgetState extends State<GroupRatingDisplayWidget> {
  late GroupRatingDisplayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GroupRatingDisplayModel());

    _model.textController ??= TextEditingController(text: widget.parameter2);
    _model.textFieldFocusNode ??= FocusNode();
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
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondarySystemBackground,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: RatingBarIndicator(
                itemBuilder: (context, index) => Icon(
                  Icons.star_rounded,
                  color: FlutterFlowTheme.of(context).tertiary,
                ),
                direction: Axis.horizontal,
                rating: widget.parameter1!.toDouble(),
                unratedColor: FlutterFlowTheme.of(context).systemGray2,
                itemCount: 5,
                itemSize: 30.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Container(
                width: double.infinity,
                child: TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  textCapitalization: TextCapitalization.sentences,
                  readOnly: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: FFLocalizations.of(context).getText(
                      '7efq4gtu' /* Specific Feedback */,
                    ),
                    labelStyle:
                        FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).secondary,
                            ),
                    hintText: FFLocalizations.of(context).getText(
                      'tmsfuf2v' /* type here... */,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).prayerRing,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).prayerRing,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    filled: true,
                    fillColor:
                        FlutterFlowTheme.of(context).tertiarySystemBackground,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                  maxLines: 4,
                  minLines: 4,
                  keyboardType: TextInputType.multiline,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
