import 'package:app_repre/utilidades/botonFlotanteMas.dart';
import 'package:flutter/material.dart';
//import 'floating_action_button_green.dart';

class CardHijo extends StatelessWidget {
  String pathImage = "assets/est_hombre.jpg";
  String nombre = "Jose Ramirez";
  String apellido = "RAMIREZ sanchez";
  String curso = "Segundo ";
  String paralelo = "A";
  String especializacion = "Ciencias";
  CardHijo(this.pathImage, this.nombre, this.apellido, this.curso,
      this.paralelo, this.especializacion);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final card = Container(
      height: 200.0,
      width: 300.0,
      margin: EdgeInsets.only(top: 10.0, left: 5.0, bottom: 50.0),
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage)),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
    );

    final nombreHijo = Container(
      margin: new EdgeInsets.only(top: 5.0, left: 15.0),
      child: new Text(
        nombre,
        style: const TextStyle(
            fontFamily: "Monse", fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
    );
    final apellidoHijo = Container(
      width: 170.0,
      margin: new EdgeInsets.only(top: 2.0, left: 15.0),
      child: new Text(
        apellido,
        style: const TextStyle(
            fontFamily: "Monse", fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
    );
    final Curso = Container(
      margin: new EdgeInsets.only(top: 5.0, left: 15.0),
      child: new Text(
        curso + ' ' + paralelo + ' ' + especializacion,
        style: const TextStyle(
            fontFamily: "Monse",
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.orange),
      ),
    );
    final infoContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[nombreHijo, apellidoHijo, Curso],
    );
    final cardInfo = Container(
      height: 95.0,
      width: 250.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0)),
          ]),
      child: infoContent,
    );
    final carInfoStack = Stack(
      alignment: Alignment(0.9, 1.1),
      children: <Widget>[
        cardInfo,
        Container(
          height: 40.0,
          child: BotonMas(),
        ),
      ],
    );

    return Stack(
      alignment: Alignment(0.0, 0.8),
      children: <Widget>[card, carInfoStack],
    );

    throw UnimplementedError();
  }
}
