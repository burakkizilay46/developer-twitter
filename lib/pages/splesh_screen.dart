import 'package:dev_commit/pages/authentication/login_page.dart';
import 'package:dev_commit/pages/home_page.dart';
import 'package:dev_commit/shared/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SpleshScreenView extends StatefulWidget {
  const SpleshScreenView({Key? key}) : super(key: key);

  @override
  State<SpleshScreenView> createState() => _SpleshScreenViewState();
}

class _SpleshScreenViewState extends State<SpleshScreenView> {
  @override
  void initState() {
    
    super.initState();
    Future.delayed(const Duration(seconds: 5), () async {
      SharedPrefs.getIsLogin == true
          ? Get.off(const HomePageView())
          : Get.off(const LoginPageView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/tech.json'),
            Text(
              'Developer Commit',
              style: GoogleFonts.nunito(fontSize: 35),
            ),
          ],
        ),
      ),
    );
  }
}
