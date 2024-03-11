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

              return ListView.builder(
                itemCount: characters.length,
                itemBuilder: (_, i) {
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
