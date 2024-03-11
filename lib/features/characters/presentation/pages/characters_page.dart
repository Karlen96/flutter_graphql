import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql/features/characters/presentation/bloc/characters/characters_state.dart';

import '../bloc/characters/characters_bloc.dart';
import '../bloc/characters/characters_events.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final _charactersBloc = CharactersBloc();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreData);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreData() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      final _nextPage =
          (_charactersBloc.state as CharactersStateData).info.next;
      if (_nextPage != null) {
        _charactersBloc.add(GetCharacters(page: _nextPage));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
      ),
      body: BlocProvider<CharactersBloc>(
        create: (_) => _charactersBloc..add(GetCharacters()),
        child: BlocBuilder<CharactersBloc, CharactersState>(
          builder: (_, state) {
            if (state is CharactersStateData) {
              final characters = state.characters;
              final _itemsCount =
                  state.characters.length + (state.info.next != null ? 1 : 0);

              return ListView.builder(
                controller: _scrollController,
                itemCount: _itemsCount,
                cacheExtent: 300,
                itemBuilder: (_, i) {
                  if (_itemsCount - 1 == i) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  return ListTile(
                    onTap: () {},
                    title: Text(characters[i].name),
                    leading: ExtendedImage.network(
                      characters[i].image,
                      width: 72,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 8,
                    ),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
