import 'dart:convert';

import 'package:app_repre/User/bloc/bloc_user.dart';
import 'package:app_repre/utilidades/gradient_back.dart';
import 'package:app_repre/utilidades/gradiente_perfil.dart';
import 'package:app_repre/utilidades/header_perfil.dart';
import 'package:app_repre/utilidades/listaMensajes.dart';
import 'package:app_repre/utilidades/lista_hijos.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
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
  var periodoNombre;

  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson);
    var periodo = localStorage.getString('periodo');
    var pL = json.decode(periodo);
    setState(() {
      userData = user;
      nombre = userData['nombres'];
      apellido = userData['apellidos'];
      correo = userData['correo'];
      cargo = userData['cargo'];
      sexo = userData['sexo'];
      periodoNombre = pL['nombre'];
    });
  }

  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    // TODO: implement build
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          GradientBack(heigth: 300),
          new HeaderProfile(
              nombre, apellido, cargo, correo, sexo, 'mensajes', periodoNombre),
          ListaMensajes(),
        ],
      ),
    );
  }
}
