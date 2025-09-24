import 'package:batallanaval/flotilla.dart';
import 'package:test/test.dart';

void main() {
  test('Cuando creo una flotilla debe de tener 5 tipos de barcos', () {
    var barcosNumero = [Barco(TiposBarcos.bote)];
    expect(
      () => Flotilla(barcosNumero),
      throwsA(isA<FlotillaCantidadExcepcion>())
    );
  });
  
  var barcosIncorrectos = [
    Barco(TiposBarcos.bote),
    Barco(TiposBarcos.crucero),
    Barco(TiposBarcos.lancha),
    Barco(TiposBarcos.portaaviones),
    Barco(TiposBarcos.portaaviones),
  ];
}