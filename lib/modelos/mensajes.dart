class Mensajes {
  final String id;
  final String razon;
  final String descripcion;
  final String nombres;
  final String apellidos;
  final String cargo;
  Mensajes(
      {this.id,
      this.razon,
      this.descripcion,
      this.nombres,
      this.apellidos,
      this.cargo});
  factory Mensajes.fromJson(Map<String, dynamic> parsedJson) {
    return Mensajes(
        id: parsedJson['id'].toString(),
        razon: parsedJson['razon'],
        descripcion: parsedJson['descripcion'],
        nombres: parsedJson['nombres'],
        apellidos: parsedJson['apellidos'],
        cargo: parsedJson['cargo']);
  }
}

class MensajesList {
  final List<Mensajes> mensajesL;

  MensajesList({
    this.mensajesL,
  });

  factory MensajesList.fromJson(List<dynamic> parsedJson) {
    List<Mensajes> mensajesL = new List<Mensajes>();
    mensajesL = parsedJson.map((i) => Mensajes.fromJson(i)).toList();
    return new MensajesList(mensajesL: mensajesL);
  }
}
