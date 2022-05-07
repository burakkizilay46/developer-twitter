import 'package:dev_commit/pages/authentication/login_page.dart';
import 'package:dev_commit/pages/home_page.dart';
import 'package:dev_commit/shared/shared_prefs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPrefs.initalize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home:
            SharedPrefs.getIsLogin == true ? HomePageView() : LoginPageView());
  }
}
