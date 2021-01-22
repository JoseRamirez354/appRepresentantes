import 'dart:convert';

import 'package:app_repre/Vistas/login.dart';
import 'package:app_repre/utilidades/api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logout extends StatefulWidget {
  @override
  _Logout createState() => _Logout();
}

class _Logout extends State<Logout> {
  @override
  void initState() {
    logout();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
    );
  }

  Future<void> logout() async {
    // logout from the server ...
    var res = await CallApi().getData('logout');
    var body = json.decode(res.body);
    print(body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}
