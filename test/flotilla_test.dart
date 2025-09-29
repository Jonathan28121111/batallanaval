import 'package:batallanaval/flotilla.dart';
import 'package:batallanaval/punto.dart';
import 'package:test/test.dart';

void main() {
  test('Flotilla con menos de 5 barcos', () {
    var barcos = [
      Barco(tipo: TiposBarcos.bote, posicionInicial: Punto(fila: 1, columna: 1), direccion: DireccionesHacia.derecha),
      Barco(tipo: TiposBarcos.lancha, posicionInicial: Punto(fila: 2, columna: 1), direccion: DireccionesHacia.derecha),
    ];
    expect(() => Flotilla(barcos), throwsA(isA<FlotillaCantidadExcepcion>()));
  });

  test('Flotilla con más de 5 barcos debe fallar', () {
    var barcos = [
      Barco(tipo: TiposBarcos.bote, posicionInicial: Punto(fila: 1, columna: 1), direccion: DireccionesHacia.derecha),
      Barco(tipo: TiposBarcos.lancha, posicionInicial: Punto(fila: 2, columna: 1), direccion: DireccionesHacia.derecha),
      Barco(tipo: TiposBarcos.submarino, posicionInicial: Punto(fila: 3, columna: 1), direccion: DireccionesHacia.derecha),
      Barco(tipo: TiposBarcos.crucero, posicionInicial: Punto(fila: 4, columna: 1), direccion: DireccionesHacia.derecha),
      Barco(tipo: TiposBarcos.portaaviones, posicionInicial: Punto(fila: 5, columna: 1), direccion: DireccionesHacia.derecha),
      Barco(tipo: TiposBarcos.bote, posicionInicial: Punto(fila: 6, columna: 1), direccion: DireccionesHacia.derecha),
    ];
    expect(() => Flotilla(barcos), throwsA(isA<FlotillaCantidadExcepcion>()));
  });
  
  test('Flotilla con tipos duplicados debe fallar', () {
    var barcos = [
      Barco(tipo: TiposBarcos.bote, posicionInicial: Punto(fila: 1, columna: 1), direccion: DireccionesHacia.derecha),
      Barco(tipo: TiposBarcos.bote, posicionInicial: Punto(fila: 2, columna: 1), direccion: DireccionesHacia.derecha),
      Barco(tipo: TiposBarcos.submarino, posicionInicial: Punto(fila: 3, columna: 1), direccion: DireccionesHacia.derecha),
      Barco(tipo: TiposBarcos.crucero, posicionInicial: Punto(fila: 4, columna: 1), direccion: DireccionesHacia.derecha),
      Barco(tipo: TiposBarcos.portaaviones, posicionInicial: Punto(fila: 5, columna: 1), direccion: DireccionesHacia.derecha),
    ];
    expect(() => Flotilla(barcos), throwsA(isA<FlotillaTiposExcepcion>()));
  });
  
  test('Flotilla con posición inadecuada debe fallar', () {
    var barcos = [
      Barco(tipo: TiposBarcos.bote, posicionInicial: Punto(fila: 1, columna: 1), direccion: DireccionesHacia.derecha),
      Barco(tipo: TiposBarcos.lancha, posicionInicial: Punto(fila: 2, columna: 1), direccion: DireccionesHacia.derecha),
      Barco(tipo: TiposBarcos.submarino, posicionInicial: Punto(fila: 3, columna: 1), direccion: DireccionesHacia.derecha),
      Barco(tipo: TiposBarcos.crucero, posicionInicial: Punto(fila: 4, columna: 1), direccion: DireccionesHacia.derecha),
      Barco(tipo: TiposBarcos.portaaviones, posicionInicial: Punto(fila: 5, columna: 1), direccion: DireccionesHacia.derecha),
    ];
    expect(() => Flotilla(barcos), throwsA(isA<FlotillaPosicionExcepcion>()));
  });
}
