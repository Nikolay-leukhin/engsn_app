// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'words_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordsModel _$WordsModelFromJson(Map<String, dynamic> json) => WordsModel(
      translation: json['translation'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      explanation: json['explanation'] as String,
      transcription: json['transcription'] as String,
      themeId: json['theme_id'] as int,
    );

Map<String, dynamic> _$WordsModelToJson(WordsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'explanation': instance.explanation,
      'translation': instance.translation,
      'transcription': instance.transcription,
      'theme_id': instance.themeId,
    };
