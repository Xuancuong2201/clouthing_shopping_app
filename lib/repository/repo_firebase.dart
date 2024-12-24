import 'package:ex/interact/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


@Injectable(as:Authentication)
class RepoFirebase implements Authentication {
  @override
  void login(String account, String password) {
    debugPrint("Dang dang nhap.....\n Tai khoan :$account \n Password : $password");
  }

}