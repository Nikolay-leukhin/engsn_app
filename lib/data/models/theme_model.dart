import 'package:engsn_corected/data/models/words_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'theme_model.g.dart';

@JsonSerializable()
class ThemeModel extends Equatable {
  final int id;

  @JsonKey(name: 'theme_name')
  final String themeName;

  late List<WordsModel> wordsTheme;

  ThemeModel({required this.id, required this.themeName, required this.wordsTheme});

  // factory ThemeModel.fromJson(Map<String, dynamic> json) => _$ThemeModelFromJson(json);

  // Map<String, dynamic> toJson() => _$ThemeModelToJson(this);

  @override
  List<Object?> get props => [id, themeName, wordsTheme];
}
