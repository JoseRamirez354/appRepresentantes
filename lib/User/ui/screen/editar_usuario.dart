import 'package:app_repre/User/model/user.dart';
import 'package:app_repre/User/ui/widgets/formulario_usuario.dart';
import 'package:app_repre/User/ui/widgets/header_perfil_new.dart';
import 'package:app_repre/utilidades/gradient_back.dart';
import 'package:app_repre/utilidades/listaMensajes.dart';
import 'package:flutter/material.dart';

class EditarUsuario extends StatelessWidget {
  User user;
  EditarUsuario({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          GradientBack(heigth: 300),
          HeaderProfileNew(user, 'perfil'),
          FormularioUsuario(
            user: user,
          ),
        ],
      ),
    );
  }
}
