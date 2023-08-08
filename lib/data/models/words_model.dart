import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'words_model.g.dart';

@JsonSerializable()
class WordsModel extends Equatable{

  final int id;

  final String name;

  final String explanation;

  final String translation;

  final String transcription;

  @JsonKey(name: 'theme_id')
  final int themeId;

  WordsModel({required this.translation, required this.id, required this.name, required this.explanation, required this.transcription, required this.themeId});
  
  factory WordsModel.fromJson(Map<String, dynamic> json) => _$WordsModelFromJson(json);

  Map<String, dynamic> toJson() => _$WordsModelToJson(this);

  @override
  List<Object?> get props => [
    id,
    name,
    explanation,
    name,
    transcription,
    translation,
    themeId
  ];
}
