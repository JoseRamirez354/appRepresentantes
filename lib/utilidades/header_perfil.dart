import 'package:app_repre/User/ui/widgets/user_info.dart';
import 'package:app_repre/Vistas/home.dart';
import 'package:app_repre/Vistas/mensajes.dart';
import 'package:app_repre/User/model/user.dart';
import 'package:app_repre/utilidades/menu_principal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'botonPeriodoL.dart';
import 'button_green.dart';

class HeaderProfile extends StatelessWidget {
  User user;
  String nomRepre = 'jose';
  String apellidos = 'ramirez';
  String cargo = 'representante';
  String correo = 'jgrs2011ec@gmail.com';
  String sexo = 'jgrs2011ec@gmail.com';
  String icono = 'home';
  String periodoN = '2000';
  HeaderProfile(this.nomRepre, this.apellidos, this.cargo, this.correo,
      this.sexo, this.icono, this.periodoN);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final headerStablished = Container(
      margin: EdgeInsets.only(top: 40.0, left: 20.0),
      child: Text(
        "${cargo}",
        style: TextStyle(
            fontFamily: "Monse",
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    );

    final encabezado = Row(
      children: <Widget>[
        headerStablished,
        Spacer(),
        Container(
          child: ButtonGreen(
            text: "${periodoN}",
            onPressed: () {},
            width: 100.0,
            height: 30.0,
          ),
        ),
        /*,settingIcon*/
      ],
    );
    //final String path_imagen = 'assets/${sexo}.jpg';
    final photo = Container(
      margin: EdgeInsets.only(top: 15.0, left: 20.0),
      width: 90.0,
      height: 90.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2.0,
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(sexo == 'Femenino'
                ? 'assets/Femenino.jpg'
                : 'assets/Masculino.jpg')),
      ),
    );
    final userName = Container(
      margin: EdgeInsets.only(top: 15.0, left: 20.0),
      child: Text(
        "${nomRepre}",
        textAlign: TextAlign.left,
        style:
            TextStyle(fontFamily: "Monse", fontSize: 18.0, color: Colors.white),
      ),
    );
    final userApellido = Container(
      margin: EdgeInsets.only(top: 15.0, left: 20.0),
      child: Text(
        "${apellidos}",
        textAlign: TextAlign.left,
        style:
            TextStyle(fontFamily: "Monse", fontSize: 18.0, color: Colors.white),
      ),
    );
    final userEmail = Container(
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      child: Text(
        //"jgrs2011ec@gmail.com",
        '${correo}',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Monse", fontSize: 16.0, color: Colors.white70),
      ),
    );
    final userInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[userName, userApellido, userEmail],
    );
    final infoPerfil = Row(
      children: <Widget>[photo, userInfo],
    );

    final iconGift = Container(
      width: 40.0,
      height: 40.0,
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white54),
      child: Icon(
        Icons.live_tv,
        size: 25.0,
        color: Color(0xFF4F53CD),
      ),
    );

    final iconSchool = Container(
      width: icono == 'home' ? 60.0 : 40.0,
      height: icono == 'home' ? 60.0 : 40.0,
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: icono == 'home' ? Colors.white : Colors.white54),
      child: Icon(
        Icons.school,
        size: icono == 'home' ? 40.0 : 25.0,
        color: Color(0xFF4F53CD),
      ),
    );

    final iconMail = Container(
      width: icono == 'mensajes' ? 60.0 : 40.0,
      height: icono == 'mensajes' ? 60.0 : 40.0,
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: icono == 'mensajes' ? Colors.white : Colors.white54,
      ),
      child: Icon(
        Icons.mail,
        size: icono == 'mensajes' ? 40.0 : 25.0,
        color: Color(0xFF4F53CD),
      ),
    );

    final iconProfile = Container(
      width: 40.0,
      height: 40.0,
      margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white54),
      child: Icon(
        Icons.person,
        size: 25.0,
        color: Color(0xFF4F53CD),
      ),
    );
    final InteractionsIcons = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new InkWell(
          child: iconGift,
          onTap: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("segundo"),
            ));
          },
        ),
        new InkWell(
          child: iconSchool,
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => MyHomePage()));
          },
        ),
        new InkWell(
          child: iconMail,
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (PlatziTripsCupertino) => Mensajes()));
          },
        ),
        new InkWell(
          child: iconProfile,
          onTap: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(user.id),
            ));
          },
        )
      ],
    );
    return Column(
      children: <Widget>[
        encabezado,
        infoPerfil,
        //UserInfo(user)
        InteractionsIcons,
      ],
    );
    throw UnimplementedError();
  }
}
