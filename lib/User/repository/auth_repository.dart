import 'package:app_repre/User/repository/auth_user.dart';

class AuthRepository {
  final _authUser = AuthUser();
  cargarUsuario() => _authUser.cargarUsuario();
  /*
  void updateUserDataFirestore(User user) =>
      _authUser.updateUserData(user);*/
}
