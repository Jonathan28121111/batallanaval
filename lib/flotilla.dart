import 'package:batallanaval/elemento.dart';
import 'package:batallanaval/punto.dart';

enum TiposBarcos { bote, lancha, submarino, crucero, portaaviones }
enum DireccionesHacia { arriba, abajo, izquierda, derecha }

class Barco {
  final TiposBarcos tipo;
  final DireccionesHacia direccion;
  final Punto posicionInicial;
  List<Elemento> _elementos = [];

  Barco({required this.tipo,
   required this.posicionInicial, 
   required this.direccion}) {
    int size = 0;
    switch (tipo) {
      case TiposBarcos.bote:
        size = 1;
        break;
      case TiposBarcos.lancha:
        size = 2;
        break;
      case TiposBarcos.submarino:
        size = 3;
        break;
      case TiposBarcos.crucero:
        size = 4; 
        break;
      case TiposBarcos.portaaviones:
        size = 5;
        break;
    }
     
     for (int i = 0; i < size; i++) {
      int fila = posicionInicial.fila;
      int columna = posicionInicial.columna;
      switch (direccion) {
        case DireccionesHacia.arriba:
          fila -= i;
          break;
        case DireccionesHacia.abajo:
          fila += i;
          break;
        case DireccionesHacia.izquierda:
          columna -= i;
          break;
        case DireccionesHacia.derecha:
          columna += i;
          break;
      }
      _elementos.add(Elemento(punto: Punto(fila: fila, columna: columna)));
    }
    }
}

class Flotilla {
  final List<Barco> _barcos;
  int get cantidad => _barcos.length;
  Flotilla(this._barcos) {
    if (!esCantidadCorrecta(_barcos)) throw FlotillaCantidadExcepcion();
    if (!sonTiposCorrectos(_barcos)) throw FlotillaTiposExcepcion();
    if (!estanEnPosicionAdecuada(_barcos)) throw FlotillaPosicionExcepcion();
  }
}

bool estanEnPosicionAdecuada(List<Barco> barcos) {
   List<Set<String>> posicionesPorBarco = [];
  
  for (var barco in barcos) {
    Set<String> posiciones = {};
    for (var elemento in barco._elementos) {
      posiciones.add('${elemento.punto.fila},${elemento.punto.columna}');
    }
    posicionesPorBarco.add(posiciones);
  }
  
  for (int i = 0; i < posicionesPorBarco.length; i++) {
    for (int j = i + 1; j < posicionesPorBarco.length; j++) {
      for (String pos1 in posicionesPorBarco[i]) {
        var coords1 = pos1.split(',');
        int fila1 = int.parse(coords1[0]);
        int col1 = int.parse(coords1[1]);
        
        for (String pos2 in posicionesPorBarco[j]) {
          var coords2 = pos2.split(',');
          int fila2 = int.parse(coords2[0]);
          int col2 = int.parse(coords2[1]);
          if ((fila1 - fila2).abs() <= 1 && (col1 - col2).abs() <= 1) {
            return false;
          }
        }
      }
    }
  }
  
  return true;
}

bool esCantidadCorrecta(List<Barco> barcos) {
  return barcos.length == 5;
}

bool sonTiposCorrectos(List<Barco> barcos) {
  return barcos.map((e) => e.tipo).toSet().length == 5;
}



class FlotillaCantidadExcepcion extends Error {}
class FlotillaTiposExcepcion extends Error {}
class FlotillaPosicionExcepcion extends Error {}