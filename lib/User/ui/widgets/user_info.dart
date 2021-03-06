import 'package:app_repre/User/model/user.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  User user;
  UserInfo(@required this.user);

  @override
  Widget build(BuildContext context) {
    final userPhoto = Container(
        width: 90.0,
        height: 90.0,
        margin: EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.white, width: 2.0, style: BorderStyle.solid),
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/Administrador.png'))
            //image: NetworkImage(user.photo))
            ));

    final userInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: Text("jose ramirez", //user.nombre,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ))),
        Text("jgrsasda", //user.email,
            style: TextStyle(fontSize: 15.0, color: Colors.white30)),
      ],
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
      child: Row(
        children: <Widget>[userPhoto, userInfo],
      ),
    );
  }
}
