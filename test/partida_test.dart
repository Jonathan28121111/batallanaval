import 'package:batallanaval/partida.dart';
import 'package:test/test.dart';

void main() {
  test('La partida se creó correctamente', () {
    final partida = Partida();
    
    expect(partida.estado, equals(Estado.creada));
    expect(partida.quienva, isIn([1, 2]));
  });
}