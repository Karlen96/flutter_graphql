import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/characters_repository_implementation.dart';
import 'characters_events.dart';
import 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvents, CharactersState> {
  CharactersBloc() : super(const CharactersStateData()) {
    on<GetCharacters>(_getPage);
  }

  final _repository = CharactersRepositoryImplementation();

  Future<void> _getPage(
    GetCharacters event,
    Emitter<CharactersState> emit,
  ) async {
    final res = await _repository.getCharacters(
      page: event.page,
    );

    final _characters = [
      ...(state as CharactersStateData).characters,
      ...res.data!.characters.results,
    ];

    final _info = res.data!.characters.info;

    emit(
      CharactersStateData(
        characters: _characters,
        info: _info,
      ),
    );
  }
}
