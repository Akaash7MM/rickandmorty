import 'package:flutter/material.dart';

import 'character_detail_screen.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  void _navigateToCharacterDetailScreen(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const CharacterDetailScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            onPressed: () => _navigateToCharacterDetailScreen(context),
            child: const Text("Move to character details screen")));
  }
}
