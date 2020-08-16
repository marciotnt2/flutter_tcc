import 'package:firebase_auth/firebase_auth.dart';

class UserGmail {
  static final UserGmail _singleton = UserGmail._internal();
  FirebaseUser user;
  factory UserGmail() {
    return _singleton;
  }

  UserGmail._internal();
}
