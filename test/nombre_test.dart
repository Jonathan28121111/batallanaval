import 'package:batallanaval/nombre.dart';
import 'package:test/test.dart';

void main() {
  test('Debe de tener un minimo de 5 caracteres', () {
    expect(() => Nombre(""), throwsA(isA<Longitudminimaexcepcion>()));
    expect(() => Nombre("abc"), throwsA(isA<Longitudminimaexcepcion>()));
    expect(() => Nombre("abcd"), throwsA(isA<Longitudminimaexcepcion>()));
    expect(() => Nombre("abcde"), returnsNormally); 
  });

  test('Debe de tener un maximo de 15 caracteres', () {
    expect(() => Nombre("abcdefghijklmnop"), throwsA(isA<Longitudmaximaexcepcion>()));
    expect(() => Nombre("abcdefghijklmno"), returnsNormally); 
  });

  test('El nombre ingresado es valido', () {
    expect(() => Nombre("usuario"), returnsNormally);
    expect(() => Nombre("abcdefghijklmno"), returnsNormally); 
  });

  test('No debe permitir caracteres especiales', () {
    expect(() => Nombre("usu@rio"), throwsA(isA<CaracteresInvalidosExcepcion>()));
    expect(() => Nombre("nombre!"), throwsA(isA<CaracteresInvalidosExcepcion>()));
    expect(() => Nombre("nombre#123"), throwsA(isA<CaracteresInvalidosExcepcion>()));
    expect(() => Nombre("nombre_123"), throwsA(isA<CaracteresInvalidosExcepcion>()));
    expect(() => Nombre("nombre123"), returnsNormally); 
  });
}



