import 'dart:convert';

import 'package:app_repre/Vistas/login.dart';
import 'package:app_repre/modelos/mensajes.dart';
import 'package:flutter/material.dart';
import '../modelos/modeloMensaje.dart';
import 'api.dart';

class ListaMensajes extends StatefulWidget {
  @override
  _ListaMensajes createState() => new _ListaMensajes();
}

class _ListaMensajes extends State<ListaMensajes> {
  Future<dynamic> cargarMensajes() async {
    var res = await CallApi().getData('mensajes');
    var body2 = json.decode(res.body);
    if (body2['success']) {
      MensajesList mensajeslista = MensajesList.fromJson(body2['mensajes']);
      return mensajeslista.mensajesL;
    } else {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 280),
      child: new FutureBuilder<dynamic>(
        future: cargarMensajes(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new Center(
                  //child: Text(snapshot.data[0].nombre)
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: VistaMensaje(
                            "assets/" + snapshot.data[index].cargo + ".png",
                            snapshot.data[index].nombres +
                                ' ' +
                                snapshot.data[index].apellidos,
                            snapshot.data[index].cargo,
                            snapshot.data[index].razon.length > 25
                                ? snapshot.data[index].razon.substring(0, 25)
                                : snapshot.data[index].razon),
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
