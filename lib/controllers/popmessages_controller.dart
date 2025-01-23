import 'package:flutter/material.dart';
import 'package:t_action/views/GamesRoom/games_room.dart';
import 'package:t_action/views/Gamesplay/memory_game.dart';
import 'package:t_action/views/Gamesplay/vocabulary_game.dart';

void showPopAlert(
    BuildContext context, String message, AlertMessageType alertMessageType) {
  final iconData = _getIconData(alertMessageType);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(iconData, color: Colors.white), // Agrega el ícono aquí
          const SizedBox(width: 8), // Espacio entre el ícono y el texto
          Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
      backgroundColor: _getSnackBarColor(alertMessageType),
    ),
  );
}

Color _getSnackBarColor(AlertMessageType alertMessageType) {
  switch (alertMessageType) {
    case AlertMessageType.success:
      return Colors.green;
    case AlertMessageType.error:
      return Colors.red;
    case AlertMessageType.warning:
      return Colors.yellow;
    case AlertMessageType.notification:
      return Colors.blue;
    default:
      return Colors
          .blue; // Color por defecto o cualquier otro valor que desees.
  }
}

enum AlertMessageType { success, error, warning, notification }

IconData _getIconData(AlertMessageType messageType) {
  switch (messageType) {
    case AlertMessageType.success:
      return Icons.check_circle;
    case AlertMessageType.error:
      return Icons.error;
    case AlertMessageType.warning:
      return Icons.warning;
    case AlertMessageType.notification:
      return Icons.info;
    default:
      return Icons.info;
  }
}

void showScoreDialog(BuildContext context, int score) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('✨Resultados✨', textAlign: TextAlign.center,),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Text(
              'Tu puntuación fue de: $score',
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const VocabularyGame();
                },
              ))
            },
            child: const Text('Repetir'),
          ),
          TextButton(
            onPressed: () => {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const GamesRoom();
                },
              ))
            },
            child: const Text('Salir'),
          ),
        ],
      );
    },
  );
}

void showScoreDialogMemory(BuildContext context, int score, int tries) {
  showDialog(
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
      title: const Text('✨Resultados✨', textAlign:TextAlign.center,),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Text(
            'Hiciste: $tries intentos',
            style: const TextStyle(fontSize: 20, color: Colors.blue),
          ),
          const SizedBox(height: 5),
          Text(
            'Tu puntuación fue de: $score',
            style: const TextStyle(fontSize: 20, color: Colors.blue),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const MemoryGame();
              },
            ))
          },
          child: const Text('Repetir'),
        ),
        TextButton(
          onPressed: () => {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const GamesRoom();
              },
            ))
          },
          child: const Text('Salir'),
        ),
      ],
    );},
  );
}
