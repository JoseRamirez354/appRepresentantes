import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderProfile extends StatelessWidget {
  String nomRepre = 'jose';
  String apellidos = 'ramirez';
  String cargo = 'representante';
  String correo = 'jgrs2011ec@gmail.com';
  String sexo = 'jgrs2011ec@gmail.com';
  HeaderProfile(
      this.nomRepre, this.apellidos, this.cargo, this.correo, this.sexo);
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

    final settingIcon = Container(
      margin: EdgeInsets.only(top: 40.0, left: 20.0),
      child: Icon(
        Icons.settings,
        size: 15.0,
        color: Colors.white70,
      ),
    );
    final encabezado = Row(
      children: <Widget>[headerStablished, Spacer(), settingIcon],
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
    final iconSaveInsta = Container(
      width: 40.0,
      height: 40.0,
      margin: EdgeInsets.only(
        left: 20.0,
        top: 20.0,
      ),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Icon(
        Icons.bookmark_border,
        size: 25.0,
        color: Color(0xFF4F53CD),
      ),
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

    final iconMas = Container(
      width: 60.0,
      height: 60.0,
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Icon(
        Icons.school,
        size: 40.0,
        color: Color(0xFF4F53CD),
      ),
    );

    final iconMail = Container(
      width: 40.0,
      height: 40.0,
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white54),
      child: Icon(
        Icons.mail,
        size: 25.0,
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
        iconSaveInsta,
        iconGift,
        iconMas,
        iconMail,
        iconProfile
      ],
    );
    return Column(
      children: <Widget>[encabezado, infoPerfil, InteractionsIcons],
    );
    throw UnimplementedError();
  }
}
