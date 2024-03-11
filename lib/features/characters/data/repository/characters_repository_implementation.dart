import 'package:flutter_graphql/core/resources/data_state.dart';
import 'package:flutter_graphql/features/characters/domain/entities/character_data_entity/character_data_entity.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../domain/abstract_repository/characters_repository.dart';
import '../data_sources/remote/graph_ql_provider.dart';

class CharactersRepositoryImplementation implements CharactersRepository {
  CharactersRepositoryImplementation();

  @override
  Future<DataState<CharacterDataEntity>> getCharacters({
    int page = 1,
  }) async {
    final res = await graphQlClient.query(
      QueryOptions(
        document: gql('''{
            characters(page: $page) {
              results {
                id
                name
                species
                image
              }
              info {
                count
                pages
                next
                prev
              }
            }
          }'''),
      ),
    );

    return DataSuccess(CharacterDataEntity.fromJson(res.data!));
  }
}
