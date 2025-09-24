class Nombre {
  late String candidato;
  Nombre(String c) {
    if (c.length < longitudMinimaPermitida) {
      throw Longitudminimaexcepcion();
    }
    if (c.length > longitudMaximaPermitida) {
      throw Longitudmaximaexcepcion();
    }
    if (!_esValido(c)) {
      throw CaracteresInvalidosExcepcion();
    }
    if (_empiezaConNumero(c)) {
      throw CaracteresInvalidosExcepcion();
    }
    candidato = c;
  }

  bool _esValido(String nombre) {
    final regex = RegExp(r'^[a-zA-Z0-9]+$');
    return regex.hasMatch(nombre);
  }

  bool _empiezaConNumero(String nombre) {
    return RegExp(r'^[0-9]').hasMatch(nombre);
  }
}

const int longitudMinimaPermitida = 5;
const int longitudMaximaPermitida = 15;

class Longitudminimaexcepcion extends Error {}
class Longitudmaximaexcepcion extends Error {}
class CaracteresInvalidosExcepcion extends Error {}