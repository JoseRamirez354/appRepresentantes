import 'package:flutter/material.dart';

class BotonMas extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BotonMas();
    throw UnimplementedError();
  }
}

class _BotonMas extends State<BotonMas> {
  bool _pressed = false;
  void onPressedFav() {
    setState(() {
      _pressed = !this._pressed;
    });
    Scaffold.of(context).showSnackBar(SnackBar(
        content: this._pressed
            ? Text("Agregaste a tus Favoritos")
            : Text("Quitaste de tus Favoritos")));
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green,
      mini: true,
      tooltip: "Fav",
      onPressed: onPressedFav,
      child: Icon(this._pressed ? Icons.favorite : Icons.add),
    );
  }
}
