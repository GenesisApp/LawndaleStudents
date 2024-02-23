import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'p_d_f_message_notes_copy_model.dart';
export 'p_d_f_message_notes_copy_model.dart';

class PDFMessageNotesCopyWidget extends StatefulWidget {
  const PDFMessageNotesCopyWidget({
    super.key,
    this.pdfImageSelected,
    this.pdfImageSelectedRef,
  });

  final DailyPracticeVideosRecord? pdfImageSelected;
  final DocumentReference? pdfImageSelectedRef;

  @override
  State<PDFMessageNotesCopyWidget> createState() =>
      _PDFMessageNotesCopyWidgetState();
}

class _PDFMessageNotesCopyWidgetState extends State<PDFMessageNotesCopyWidget> {
  late PDFMessageNotesCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PDFMessageNotesCopyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        FlutterFlowPdfViewer(
          networkPath: widget.pdfImageSelected!.pdfResource,
          width: double.infinity,
          height: double.infinity,
          horizontalScroll: false,
        ),
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).systemBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.06,
                decoration: BoxDecoration(),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 10.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 30.0,
                        ),
                      ),
                    ),
                    SelectionArea(
                        child: Text(
                      FFLocalizations.of(context).getText(
                        'u79fzl54' /* Message Notes */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).label,
                            fontSize: 16.0,
                          ),
                    )),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.16,
                      height: 20.0,
                      decoration: BoxDecoration(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
