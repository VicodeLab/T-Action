class Estadisticas {
  final String? nteaName;
  final String? idtea;
  final String categoria;
  final DateTime fechaDeJuego;
  final int puntaje;

  Estadisticas({
    required this.nteaName,
    required this.idtea,
    required this.categoria,
    required this.fechaDeJuego,
   required this.puntaje
  });

  factory Estadisticas.fromJson(Map<String, dynamic> json) {
    return Estadisticas(
      nteaName: json['nteaName'],
      idtea: json['idtea'],
      categoria: json['categoria'],
      fechaDeJuego: json['fechaDeJuego'],
      puntaje: json['puntaje']
    );
  }

  Map<String, dynamic> toJson() => {
        'nteaName': nteaName,
        'idtea': idtea,
        'categoria': categoria,
        'fechaDeJuego': fechaDeJuego.toIso8601String(),
        'puntaje': puntaje
      };
}
