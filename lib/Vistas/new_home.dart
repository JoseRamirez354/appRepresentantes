import 'dart:convert';

import 'package:app_repre/User/model/user.dart';
import 'package:app_repre/User/ui/widgets/header_perfil_new.dart';
import 'package:app_repre/utilidades/gradient_back.dart';
import 'package:app_repre/utilidades/lista_hijos.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewHome extends StatefulWidget {
  @override
  _NewHome createState() => new _NewHome();
}

class _NewHome extends State<NewHome> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
      child: new FutureBuilder<dynamic>(
        future: cargarUsuario(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new Stack(
                  children: <Widget>[
                    GradientBack(heigth: 300),
                    HeaderProfileNew(snapshot.data, 'home'),
                    ListadeHijos(),
                  ],
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    ));

    /*return Scaffold(
      body: new Stack(
        children: <Widget>[
          GradientBack(heigth: 300),
          HeaderProfileNew(usuarioActivo, 'home'),
          ListadeHijos(),
        ],
      ),
    );
    */
  }
}
