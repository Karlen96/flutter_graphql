import '../../../../core/resources/data_state.dart';
import '../entities/character_data_entity/character_data_entity.dart';

abstract class CharactersRepository {
  // getCharacters method
  Future<DataState<CharacterDataEntity>> getCharacters();
}
