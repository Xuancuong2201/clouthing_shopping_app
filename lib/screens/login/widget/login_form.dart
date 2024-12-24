import 'package:ex/dependecy_injection/setup.dart';
import 'package:ex/repository/repo_firebase.dart';
import 'package:ex/viewmodel/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/text_config.dart';
import '../../../global_functions.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm(loginViewmodel, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late final LoginViewmodel loginViewmodel;

  @override
  void initState() {
    super.initState();
    loginViewmodel = getIt<LoginViewmodel>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TextConfig.email,
              style: GoogleFonts.roboto(
                textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )),
          const Padding(padding: EdgeInsets.all(2)),
          TextFormField(
            controller: _emailController,
            onChanged: (value) {
              setState(() {
                loginViewmodel.email = value;
              });
            },
            decoration: InputDecoration(
              hintText: TextConfig.enterEmail,
              hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.grey, width: 2)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: isValidEmail(loginViewmodel.email)
                      ? Colors.green
                      : Colors.black12,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: isValidEmail(loginViewmodel.email)
                      ? Colors.green
                      : Colors.black12,
                  width: 2,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: getIconForEmail(loginViewmodel.email),
              ),
              errorText: loginViewmodel.email.isEmpty ||
                  isValidEmail(loginViewmodel.email)
                  ? null
                  : 'Invalid email address',
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(TextConfig.password,
              style: GoogleFonts.roboto(
                textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )),
          const Padding(padding: EdgeInsets.all(2)),
          TextFormField(
            controller: _passwordController,
            onChanged: ((value) {
              setState(() {
                loginViewmodel.password = value;
              });
            }),
            decoration: InputDecoration(
                hintText: TextConfig.enterPassword,
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.grey, width: 2)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: isValidPassword(loginViewmodel.password)
                        ? Colors.green
                        : Colors.black12,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: isValidPassword(loginViewmodel.password)
                        ? Colors.green
                        : Colors.black12,
                    width: 2,
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: getIconForPassword(loginViewmodel.password),
                ),
                errorText: isValidPassword(loginViewmodel.password) ||
                    loginViewmodel.password.isEmpty
                    ? null
                    : 'Invalid password'),
          ),
          const Padding(padding: EdgeInsets.all(6)),
          Row(
            children: [
              const Text(
                TextConfig.forgotPassword,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              TextButton(
                  onPressed: () {
                    context.push('/forgotpassword');
                  },
                  child: Text.rich(
                    TextSpan(
                      text: TextConfig.resetPassword,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: 28,
          ),
          ElevatedButton(
            onPressed: () {
              if (getValidButton(
                  loginViewmodel.email, loginViewmodel.password)) {
                loginViewmodel.login(
                    loginViewmodel.email, loginViewmodel.password);
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: getValidButton(
                    loginViewmodel.email, loginViewmodel.password)
                    ? Colors.black
                    : Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                fixedSize: Size(MediaQuery
                    .of(context)
                    .size
                    .width, 60)),
            child: const Text(
              TextConfig.login,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

Widget? getIconForEmail(String email) {
  if (email.isNotEmpty && !isValidEmail(email)) {
    return Image.asset(
      'assets/IconInvalid.png', // Ảnh thành công
      height: 24,
      width: 24,
    );
  } else if (isValidEmail(email)) {
    return Image.asset(
      'assets/IconValid.png', // Ảnh thành công
      height: 24,
      width: 24,
    );
  } else {
    return null;
  }
}

bool getValidButton(String email, String password) =>
    isValidEmail(email) && isValidPassword(password);

Widget? getIconForPassword(String password) {
  if (password.isNotEmpty && !isValidPassword(password)) {
    return Image.asset(
      'assets/IconInvalid.png', // Ảnh thành công
      height: 24,
      width: 24,
    );
  } else if (isValidPassword(password)) {
    return Image.asset(
      'assets/IconValid.png', // Ảnh thành công
      height: 24,
      width: 24,
    );
  } else {
    return null;
  }
}
