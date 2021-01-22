import 'package:flutter/material.dart';

class TextInputLocation extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData iconData;
  final String inicial;

  TextInputLocation(
      {Key key,
      @required this.hintText,
      @required this.iconData,
      @required this.controller,
      this.inicial});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20.0, left: 20.0),
      child: TextFormField(
        initialValue: inicial,
        controller: controller,
        style: TextStyle(
            fontSize: 15.0,
            fontFamily: "Lato",
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(iconData), // posicion del icono
            fillColor: Color(0xFFFFFFFF),
            filled: true,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                borderRadius: BorderRadius.all(Radius.circular(12.0)))),
      ),
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black12, blurRadius: 15.0, offset: Offset(0.0, 7.0))
      ]),
    );
  }
}
