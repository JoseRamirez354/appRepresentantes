import 'dart:convert';
import 'package:app_repre/User/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUser {
  Future<dynamic> cargarUsuario() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson);
    var periodo = localStorage.getString('periodo');
    var pL = json.decode(periodo);

    User usuarioActivo = User.fromJson(user);
    print(user);
    print(usuarioActivo.nombre +
        " apellidos " +
        usuarioActivo.apellido +
        " id " +
        usuarioActivo.id);
    return usuarioActivo;
  }
/*
  void updateUserData(User user) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson);
    var periodo = localStorage.getString('periodo');
    var pL = json.decode(periodo);
    User usuarioActivo = User.fromJson(user);
    return usuarioActivo.setData({
      'id': user.uid,
      'nombres': user.nombre,
      'apellidos': user.apellido,
      'correo': user.correo,
    }, merge: true);
  }*/
}
