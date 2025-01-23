import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:t_action/components/constants.dart';
import 'package:t_action/controllers/estadistics_controller.dart';
import 'package:t_action/models/estadistics_model.dart';

final uid = FirebaseAuth.instance.currentUser!.uid;

class EstadisticasScreen extends StatelessWidget {
  const EstadisticasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGame2Color,
        title: const Text('Estadísticas del niño'),
      ),
      body: FutureBuilder<List<Estadisticas>>(
        future: cargarEstadisticas(uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error al cargar estadísticas: ${snapshot.error}"),
              );
            } else {
              List<Estadisticas> estadisticasList = snapshot.data!;

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: estadisticasList.length,
                  itemBuilder: (context, index) {
                    Estadisticas estadisticas = estadisticasList[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text('Juego de ${estadisticas.categoria}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Fecha de Juego: ${estadisticas.fechaDeJuego}'),
                            Text('Puntaje o intentos: ${estadisticas.puntaje}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
