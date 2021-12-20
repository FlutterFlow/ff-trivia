import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../game_page/game_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ValueSelectorWidget extends StatefulWidget {
  const ValueSelectorWidget({
    Key key,
    this.gameRef,
  }) : super(key: key);

  final DocumentReference gameRef;

  @override
  _ValueSelectorWidgetState createState() => _ValueSelectorWidgetState();
}

class _ValueSelectorWidgetState extends State<ValueSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GamesRecord>(
      stream: GamesRecord.getDocument(widget.gameRef),
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
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: FutureBuilder<ApiCallResponse>(
            future: allQuestionsCall(
              category: containerGamesRecord.currentCategory,
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
              final listViewAllQuestionsResponse = snapshot.data;
              return Builder(
                builder: (context) {
                  final questions = getJsonField(
                              listViewAllQuestionsResponse.jsonBody, r'''$''')
                          ?.toList() ??
                      [];
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: questions.length,
                    itemBuilder: (context, questionsIndex) {
                      final questionsItem = questions[questionsIndex];
                      return Stack(
                        children: [
                          if (containerGamesRecord.answeredQuestions.contains(
                                  getJsonField(questionsItem, r'''$.id''')) ??
                              true)
                            Align(
                              alignment: AlignmentDirectional(-0.15, -0.22),
                              child: Container(
                                width: double.infinity,
                                height: 62,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.customColor3,
                                ),
                              ),
                            ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: InkWell(
                              onTap: () async {
                                final gamesUpdateData = {
                                  ...createGamesRecordData(
                                    questionMode: true,
                                    currentValue: getJsonField(
                                        questionsItem, r'''$.value'''),
                                    currentQuestion: getJsonField(
                                            questionsItem, r'''$.question''')
                                        .toString(),
                                    currentAnswer: getJsonField(
                                            questionsItem, r'''$.answer''')
                                        .toString(),
                                    selectMode: false,
                                  ),
                                  'answered_questions': FieldValue.arrayUnion([
                                    getJsonField(questionsItem, r'''$.id''')
                                  ]),
                                };
                                await widget.gameRef.update(gamesUpdateData);
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                    reverseDuration: Duration(milliseconds: 0),
                                    child: GamePageWidget(
                                      gameRef: widget.gameRef,
                                    ),
                                  ),
                                  (r) => false,
                                );
                              },
                              child: ListTile(
                                title: Text(
                                  getJsonField(questionsItem, r'''$.value''')
                                      .toString(),
                                  style: FlutterFlowTheme.title3,
                                ),
                                tileColor: Color(0xFFF5F5F5),
                                dense: false,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    15, 8, 15, 8),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
