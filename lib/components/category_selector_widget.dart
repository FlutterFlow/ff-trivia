import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/value_selector_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategorySelectorWidget extends StatefulWidget {
  const CategorySelectorWidget({
    Key key,
    this.gameRef,
  }) : super(key: key);

  final DocumentReference gameRef;

  @override
  _CategorySelectorWidgetState createState() => _CategorySelectorWidgetState();
}

class _CategorySelectorWidgetState extends State<CategorySelectorWidget> {
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
        final listViewGamesRecord = snapshot.data;
        return Builder(
          builder: (context) {
            final categories = listViewGamesRecord.categories?.toList() ?? [];
            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: categories.length,
              itemBuilder: (context, categoriesIndex) {
                final categoriesItem = categories[categoriesIndex];
                return FutureBuilder<ApiCallResponse>(
                  future: categoryCall(
                    id: categoriesItem,
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
                    final listTileCategoryResponse = snapshot.data;
                    return InkWell(
                      onTap: () async {
                        final gamesUpdateData = createGamesRecordData(
                          currentCategory: categoriesItem,
                          currentCategoryName: getJsonField(
                                  listTileCategoryResponse.jsonBody,
                                  r'''$.title''')
                              .toString(),
                        );
                        await widget.gameRef.update(gamesUpdateData);
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                child: ValueSelectorWidget(
                                  gameRef: widget.gameRef,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: ListTile(
                        title: Text(
                          getJsonField(listTileCategoryResponse.jsonBody,
                                  r'''$.title''')
                              .toString(),
                          style: FlutterFlowTheme.title3,
                        ),
                        tileColor: Color(0xFFF5F5F5),
                        dense: false,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(15, 8, 15, 8),
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
