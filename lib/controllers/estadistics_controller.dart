import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:t_action/controllers/popmessages_controller.dart';
import 'package:t_action/models/estadistics_model.dart';

Future<void>estadisticasDb(
  String categoriaJuego,
  String idtea,
  Future<String?> futureNameTea,
  DateTime fechaJuego,
  int puntajeObtenido,) async{

    try{
        final coleccion = FirebaseFirestore.instance.collection('datosestadisticas');
        String? nameTea = await futureNameTea;

        final datos = {
          'nombretea': nameTea,
          'idtea': idtea,
          'categoria': categoriaJuego,
          'fechajuego': Timestamp.fromDate(fechaJuego),
          'puntaje': puntajeObtenido
        };

        await coleccion.add(datos);
    }
    catch(e){
      rethrow;
    }

}

void crearEstadisticas(
  BuildContext context,
  String categoriaJuego,
  String idtea,
  Future<String?> futureNameTea,
  DateTime fechaJuego,
  int puntajeObtenido,
) async {
  try {

      estadisticasDb(categoriaJuego, idtea, futureNameTea, fechaJuego, puntajeObtenido);
    
    // ignore: use_build_context_synchronously
    showPopAlert(
      context,
      'Estadísticas creadas con éxito',
      AlertMessageType.success,
    );
  } catch (e) {
    // ignore: use_build_context_synchronously
    showPopAlert(
      context,
      'No se pudieron crear las estadísticas del usuario: $e',
      AlertMessageType.error,
    );
  }
}

Future<List<Estadisticas>>  cargarEstadisticas(String userId) async{
  final coleccion = FirebaseFirestore.instance.collection('datosestadisticas');
  final snapshot = await coleccion.where('idtea', isEqualTo: userId).get();

  final estadisticas = <Estadisticas>[];
  for (final doc in snapshot.docs){
    final data = doc.data();
    final estadistic = Estadisticas(
      nteaName: data['nombretea'], 
      idtea: data['idtea'], 
      categoria: data['categoria'], 
      fechaDeJuego: (data['fechajuego'] as Timestamp).toDate(), 
      puntaje: data['puntaje']
      );
      estadisticas.add(estadistic);
  }
  return estadisticas;
}



// Future<List<Estadisticas>> mostrarEstadisticas(BuildContext context) async {
//   try {
//     final userId = await getUserId();

//     if (userId == null) {
//       // ignore: use_build_context_synchronously
//       showPopAlert(
//         context,
//         'No se pudo obtener el ID del niño',
//         AlertMessageType.error,
//       );
//       return []; // Retorna una lista vacía en caso de error.
//     }

//     DocumentReference nTearef =
//         FirebaseFirestore.instance.collection('niños').doc(userId);

//     // Obtener la colección 'estadisticasJuegos' para el niño actual
//     CollectionReference estadisticasJuegosRef =
//         nTearef.collection('estadisticasJuegos');

//     // Obtener todos los documentos en la colección
//     QuerySnapshot querySnapshot = await estadisticasJuegosRef.get();

//     // Crear una lista para almacenar las estadísticas
//     List<Estadisticas> estadisticasList = [];

//     // Iterar sobre los documentos y convertirlos a objetos Estadisticas
//     for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
//       Map<String, dynamic> data =
//           documentSnapshot.data() as Map<String, dynamic>;
//       Estadisticas estadisticas = Estadisticas.fromJson(data);
//       estadisticasList.add(estadisticas);
//     }

//     // Retorna la lista de estadísticas obtenida
//     return estadisticasList;

//   } catch (e) {
//     // ignore: use_build_context_synchronously
//     showPopAlert(
//       context,
//       'No se pudieron obtener las estadísticas del usuario: $e',
//       AlertMessageType.error,
//     );
//     return []; // Retorna una lista vacía en caso de error.
//   }
// }



// Future<List> getestadisticas () async {
// List estadisticas = [];
//  final userId = await getUserId();
// DocumentReference nTearef =
//         FirebaseFirestore.instance.collection('niños').doc(userId);

//         CollectionReference estadisticasJuegosRef =
//         nTearef.collection('estadisticasJuegos');

// QuerySnapshot queryEstadisticas = await estadisticasJuegosRef.get();
// for (var documento in queryEstadisticas.docs) {
// estadisticas.add(documento.data());
// }
// return estadisticas;
// }

// Future<List<Estadisticas>> obtenerEstadisticas(String uid) async {
//   final collection = FirebaseFirestore.instance.collection('estadisticas');
//   final querySnapshot = await collection.where('nteaId', isEqualTo: uid).get();

//   final estadisticas = <Estadisticas>[];
//   for (final doc in querySnapshot.docs) {
//     final data = doc.data();
//     final estadistics = Estadisticas(
//       nteaName: data['nteaName'],
//       categoria: data['categoria'],
//       fechaDeJuego: data['fechaDeJuego'],
//       puntaje: data['puntaje'],
//     );
//     estadisticas.add(estadistics);
//   }

//   return estadisticas;
// }


