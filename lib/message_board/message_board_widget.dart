import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/notification_text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'message_board_model.dart';
export 'message_board_model.dart';

class MessageBoardWidget extends StatefulWidget {
  const MessageBoardWidget({super.key});

  @override
  State<MessageBoardWidget> createState() => _MessageBoardWidgetState();
}

class _MessageBoardWidgetState extends State<MessageBoardWidget> {
  late MessageBoardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageBoardModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primary,
      body: SingleChildScrollView(
        primary: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.05,
              decoration: BoxDecoration(),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.05,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: FlutterFlowTheme.of(context).secondary,
                        size: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 22.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'ghrjgafu' /* Hello, */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).label,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Text(
                        currentUserDisplayName,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).label,
                                ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 10.0,
                      decoration: BoxDecoration(),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                      child: Icon(
                        Icons.notifications_active_rounded,
                        color: FlutterFlowTheme.of(context).worshipRing,
                        size: 28.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 0.0, 8.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'l8gfcnfh' /* Here's the latest notification... */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).systemGray,
                    ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 50.0),
                    child: StreamBuilder<List<NotificationsRecord>>(
                      stream: queryNotificationsRecord(
                        queryBuilder: (notificationsRecord) =>
                            notificationsRecord.orderBy('createdTime',
                                descending: true),
                        limit: 30,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 75.0,
                              height: 75.0,
                              child: SpinKitRipple(
                                color: Color(0xFF7F95AD),
                                size: 75.0,
                              ),
                            ),
                          );
                        }
                        List<NotificationsRecord>
                            columnNotificationsRecordList = snapshot.data!;
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                columnNotificationsRecordList.length,
                                (columnIndex) {
                              final columnNotificationsRecord =
                                  columnNotificationsRecordList[columnIndex];
                              return NotificationTextFieldWidget(
                                key: Key(
                                    'Keychn_${columnIndex}_of_${columnNotificationsRecordList.length}'),
                                parameter1:
                                    columnNotificationsRecord.notificationText,
                                parameter2: columnNotificationsRecord.tagName,
                                parameter3: dateTimeFormat(
                                  'MMMEd',
                                  columnNotificationsRecord.createdTime!,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                parameter4: columnNotificationsRecord.tagRef!,
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
