import 'package:ex/config/text_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<StatefulWidget> createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        padding: EdgeInsets.only(top: 35, left: 20, right: 20),
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: Offset(-12, 0),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
                iconSize: 30,
                onPressed: () {
                  context.pop();
                },
              ),
            ),
            Text(
              'Forgot password',
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              )),
            ),
            Text(
              'Enter your email for the verification process.\nWe will send 4 digits code to your email.',
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(fontSize: 15, color: Colors.grey)),
            ),
            SizedBox(height: 10),
            Text(
              TextConfig.email,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  hintText: TextConfig.enterEmail,
                  hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1))
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 50),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),),
                  child: const Text(
                    'Send code',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,)
          ],
        ),
      ),
    );
  }
}
