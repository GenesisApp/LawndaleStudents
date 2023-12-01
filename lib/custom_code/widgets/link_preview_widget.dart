// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_link_previewer/flutter_link_previewer.dart' as preview;
import 'package:flutter_chat_types/flutter_chat_types.dart' show PreviewData;
import 'package:url_launcher/url_launcher.dart';

class LinkPreviewWidget extends StatefulWidget {
  const LinkPreviewWidget({
    Key? key,
    this.width,
    this.height,
    required this.link,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String link;

  @override
  _LinkPreviewWidgetState createState() => _LinkPreviewWidgetState();
}

class _LinkPreviewWidgetState extends State<LinkPreviewWidget> {
  Map<String, PreviewData> datas = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context)
                  .secondarySystemBackground, // Change this to your desired background color
            ),
            width: widget.width,
            height: widget.height,
            constraints: BoxConstraints(
              minHeight: 200, // Minimum height
              maxHeight: 350, // Maximum height
              minWidth: 200, // Minimum width
              maxWidth: 250, // Maximum width
            ),
            child: GestureDetector(
              onTap: () {
                // Open the full link when the container is tapped
                _launchURL(widget.link);
              },
              child: preview.LinkPreview(
                enableAnimation: true,
                onPreviewDataFetched: (data) {
                  setState(() {
                    // Save preview data to the state
                    datas = {
                      ...datas,
                      widget.link: data,
                    };
                  });
                },
                previewData:
                    datas[widget.link], // Pass the preview data from the state
                text: widget.link,
                width: double.infinity,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Function to open the full link
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
