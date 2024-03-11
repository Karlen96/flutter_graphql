import 'package:flutter/material.dart';

import 'config/theme/light_theme.dart';
import 'features/characters/presentation/pages/characters_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: const CharactersPage(),
    );
  }
}
