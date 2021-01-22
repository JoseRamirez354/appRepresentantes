import 'dart:convert';

import 'package:app_repre/Vistas/login.dart';
import 'package:app_repre/modelos/hijos.dart';
import 'package:app_repre/utilidades/api.dart';
import 'package:app_repre/utilidades/card_hijo.dart';
import 'package:flutter/material.dart';

class ListadeHijos extends StatefulWidget {
  @override
  _ListadeHijos createState() => new _ListadeHijos();
}

class _ListadeHijos extends State<ListadeHijos> {
  Future<dynamic> cargarHijos() async {
    var res = await CallApi().getData('hijos');
    var body = json.decode(res.body);
    if (body['success']) {
      //print(body);
      HijosList hijoslist = HijosList.fromJson(body['hijos']);
      //print(body['hijos']);
      return hijoslist.hijosL;
    } else {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 270),
      child: new FutureBuilder<dynamic>(
        future: cargarHijos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new Center(
                  //child: Text(snapshot.data[0].nombre)
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: CardHijo(
                            snapshot.data[index].sexo == 'Femenino'
                                ? "assets/est_mujer.jpg"
                                : "assets/est_hombre.jpg",
                            snapshot.data[index].nombre,
                            snapshot.data[index].apellido,
                            snapshot.data[index].seccion,
                            snapshot.data[index].paralelo != null
                                ? snapshot.data[index].paralelo
                                : '',
                            snapshot.data[index].especializacion != null
                                ? snapshot.data[index].especializacion
                                : ''),
                      );
                    },
                  ),
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
