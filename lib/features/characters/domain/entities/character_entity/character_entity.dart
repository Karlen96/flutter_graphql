import 'package:json_annotation/json_annotation.dart';

part 'character_entity.g.dart';

@JsonSerializable(createToJson: false)
class CharacterEntity {
  final String id;
  final String name;
  final String species;
  final String image;

  const CharacterEntity({
    required this.id,
    required this.name,
    required this.species,
    required this.image,
  });

  factory CharacterEntity.fromJson(Map<String, dynamic> json) =>
      _$CharacterEntityFromJson(json);
}
