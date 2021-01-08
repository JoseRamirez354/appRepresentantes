import 'dart:convert';

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
    print(body);
    HijosList hijoslist = HijosList.fromJson(body);
    print(hijoslist.hijosL);
    //print("photos " + hijoslist.hijosL[1].nombre);
    return hijoslist.hijosL;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 250),
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
                            snapshot.data[index].seccion),
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
