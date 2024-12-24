import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/text_config.dart';

class LoginWithGoogle extends StatelessWidget {
  const LoginWithGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Image.asset('assets/IconGoogle.png'),
      onPressed: () {debugPrint("Dang dang nhap voi google");},
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          fixedSize: Size(MediaQuery
              .of(context)
              .size
              .width, 60)),
      label: const Text(
        TextConfig.loginWithGoogle,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black),
      ),
    );
  }
}