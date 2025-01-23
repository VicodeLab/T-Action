import 'package:t_action/models/question_model.dart';


//Lista de las preguntas a presentar

List<QuestionModel> questions = [
  QuestionModel(
    "¿Cuál es este animal?",
    "assets/icons/ballena.svg",
    {
      "Leopardo": false,
      "Serpiente": false,
      "Ballena": true,
      "Perro": false,
    },
  ),
  QuestionModel("¿Qué lugar es este?", 
    "assets/icons/playa.svg", {
    "Parque": false,
    "Piscina": false,
    "Centro comercial": false,
    "Playa": true,
  }),
  QuestionModel("¿Qué animal es este?",
    "assets/icons/gato.svg", {
    "Mariposa": false,
    "Gato": true,
    "Mono": false,
    "Tigre": false,
  }),
  QuestionModel("¿Qué son estas?", 
    "assets/icons/frutas.svg", {
    "Herramientas": false,
    "Sillas": false,
    "Frutas": true,
    "Camisas": false,
  }),
  QuestionModel("¿Qué lugar es este?", 
    "assets/icons/escuela.svg", {
    "Escuela": true,
    "Estadio": false,
    "Pista de carreras": false,
    "Restaurante": false,
  }),
  QuestionModel("¿Qué animal es este?", 
    "assets/icons/gallina.svg", {
    "Armadillo": false,
    "Lobo": false,
    "Gallina": true,
    "Foca": false,
  }),
  QuestionModel("¿Qué vehículo es este?", 
    "assets/icons/avion.svg", {
    "Carro": false,
    "Moto": false,
    "Barco": false,
    "Avión": true,
  }),
  QuestionModel("¿Qué quiere tiene la niña?", 
    "assets/icons/dolorcabeza.svg", {
    "Tiene ganas de ir al baño": false,
    "Tiene hambre": false,
    "Le duele la cabeza": true,
    "Quiere dormir": false,
  }),
  QuestionModel("¿Qué acción es esta?", 
    "assets/icons/tomar.svg", {
    "Comer": false,
    "Bañarse": false,
    "Tomar agua": true,
    "Jugar": false,
  }),
  QuestionModel("¿Qué le ocurre al niño?", 
    "assets/icons/dolorestomago.svg", {
    "Tiene sueño": false,
    "Le duele el estomago": true,
    "Quiere ver TV": false,
    "Le duele la cabeza": false,
  }),
];
