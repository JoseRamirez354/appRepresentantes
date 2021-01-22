import 'dart:convert';

import 'package:app_repre/Vistas/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BotonPeriodo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BotonPeriodo();
    throw UnimplementedError();
  }
}

class _BotonPeriodo extends State<BotonPeriodo> {
  var userData;
  var periodoNombre;
  var sexo;
  var nombre;
  var apellido;
  var correo;
  var cargo;

  @override
  void initState() {
    _getPeriodoInfo();
    super.initState();
  }

  void _getPeriodoInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var periodo = localStorage.getString('periodo');
    var pL = json.decode(periodo);
    print(pL);
    setState(() {
      periodoNombre = pL['nombre'];
    });
  }

  bool _pressed = false;
  void onPressedPeriodo() {
    setState(() {
      _pressed = !this._pressed;
    });
    SimpleDialog(
      title: const Text('Select assignment'),
    );

    /*
    Scaffold.of(context).showSnackBar(SnackBar(
        content: this._pressed
            ? Text("Agregaste a tus Favoritos")
            : Text("Quitaste de tus Favoritos")));*/
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.0, left: 20.0),
      height: 30.0,
      child: RaisedButton(
        onPressed: onPressedPeriodo,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.teal],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              periodoNombre ?? 'Periodo L',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
