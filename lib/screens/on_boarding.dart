
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: 120,
              child: Image.asset(
                'assets/Curve_Grey.png',
              ),
            ),
            Positioned(
              top: 40,
              left: 15,
              child: Text(
                'Define \nyourself in \nyour unique \nway.',
                style: GoogleFonts.abhayaLibre(fontSize: 55, height: 0.8),
              ),
            ),
            Positioned(
              top: 40,
              left: 15,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset('assets/Person.png'),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    padding: const EdgeInsets.all(20),
                    height: 100,
                    color: Colors.white,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ElevatedButton.icon(
                        label: const Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        icon: const Icon(
                          Icons.ac_unit_sharp,
                          color: Colors.white,
                        ),
                        onPressed: () {context.go('/login');},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, //Màu nền của nút
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
