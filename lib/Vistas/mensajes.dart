import 'dart:convert';

import 'package:app_repre/utilidades/gradiente_perfil.dart';
import 'package:app_repre/utilidades/header_perfil.dart';
import 'package:app_repre/utilidades/lista_hijos.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mensajes extends StatefulWidget {
  //String nombre, apellido, correo;
  @override
  _Mensajes createState() => _Mensajes();
}

class _Mensajes extends State<Mensajes> {
  var userData;
  var sexo;
  var nombre;
  var apellido;
  var correo;
  var cargo;

  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson);
    // var hijosJson = localStorage.getString('hijos');
    // var hijos = json.decode(hijosJson);
    setState(() {
      userData = user;
      //hijos_l = hijos;
      //sexo = 'assets/Femenino.jpg';
      nombre = userData['nombres'];
      apellido = userData['apellidos'];
      correo = userData['correo'];
      cargo = userData['cargo'];
      sexo = userData['sexo'];
    });
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new GradientBackProfile(),
          new HeaderProfile(nombre, apellido, cargo, correo, sexo, 'mensajes'),
          //ListadeHijos(),
        ],
      ),
    );
  }
}
