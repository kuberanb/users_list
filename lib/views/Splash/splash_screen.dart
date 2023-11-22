import 'package:brain_wired/views/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> gotoScreen(BuildContext context) async {
    print('Splash Screen Open');
    await Future.delayed(const Duration(milliseconds: 1500));
    print('Home Screen Open');
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: ((context) => const HomeScreen()),
      ),
    );
  }

  @override
  void initState() {
    gotoScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0.45 * screenHeight,
                ),
                Text(
                  'Brain Wired',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 0.06 * screenHeight,
                    letterSpacing: 0.03 * screenWidth,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.lora().fontFamily,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0.35 * screenHeight,
            ),
            const CircularProgressIndicator(
              strokeWidth: 2,
              color: kWhiteColor,
            )
          ],
        ),
      )),
    );
  }
}
