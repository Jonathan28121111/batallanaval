
import 'package:batallanaval/partida.dart';
import 'package:test/test.dart';

void main() {
  test("Al crearse debe marcarse creada ", (){
  Partida partida = Partida();
  expect(partida.estado, equals(Estado.creada)); 
  });
}
