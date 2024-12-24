import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/text_config.dart';

class LoginWithFacebook extends StatelessWidget {
  const LoginWithFacebook({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Image.asset('assets/IconFacebook.png'),
      onPressed: () { debugPrint("Dang dang nhap voi facebook");},
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          fixedSize: Size(MediaQuery
              .of(context)
              .size
              .width, 60)),
      label: const Text(
        TextConfig.loginWithFacebook,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white),
      ),
    );
  }
}