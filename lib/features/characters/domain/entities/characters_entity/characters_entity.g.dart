// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersEntity _$CharactersEntityFromJson(Map<String, dynamic> json) =>
    CharactersEntity(
      results: (json['results'] as List<dynamic>)
          .map((e) => CharacterEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      info: CharactersInfoEntity.fromJson(json['info'] as Map<String, dynamic>),
    );
