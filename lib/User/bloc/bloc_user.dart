import 'package:app_repre/User/model/user.dart';
import 'package:app_repre/User/repository/auth_repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();
  cargarUsuario() {
    _auth_repository.cargarUsuario();
  }

/*
  void updateUserData(User user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);*/
  @override
  void dispose() {
    // TODO: implement dispose
  }
}
