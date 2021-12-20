import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../create_game_step2/create_game_step2_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateGameStep1Widget extends StatefulWidget {
  const CreateGameStep1Widget({
    Key key,
    this.gameRecord,
    this.categoryOffset,
  }) : super(key: key);

  final GamesRecord gameRecord;
  final int categoryOffset;

  @override
  _CreateGameStep1WidgetState createState() => _CreateGameStep1WidgetState();
}

class _CreateGameStep1WidgetState extends State<CreateGameStep1Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: StreamBuilder<GamesRecord>(
        stream: GamesRecord.getDocument(widget.gameRecord.reference),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.primaryColor,
                ),
              ),
            );
          }
          final containerGamesRecord = snapshot.data;
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/page_background@2x.png',
                ).image,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Material(
                  color: Colors.transparent,
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.customColor5,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 54, 24, 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: Text(
                              'New Game',
                              style: FlutterFlowTheme.title1,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 5, 0),
                                  child: Text(
                                    'Code:',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 8, 0),
                                  child: Text(
                                    widget.gameRecord.code.toString(),
                                    style: FlutterFlowTheme.title1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.primaryColor,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Invite your friends',
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              'Select Categories',
                              style: FlutterFlowTheme.bodyText1,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                            child: FutureBuilder<ApiCallResponse>(
                              future: getCategoriesCall(
                                offset: widget.categoryOffset,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                final columnGetCategoriesResponse =
                                    snapshot.data;
                                return Builder(
                                  builder: (context) {
                                    final categories = getJsonField(
                                                columnGetCategoriesResponse
                                                    .jsonBody,
                                                r'''$''')
                                            ?.toList() ??
                                        [];
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(categories.length,
                                          (categoriesIndex) {
                                        final categoriesItem =
                                            categories[categoriesIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 15, 0, 0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEEEE),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color: FlutterFlowTheme
                                                    .customColor1,
                                                width: 1,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 15, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      getJsonField(
                                                              categoriesItem,
                                                              r'''$.title''')
                                                          .toString(),
                                                      style: FlutterFlowTheme
                                                          .subtitle1
                                                          .override(
                                                        fontFamily: 'Poppins',
                                                        color: FlutterFlowTheme
                                                            .secondaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (!(containerGamesRecord
                                                              .categories
                                                              .contains(getJsonField(
                                                                  categoriesItem,
                                                                  r'''$.id'''))) ??
                                                          true)
                                                        InkWell(
                                                          onTap: () async {
                                                            final gamesUpdateData =
                                                                {
                                                              'categories':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                getJsonField(
                                                                    categoriesItem,
                                                                    r'''$.id''')
                                                              ]),
                                                            };
                                                            await widget
                                                                .gameRecord
                                                                .reference
                                                                .update(
                                                                    gamesUpdateData);
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .radio_button_off,
                                                            color: FlutterFlowTheme
                                                                .secondaryColor,
                                                            size: 24,
                                                          ),
                                                        ),
                                                      if (containerGamesRecord
                                                              .categories
                                                              .contains(getJsonField(
                                                                  categoriesItem,
                                                                  r'''$.id''')) ??
                                                          true)
                                                        InkWell(
                                                          onTap: () async {
                                                            final gamesUpdateData =
                                                                {
                                                              'categories':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                getJsonField(
                                                                    categoriesItem,
                                                                    r'''$.id''')
                                                              ]),
                                                            };
                                                            await widget
                                                                .gameRecord
                                                                .reference
                                                                .update(
                                                                    gamesUpdateData);
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .radio_button_checked,
                                                            color: FlutterFlowTheme
                                                                .secondaryColor,
                                                            size: 24,
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                    reverseDuration: Duration(milliseconds: 0),
                                    child: CreateGameStep1Widget(
                                      gameRecord: widget.gameRecord,
                                      categoryOffset:
                                          functions.generateRandomOffset(),
                                    ),
                                  ),
                                );
                              },
                              text: 'More Categories',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 70,
                                color: FlutterFlowTheme.primaryColor,
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                                elevation: 4,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CreateGameStep2Widget(
                                      gameRecord: containerGamesRecord,
                                    ),
                                  ),
                                );
                              },
                              text: 'Next Step',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 70,
                                color: FlutterFlowTheme.customColor4,
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                                elevation: 4,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
