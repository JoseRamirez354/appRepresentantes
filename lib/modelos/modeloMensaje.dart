import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VistaMensaje extends StatelessWidget {
  String pathImage = "assets/Masculino.jpg";
  String name = "José Ramirez";
  String detail = "1 VistaMensaje 5 photos";
  String coment = "Hermosa ciudad";

  VistaMensaje(this.pathImage, this.name, this.detail, this.coment);
  @override
  Widget build(BuildContext context) {
    final userComent = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        coment,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Monse", fontSize: 14.0, fontWeight: FontWeight.w900),
      ),
    );
    final userInfo = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        detail,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Monse", fontSize: 14.0, color: Colors.black26),
      ),
    );

    final userName = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: TextStyle(fontFamily: "Monse", fontSize: 16.0),
      ),
    );

    final usersDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[userName, userInfo, userComent],
    );
    final photo = Container(
      margin: EdgeInsets.only(top: 15.0, left: 20.0),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage))),
    );

    return Row(
      children: <Widget>[photo, usersDetails],
    );
  }
}
