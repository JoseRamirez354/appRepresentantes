class Hijos {
  final String id;
  final String nombre;
  final String apellido;
  final String sexo;
  final String seccion;
  Hijos({this.id, this.nombre, this.apellido, this.sexo, this.seccion});
  factory Hijos.fromJson(Map<String, dynamic> parsedJson) {
    return Hijos(
        id: parsedJson['id'].toString(),
        nombre: parsedJson['nombres'],
        apellido: parsedJson['apellidos'],
        sexo: parsedJson['sexo'],
        seccion: parsedJson['grado']);
  }
}

class HijosList {
  final List<Hijos> hijosL;

  HijosList({
    this.hijosL,
  });

  factory HijosList.fromJson(List<dynamic> parsedJson) {
    List<Hijos> hijosL = new List<Hijos>();
    hijosL = parsedJson.map((i) => Hijos.fromJson(i)).toList();
    return new HijosList(hijosL: hijosL);
  }
}
