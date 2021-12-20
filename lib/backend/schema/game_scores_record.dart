import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'game_scores_record.g.dart';

abstract class GameScoresRecord
    implements Built<GameScoresRecord, GameScoresRecordBuilder> {
  static Serializer<GameScoresRecord> get serializer =>
      _$gameScoresRecordSerializer;

  @nullable
  DocumentReference get user;

  @nullable
  DocumentReference get game;

  @nullable
  int get score;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(GameScoresRecordBuilder builder) =>
      builder..score = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('game_scores');

  static Stream<GameScoresRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  GameScoresRecord._();
  factory GameScoresRecord([void Function(GameScoresRecordBuilder) updates]) =
      _$GameScoresRecord;

  static GameScoresRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createGameScoresRecordData({
  DocumentReference user,
  DocumentReference game,
  int score,
}) =>
    serializers.toFirestore(
        GameScoresRecord.serializer,
        GameScoresRecord((g) => g
          ..user = user
          ..game = game
          ..score = score));
