import 'package:flutter/material.dart';

class User {
  final String id;
  final String nombre;
  final String apellido;
  final String email;
  final String cargo;
  final String sexo;
  User({
    Key key,
    @required this.id,
    @required this.nombre,
    @required this.apellido,
    @required this.email,
    @required this.cargo,
    @required this.sexo,
  });

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      id: parsedJson['id'].toString(),
      nombre: parsedJson['nombres'],
      apellido: parsedJson['apellidos'],
      email: parsedJson['correo'],
      cargo: parsedJson['cargo'],
      sexo: parsedJson['sexo'],
    );
  }

  //myFavoritePlaces
  //myPlaces
}
