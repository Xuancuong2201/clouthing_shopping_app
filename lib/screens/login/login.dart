
import 'package:ex/repository/repo_firebase.dart';
import 'package:ex/screens/login/widget/LoginWithFacebook.dart';
import 'package:ex/screens/login/widget/LoginWithGoogle.dart';
import 'package:ex/screens/login/widget/login_form.dart';
import 'package:ex/viewmodel/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/text_config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  late LoginViewmodel loginViewmodel;
  @override
  void initState() {
    super.initState();
    loginViewmodel= LoginViewmodel(RepoFirebase());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 35.0, left: 22.0, right: 22.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TextConfig.headerLogin,
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Text(TextConfig.sousTitreLogin,
                    style: GoogleFonts.lato(
                        textStyle:
                        const TextStyle(fontSize: 18, color: Colors.grey))),
                const SizedBox(height: 30),

                LoginForm(loginViewmodel),        //Form login

                const SizedBox(height: 25),
                const Row(
                  children: [
                    Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                    ),
                    Text(
                      TextConfig.or,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                    ),
                    Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                LoginWithGoogle(),                                                //Login With Google
                const Padding(padding: EdgeInsets.all(8)),
                LoginWithFacebook(),                                              //Login With Facebook
                // const Spacer(),
                // const Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(TextConfig.questionNewAccount),
                //       Text.rich(
                //         TextSpan(
                //           text: TextConfig.join,
                //           style: TextStyle(
                //             fontSize: 15,
                //             color: Colors.black,
                //             fontWeight: FontWeight.w500,
                //             decoration: TextDecoration.underline,
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                const Padding(padding: EdgeInsets.all(10))
              ],
            ),
          ),
        ));
  }
}



