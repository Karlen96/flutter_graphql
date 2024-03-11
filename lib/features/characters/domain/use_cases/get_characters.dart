import '../../../../core/resources/data_state.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/repository/characters_repository_implementation.dart';
import '../entities/character_data_entity/character_data_entity.dart';

class GetCharactersUseCase
    implements UseCase<DataState<CharacterDataEntity>, void> {
  final CharactersRepositoryImplementation _charactersRepositoryImplementation;

  GetCharactersUseCase(this._charactersRepositoryImplementation);

  @override
  Future<DataState<CharacterDataEntity>> call({void params}) {
    return _charactersRepositoryImplementation.getCharacters();
  }
}
