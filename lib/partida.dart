import 'dart:math';

enum Estado {creada, iniciada, finalizada}

class Partida {
  late Estado estado;
  late int quienva; 
  
  Partida() {
    estado = Estado.creada;
    int numeroAleatorio = Random().nextInt(100);
    if (numeroAleatorio < 50) {
      quienva = 1;
    } else {
      quienva = 2;
    }
  }
}