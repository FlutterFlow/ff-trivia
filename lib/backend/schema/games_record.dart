import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'games_record.g.dart';

abstract class GamesRecord implements Built<GamesRecord, GamesRecordBuilder> {
  static Serializer<GamesRecord> get serializer => _$gamesRecordSerializer;

  @nullable
  int get code;

  @nullable
  BuiltList<int> get categories;

  @nullable
  BuiltList<DocumentReference> get users;

  @nullable
  @BuiltValueField(wireName: 'select_mode')
  bool get selectMode;

  @nullable
  @BuiltValueField(wireName: 'question_mode')
  bool get questionMode;

  @nullable
  @BuiltValueField(wireName: 'score_mode')
  bool get scoreMode;

  @nullable
  @BuiltValueField(wireName: 'current_category')
  int get currentCategory;

  @nullable
  @BuiltValueField(wireName: 'current_value')
  int get currentValue;

  @nullable
  @BuiltValueField(wireName: 'selecting_user')
  DocumentReference get selectingUser;

  @nullable
  @BuiltValueField(wireName: 'answering_user')
  DocumentReference get answeringUser;

  @nullable
  @BuiltValueField(wireName: 'current_category_name')
  String get currentCategoryName;

  @nullable
  @BuiltValueField(wireName: 'current_question')
  String get currentQuestion;

  @nullable
  @BuiltValueField(wireName: 'current_answer')
  String get currentAnswer;

  @nullable
  @BuiltValueField(wireName: 'answered_questions')
  BuiltList<int> get answeredQuestions;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(GamesRecordBuilder builder) => builder
    ..code = 0
    ..categories = ListBuilder()
    ..users = ListBuilder()
    ..selectMode = false
    ..questionMode = false
    ..scoreMode = false
    ..currentCategory = 0
    ..currentValue = 0
    ..currentCategoryName = ''
    ..currentQuestion = ''
    ..currentAnswer = ''
    ..answeredQuestions = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('games');

  static Stream<GamesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  GamesRecord._();
  factory GamesRecord([void Function(GamesRecordBuilder) updates]) =
      _$GamesRecord;

  static GamesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createGamesRecordData({
  int code,
  bool selectMode,
  bool questionMode,
  bool scoreMode,
  int currentCategory,
  int currentValue,
  DocumentReference selectingUser,
  DocumentReference answeringUser,
  String currentCategoryName,
  String currentQuestion,
  String currentAnswer,
}) =>
    serializers.toFirestore(
        GamesRecord.serializer,
        GamesRecord((g) => g
          ..code = code
          ..categories = null
          ..users = null
          ..selectMode = selectMode
          ..questionMode = questionMode
          ..scoreMode = scoreMode
          ..currentCategory = currentCategory
          ..currentValue = currentValue
          ..selectingUser = selectingUser
          ..answeringUser = answeringUser
          ..currentCategoryName = currentCategoryName
          ..currentQuestion = currentQuestion
          ..currentAnswer = currentAnswer
          ..answeredQuestions = null));
