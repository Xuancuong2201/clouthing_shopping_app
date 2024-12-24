import 'package:ex/interact/authentication.dart';
import 'package:ex/repository/repo_firebase.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewmodel {
  late String email ="";
  late String  password="";
  final Authentication authentication;
  LoginViewmodel(this.authentication);

  login(String email,String password){
    authentication.login(email, password);
  }
}
