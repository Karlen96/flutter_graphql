import 'package:json_annotation/json_annotation.dart';

import '../character_entity/character_entity.dart';
import '../characters_info_entity/characters_info_entity.dart';

part 'characters_entity.g.dart';

@JsonSerializable(createToJson: false)
class CharactersEntity {
  final List<CharacterEntity> results;
  final CharactersInfoEntity info;

  const CharactersEntity({
    required this.results,
    required this.info,
  });

  factory CharactersEntity.fromJson(Map<String, dynamic> json) =>
      _$CharactersEntityFromJson(json);
}
