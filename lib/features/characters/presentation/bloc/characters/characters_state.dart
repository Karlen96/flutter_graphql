import '../../../domain/entities/character_entity/character_entity.dart';
import '../../../domain/entities/characters_info_entity/characters_info_entity.dart';

sealed class CharactersState {
  const CharactersState();
}

final class CharactersStateData extends CharactersState {
  const CharactersStateData({
    this.characters = const <CharacterEntity>[],
    this.info = const CharactersInfoEntity(),
  });

  final List<CharacterEntity> characters;
  final CharactersInfoEntity info;
}

final class CharactersStateLoading extends CharactersState {}

final class CharactersStateFailure extends CharactersState {}
