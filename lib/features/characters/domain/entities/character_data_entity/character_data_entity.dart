import 'package:json_annotation/json_annotation.dart';

import '../characters_entity/characters_entity.dart';

part 'character_data_entity.g.dart';

@JsonSerializable(createToJson: false)
class CharacterDataEntity {
  final CharactersEntity characters;

  const CharacterDataEntity({
    required this.characters,
  });

  factory CharacterDataEntity.fromJson(Map<String, dynamic> json) =>
      _$CharacterDataEntityFromJson(json);
}
