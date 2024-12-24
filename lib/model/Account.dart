import 'package:ex/config/unitest.dart';

class Account {
  String email;
  String password;

  Account(this.email, this.password);

  String checkAccount(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      return "Error";
    } else if (email == UniTest.account && password == UniTest.password) {
      return 'Success';
    } else {
      return "Null";
    }
  }
}
