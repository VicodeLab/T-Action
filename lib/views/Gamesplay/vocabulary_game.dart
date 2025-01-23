import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t_action/components/constants.dart';
import 'package:t_action/controllers/estadistics_controller.dart';
import 'package:t_action/controllers/popmessages_controller.dart';
import 'package:t_action/controllers/question_controller.dart';
import 'package:t_action/controllers/user_controller.dart';

class VocabularyGame extends StatefulWidget {
  const VocabularyGame({super.key});

  @override
  State<VocabularyGame> createState() => _VocabularyGameState();
}

class _VocabularyGameState extends State<VocabularyGame> {

  int score = 0;
  bool btnPressed = false;
  PageController? _controller;
  String btnText = "Siguiente pregunta";
  bool answered = false;
  String category = "Vocabulario";
  DateTime fechaHoy = DateTime.now();
  final uid = FirebaseAuth.instance.currentUser!.uid;

  Future<String?> nameuser = getUserName();


  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecundaryColor,
      body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: PageView.builder(
            controller: _controller!,
            onPageChanged: (page) {
              if (page == questions.length - 1) {
                setState(() {
                  btnText = "Resultados";
                });
              }
              setState(() {
                answered = false;
              });
            },
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Pregunta: ${index + 1}/10",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: Text(
                      "${questions[index].question}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: SvgPicture.asset(
                          questions[index].imagePath
                        ),
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  for (int i = 0; i < questions[index].answers!.length; i++)
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      margin: const EdgeInsets.only(
                          bottom: 20.0, left: 12.0, right: 12.0),
                      child: RawMaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        fillColor: btnPressed
                            ? questions[index].answers!.values.toList()[i]
                                ? Colors.green
                                : Colors.red
                            : kGame1Color,
                        onPressed: !answered
                            ? () {
                                if (questions[index]
                                    .answers!
                                    .values
                                    .toList()[i]) {
                                  score++;
                                  
                                } else {
                                  
                                }
                                setState(() {
                                  btnPressed = true;
                                  answered = true;
                                });
                              }
                            : null,
                        child: Text(questions[index].answers!.keys.toList()[i],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            )),
                      ),
                    ),
                  const SizedBox(
                    height: defaultPadding * 0.70,
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      if (_controller!.page?.toInt() == questions.length - 1) {
                        // Se crean las estadisticas y Muestra el cuadro de diálogo de puntuación
                        crearEstadisticas(context, category, uid, nameuser, fechaHoy, score);
                        showScoreDialog(context, score);

                      } else {
                        _controller!.nextPage(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeInExpo);

                        setState(() {
                          btnPressed = false;
                        });
                      }
                    },
                    shape: const StadiumBorder(),
                    fillColor: kGame1Color,
                    padding: const EdgeInsets.all(5.0),
                    elevation: 0.0,
                    child: Text(
                      btnText,
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              );
            },
            itemCount: questions.length,
          )),
    );
  }
}