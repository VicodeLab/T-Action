import 'package:flutter/material.dart';
import 'package:t_action/components/constants.dart';
import 'package:t_action/views/Estadistics/estadistics_screen.dart';
import 'package:t_action/views/Gamesplay/memory_game.dart';
import 'package:t_action/views/Gamesplay/vocabulary_game.dart';

class GamesOptions extends StatelessWidget {
  const GamesOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const VocabularyGame();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: kGame1Color, elevation: 6),
          child: Text(
            "Desarrollo de vocabulario".toUpperCase(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const MemoryGame();
                },
              ),
            );
          },
          
          style: ElevatedButton.styleFrom(
              backgroundColor: kGame2Color, elevation: 6),
          child: Text(
            "Fortalecimiento de memoria".toUpperCase(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const EstadisticasScreen();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: kGame3Color, elevation: 6),
          child: Text(
            "ESTADÍSTICAS".toUpperCase(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(height: 25)
      ],
    );
  }
}
