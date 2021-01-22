import 'package:app_repre/User/bloc/bloc_user.dart';
import 'package:app_repre/User/model/user.dart';
import 'package:app_repre/utilidades/button_green.dart';
import 'package:app_repre/utilidades/title_input_location.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class FormularioUsuario extends StatefulWidget {
  User user;
  FormularioUsuario({this.user});

  @override
  State<StatefulWidget> createState() {
    return _FormularioUsuario();
  }
}

class _FormularioUsuario extends State<FormularioUsuario> {
  @override
  Widget build(BuildContext context) {
    final _inputNombre = TextEditingController();
    final _inputApellido = TextEditingController();
    final _inputSexo = TextEditingController();
    return Container(
        margin: EdgeInsets.only(top: 300.0, bottom: 20.0),
        child: ListView(children: [
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: TextInputLocation(
              hintText: "Nombre",
              iconData: Icons.person,
              controller: _inputNombre,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: TextInputLocation(
              hintText: "Apellido",
              iconData: Icons.person,
              controller: _inputNombre,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: TextInputLocation(
              hintText: "Sexo",
              iconData: Icons.person,
              controller: _inputNombre,
            ),
          ),
          Container(
            width: 70.0,
            child: ButtonGreen(
              text: "Editar",
              onPressed: () {},
              width: 150.0,
              height: 50.0,
            ),
          ),
        ]));
  }
}
