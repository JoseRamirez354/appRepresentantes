import 'package:app_repre/utilidades/menu_inferior.dart';
import 'package:app_repre/utilidades/menu_principal.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'User/bloc/bloc_user.dart';
import 'Vistas/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    // check if token is there
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    /*
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _isLoggedIn ? PlatziTrips() : LoginPage(),
      ),
    );
  }
  */
    return BlocProvider(
        child: MaterialApp(
          title: 'Flutter Demo',
          home: Scaffold(
            body: _isLoggedIn ? PlatziTripsCupertino() : LoginPage(),
          ),
        ),
        bloc: UserBloc());
  }
}
