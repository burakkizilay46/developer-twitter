import 'package:dev_commit/constants/firebase_constants.dart';
import 'package:dev_commit/model/user_model.dart';
import 'package:dev_commit/pages/authentication/register_page.dart';
import 'package:dev_commit/pages/home_page.dart';
import 'package:dev_commit/service/firebase_auth_service.dart';
import 'package:dev_commit/shared/shared_prefs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
bool isLogin = false;
late String userId;

class LoginPageView extends StatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

@override
class _LoginPageViewState extends State<LoginPageView> {
  @override
  void initState() {
    super.initState();
    isLogin = SharedPrefs.getIsLogin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 144),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Image.asset("assets/images/login_logo.png"),
          ),
          const SizedBox(height: 30),
          _emailContainer(),
          const SizedBox(height: 15),
          _passwordContainer(),
          const SizedBox(height: 10),
          const SizedBox(height: 36),
          SizedBox(
            width: 180,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                  shape: const StadiumBorder(),
                ),
                onPressed: () async {
                  bool isDone = false;
                  isDone = await AuthService()
                      .logIn(_emailController.text, _passwordController.text)
                      .then((value) {
                    return value;
                  });
                  if (isDone == true) {
                    isLogin = true;
                    print(isLogin.toString());
                    userId = await AuthService().inputData();
                    SharedPrefs.setisLogin(isLogin);
                    SharedPrefs.setUserId(userId);
                    print(userId);
                    Get.to(HomePageView());
                  } else
                    print("Kullanıcı adı veya şifre yanlış");
                  _emailController.clear();
                  _passwordController.clear();
                },
                child: Text("Login",
                    style: GoogleFonts.aBeeZee(
                      color: Colors.black,
                      fontSize: 18,
                    )),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not yet with us?",
                  style: GoogleFonts.aBeeZee(fontSize: 12, color: Colors.grey)),
              TextButton(
                onPressed: () => Get.off(RegisterView()),
                child: Text(
                  "Register Now!",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 12, color: Colors.grey[200]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container _passwordContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        obscureText: true,
        controller: _passwordController,
        textInputAction: TextInputAction.next,
        style: GoogleFonts.aBeeZee(),
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.cyan,
            size: 30,
          ),
          hintText: "password",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(
                color: Colors.cyan,
              )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.all(Radius.circular(50))),
        ),
      ),
    );
  }

  Container _emailContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: _emailController,
        textInputAction: TextInputAction.next,
        style: GoogleFonts.aBeeZee(),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.mail,
            color: Colors.cyan,
            size: 30,
          ),
          hintText: "mail",
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(
                color: Colors.cyan,
              )),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.all(Radius.circular(50))),
        ),
      ),
    );
  }
}
