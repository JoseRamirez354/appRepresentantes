import 'dart:convert';

import 'package:app_repre/Vistas/home.dart';
import 'package:app_repre/Vistas/login.dart';
import 'package:app_repre/Vistas/logout.dart';
import 'package:app_repre/Vistas/search.dart';
import 'package:app_repre/utilidades/api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlatziTrips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlatziTrips();
    throw UnimplementedError();
  }
}

class _PlatziTrips extends State<PlatziTrips> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [MyHomePage(), SearchTrips(), Logout()];

  void onTapeTapped(int index) {
    if (index == 2) {
      logout();
    }
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.indigo,
        ),
        child: BottomNavigationBar(
            onTap: onTapeTapped,
            currentIndex: indexTap,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), title: Text("")),
              BottomNavigationBarItem(icon: Icon(Icons.logout), title: Text(""))
            ]),
      ),
    );
  }

  void logout() async {
    var res = await CallApi().getData('logout');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}
