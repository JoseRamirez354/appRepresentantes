import 'dart:convert';

import 'package:app_repre/utilidades/api.dart';
import 'package:app_repre/utilidades/gradiente_perfil.dart';
import 'package:app_repre/utilidades/header_perfil.dart';
import 'package:app_repre/utilidades/lista_hijos.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  //String nombre, apellido, correo;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MyHomePage> {
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

    //print(hijos);
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

  //obtengo los datos de los hijos

  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBackProfile(),
        HeaderProfile(nombre, apellido, cargo, correo, sexo),
        ListadeHijos(),
      ],
    );
  }
}
