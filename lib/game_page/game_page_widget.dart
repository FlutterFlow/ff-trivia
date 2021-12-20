import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/answer_component_widget.dart';
import '../components/category_selector_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class GamePageWidget extends StatefulWidget {
  const GamePageWidget({
    Key key,
    this.gameRef,
  }) : super(key: key);

  final DocumentReference gameRef;

  @override
  _GamePageWidgetState createState() => _GamePageWidgetState();
}

class _GamePageWidgetState extends State<GamePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: StreamBuilder<GamesRecord>(
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
            child: Stack(
              children: [
                if (containerGamesRecord.selectMode ?? true)
                  SingleChildScrollView(
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24, 54, 24, 24),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 15, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 5, 0),
                                            child: Text(
                                              'Code:',
                                              style: FlutterFlowTheme.title1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: Text(
                                              containerGamesRecord.code
                                                  .toString(),
                                              style: FlutterFlowTheme.title1
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: FlutterFlowTheme
                                                    .primaryColor,
                                                fontSize: 22,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Text(
                                        'Players',
                                        style: FlutterFlowTheme.title2,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 25),
                                      child: Builder(
                                        builder: (context) {
                                          final players = containerGamesRecord
                                                  .users
                                                  ?.toList() ??
                                              [];
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                players.length, (playersIndex) {
                                              final playersItem =
                                                  players[playersIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 15, 0, 0),
                                                child:
                                                    StreamBuilder<UsersRecord>(
                                                  stream:
                                                      UsersRecord.getDocument(
                                                          playersItem),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color:
                                                                FlutterFlowTheme
                                                                    .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final containerUsersRecord =
                                                        snapshot.data;
                                                    return Container(
                                                      width: double.infinity,
                                                      height: 70,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFEEEEEE),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                          color:
                                                              FlutterFlowTheme
                                                                  .customColor1,
                                                          width: 1,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(15, 0,
                                                                    15, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              containerUsersRecord
                                                                  .displayName,
                                                              style:
                                                                  FlutterFlowTheme
                                                                      .subtitle1
                                                                      .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme
                                                                    .secondaryColor,
                                                              ),
                                                            ),
                                                            if ((containerUsersRecord
                                                                    .reference) ==
                                                                (containerGamesRecord
                                                                    .selectingUser))
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            7,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .clock,
                                                                  color: FlutterFlowTheme
                                                                      .secondaryColor,
                                                                  size: 24,
                                                                ),
                                                              ),
                                                            Expanded(
                                                              child: StreamBuilder<
                                                                  List<
                                                                      GameScoresRecord>>(
                                                                stream:
                                                                    queryGameScoresRecord(
                                                                  queryBuilder: (gameScoresRecord) => gameScoresRecord
                                                                      .where(
                                                                          'user',
                                                                          isEqualTo: containerUsersRecord
                                                                              .reference)
                                                                      .where(
                                                                          'game',
                                                                          isEqualTo:
                                                                              widget.gameRef),
                                                                  singleRecord:
                                                                      true,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50,
                                                                        height:
                                                                            50,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          color:
                                                                              FlutterFlowTheme.primaryColor,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<GameScoresRecord>
                                                                      textGameScoresRecordList =
                                                                      snapshot
                                                                          .data;
                                                                  // Return an empty Container when the document does not exist.
                                                                  if (snapshot
                                                                      .data
                                                                      .isEmpty) {
                                                                    return Container();
                                                                  }
                                                                  final textGameScoresRecord = textGameScoresRecordList
                                                                          .isNotEmpty
                                                                      ? textGameScoresRecordList
                                                                          .first
                                                                      : null;
                                                                  return Text(
                                                                    textGameScoresRecord
                                                                        .score
                                                                        .toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme
                                                                        .bodyText1
                                                                        .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                    if ((currentUserReference) ==
                                        (containerGamesRecord.selectingUser))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor: Colors.white,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.5,
                                                    child:
                                                        CategorySelectorWidget(
                                                      gameRef: widget.gameRef,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          text: 'Choose Category',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 70,
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            textStyle: FlutterFlowTheme
                                                .subtitle2
                                                .override(
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
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child: Text(
                                          'Waiting for selection...',
                                          style: FlutterFlowTheme.title2,
                                        ),
                                      ),
                                    ),
                                    if (functions.isNotNullOrEmpty(
                                            containerGamesRecord
                                                .currentQuestion) ??
                                        true)
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: Text(
                                              'Last Question',
                                              style: FlutterFlowTheme.title2
                                                  .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            containerGamesRecord
                                                .currentQuestion,
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.title2
                                                .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: Text(
                                              'Last Answer',
                                              style: FlutterFlowTheme.title2
                                                  .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            containerGamesRecord.currentAnswer,
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.title2
                                                .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (containerGamesRecord.questionMode ?? true)
                  Column(
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
                          height: MediaQuery.of(context).size.height * 1,
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 54, 24, 24),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 5, 0),
                                        child: Text(
                                          containerGamesRecord
                                              .currentCategoryName,
                                          style: FlutterFlowTheme.title1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 8, 0),
                                        child: Text(
                                          containerGamesRecord.currentValue
                                              .toString(),
                                          style:
                                              FlutterFlowTheme.title1.override(
                                            fontFamily: 'Poppins',
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Text(
                                    'Question',
                                    style: FlutterFlowTheme.subtitle2,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: Text(
                                      containerGamesRecord.currentQuestion,
                                      style: FlutterFlowTheme.title2.override(
                                        fontFamily: 'Poppins',
                                        fontSize: 26,
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 15, 0, 34),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        final gamesUpdateData = {
                                          ...createGamesRecordData(
                                            questionMode: false,
                                            selectMode: true,
                                            scoreMode: false,
                                          ),
                                          'current_category':
                                              FieldValue.delete(),
                                          'current_value': FieldValue.delete(),
                                          'current_category_name':
                                              FieldValue.delete(),
                                        };
                                        await widget.gameRef
                                            .update(gamesUpdateData);
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.white,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.5,
                                                child: AnswerComponentWidget(
                                                  answer: containerGamesRecord
                                                      .currentAnswer,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      text: 'Give Up',
                                      options: FFButtonOptions(
                                        width: 200,
                                        height: 70,
                                        color: FlutterFlowTheme.customColor2,
                                        textStyle:
                                            FlutterFlowTheme.subtitle2.override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.customColor4,
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
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 70),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      final gamesUpdateData =
                                          createGamesRecordData(
                                        questionMode: false,
                                        scoreMode: true,
                                        answeringUser: currentUserReference,
                                      );
                                      await widget.gameRef
                                          .update(gamesUpdateData);
                                    },
                                    text: 'BUZZ!',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 70,
                                      color: FlutterFlowTheme.customColor3,
                                      textStyle:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 27,
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
                if (containerGamesRecord.scoreMode ?? true)
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: StreamBuilder<List<GameScoresRecord>>(
                      stream: queryGameScoresRecord(
                        queryBuilder: (gameScoresRecord) => gameScoresRecord
                            .where('game', isEqualTo: widget.gameRef)
                            .where('user',
                                isEqualTo: containerGamesRecord.answeringUser),
                        singleRecord: true,
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
                        List<GameScoresRecord> scoreModeGameScoresRecordList =
                            snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
                          return Container();
                        }
                        final scoreModeGameScoresRecord =
                            scoreModeGameScoresRecordList.isNotEmpty
                                ? scoreModeGameScoresRecordList.first
                                : null;
                        return Column(
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 54, 24, 24),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 5, 0),
                                              child: Text(
                                                'Currently Answering',
                                                style: FlutterFlowTheme.title1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 8, 0),
                                              child: StreamBuilder<UsersRecord>(
                                                stream: UsersRecord.getDocument(
                                                    containerGamesRecord
                                                        .answeringUser),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color:
                                                              FlutterFlowTheme
                                                                  .primaryColor,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final textUsersRecord =
                                                      snapshot.data;
                                                  return Text(
                                                    textUsersRecord.displayName,
                                                    style: FlutterFlowTheme
                                                        .title1
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      color: FlutterFlowTheme
                                                          .primaryColor,
                                                      fontSize: 22,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if ((currentUserReference) !=
                                          (containerGamesRecord.answeringUser))
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 35, 0, 35),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor: Colors.white,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child: Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.5,
                                                        child:
                                                            AnswerComponentWidget(
                                                          answer:
                                                              containerGamesRecord
                                                                  .currentAnswer,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              text: 'Show Answer',
                                              options: FFButtonOptions(
                                                width: 210,
                                                height: 50,
                                                color: FlutterFlowTheme
                                                    .customColor2,
                                                textStyle: FlutterFlowTheme
                                                    .subtitle1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme
                                                      .customColor4,
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
                                        ),
                                      if ((currentUserReference) !=
                                          (containerGamesRecord.answeringUser))
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: Text(
                                                  'Did the player answer correctly?',
                                                  style: FlutterFlowTheme.title2
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 19,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 15, 0, 0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      final gamesUpdateData = {
                                                        ...createGamesRecordData(
                                                          selectMode: true,
                                                          scoreMode: false,
                                                        ),
                                                        'answering_user':
                                                            FieldValue.delete(),
                                                      };
                                                      await widget.gameRef
                                                          .update(
                                                              gamesUpdateData);

                                                      final gameScoresUpdateData =
                                                          createGameScoresRecordData(
                                                        score: functions
                                                            .calculateNewScore(
                                                                scoreModeGameScoresRecord
                                                                    .score,
                                                                containerGamesRecord
                                                                    .currentValue,
                                                                false),
                                                      );
                                                      await scoreModeGameScoresRecord
                                                          .reference
                                                          .update(
                                                              gameScoresUpdateData);
                                                    },
                                                    text: 'No',
                                                    options: FFButtonOptions(
                                                      width: 150,
                                                      height: 70,
                                                      color: FlutterFlowTheme
                                                          .customColor3,
                                                      textStyle:
                                                          FlutterFlowTheme
                                                              .subtitle2
                                                              .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      elevation: 4,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius: 16,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 15, 0, 0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      final gamesUpdateData = {
                                                        ...createGamesRecordData(
                                                          selectMode: true,
                                                          scoreMode: false,
                                                          selectingUser:
                                                              containerGamesRecord
                                                                  .answeringUser,
                                                        ),
                                                        'answering_user':
                                                            FieldValue.delete(),
                                                      };
                                                      await widget.gameRef
                                                          .update(
                                                              gamesUpdateData);

                                                      final gameScoresUpdateData =
                                                          createGameScoresRecordData(
                                                        score: functions
                                                            .calculateNewScore(
                                                                scoreModeGameScoresRecord
                                                                    .score,
                                                                containerGamesRecord
                                                                    .currentValue,
                                                                true),
                                                      );
                                                      await scoreModeGameScoresRecord
                                                          .reference
                                                          .update(
                                                              gameScoresUpdateData);
                                                    },
                                                    text: 'Yes',
                                                    options: FFButtonOptions(
                                                      width: 150,
                                                      height: 70,
                                                      color: FlutterFlowTheme
                                                          .primaryColor,
                                                      textStyle:
                                                          FlutterFlowTheme
                                                              .subtitle2
                                                              .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      elevation: 4,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      if ((currentUserReference) ==
                                          (containerGamesRecord.answeringUser))
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: Text(
                                              'Tell other players your answer',
                                              style: FlutterFlowTheme.title2
                                                  .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 19,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
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
