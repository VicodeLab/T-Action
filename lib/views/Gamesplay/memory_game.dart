import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:t_action/components/info_card.dart';
import 'package:t_action/controllers/estadistics_controller.dart';
import 'package:t_action/controllers/popmessages_controller.dart';
import 'package:t_action/controllers/user_controller.dart';
import 'package:t_action/models/card_model.dart';

class MemoryGame extends StatefulWidget {
  const MemoryGame({super.key});

  @override
  State<MemoryGame> createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  //setting text style
  TextStyle whiteText = const TextStyle(color: Colors.white);
  bool hideTest = false;
  final Game _game = Game();
  String category = "Memoria";
  DateTime fechaHoy = DateTime.now();
  final uid = FirebaseAuth.instance.currentUser!.uid;
  Future<String?> nameuser = getUserName();

  //game stats
  int tries = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _game.initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE55870),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
                  child: Text("✨Gira las tarjetas y encuentra las parejas✨",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
            ),
          ),
          const SizedBox(
            height: 3.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              infoCard("Tries", "$tries"),
              infoCard("Score", "$score"),
            ],
          ),
          SizedBox(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  itemCount: _game.gameImg!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  padding: const EdgeInsets.all(16.0),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          //incrementing the clicks
                          tries++;
                          _game.gameImg![index] = _game.cardslist[index];
                          _game.matchCheck
                              .add({index: _game.cardslist[index]});
                        });
                        if (_game.matchCheck.length == 2) {
                          if (_game.matchCheck[0].values.first ==
                              _game.matchCheck[1].values.first) {
                            //incrementing the score
                            score += 100;
                            _game.matchCheck.clear();
                          } else {

                            Future.delayed(const Duration(milliseconds: 500), () {
                              setState(() {
                                _game.gameImg![_game.matchCheck[0].keys.first] =
                                    _game.hiddenCardpath;
                                _game.gameImg![_game.matchCheck[1].keys.first] =
                                    _game.hiddenCardpath;
                                _game.matchCheck.clear();
                              });
                            });
                          }
                          if(score == 400){
                            crearEstadisticas(context, category, uid, nameuser, fechaHoy, tries);
                            showScoreDialogMemory(context, score, tries);
                          }
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFB46A),
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage(_game.gameImg![index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}