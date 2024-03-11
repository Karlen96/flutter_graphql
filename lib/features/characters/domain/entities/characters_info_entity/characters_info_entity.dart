import 'package:json_annotation/json_annotation.dart';

part 'characters_info_entity.g.dart';

@JsonSerializable(createToJson: false)
class CharactersInfoEntity {
  final int count;
  final int pages;
  final int? next;
  final int? prev;

  const CharactersInfoEntity({
    this.count = 20,
    this.pages = 1,
    this.next,
    this.prev,
  });

  factory CharactersInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$CharactersInfoEntityFromJson(json);
}
