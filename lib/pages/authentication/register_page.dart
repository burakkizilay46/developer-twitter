import 'package:dev_commit/model/user_model.dart';
import 'package:dev_commit/pages/authentication/login_page.dart';
import 'package:dev_commit/pages/authentication/widgets/custom_text_field.dart';
import 'package:dev_commit/service/firebase_auth_service.dart';
import 'package:dev_commit/service/firebase_post_service.dart';
import 'package:dev_commit/service/firebase_user_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

TextEditingController _emailController = TextEditingController();
TextEditingController _usernameController = TextEditingController();
TextEditingController _nameSurnameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            SizedBox(height: 100),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Image.asset("assets/images/login_logo.png"),
            ),
            const SizedBox(height: 10),
            emailTextFormFiled(_emailController),
            const SizedBox(height: 10),
            usernameTextFormField(_usernameController),
            const SizedBox(height: 10),
            nameSurnameTextFormField(_nameSurnameController),
            const SizedBox(height: 10),
            passwordTextFormField(_passwordController),
            const SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyan,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    registerController();
                  },
                  child: Text("Register",
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
                Text("Already with us?",
                    style:
                        GoogleFonts.aBeeZee(fontSize: 12, color: Colors.grey)),
                TextButton(
                  onPressed: () => Get.off(const LoginPageView()),
                  child: Text(
                    "Log in!",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 12, color: Colors.grey[200]),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void registerController() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _usernameController.text.isNotEmpty) {
      AuthService()
          .register(_emailController.text, _passwordController.text)
          .then((value) {
        addUser();
        _emailController.clear();
        _passwordController.clear();
        _usernameController.clear();
        _nameSurnameController.clear();
      });
    } else
      print("Boş Bırakılamaz");
  }

  Future<void> addUser() async {
    User newUser = User();
    newUser.userId = 1;
    newUser.email = _emailController.text;
    newUser.username = _usernameController.text;
    newUser.nameSurname = _nameSurnameController.text;
    newUser.profilePictureUrl =
        "https://avatars.githubusercontent.com/u/7940844?s=88&v=4";
    await FirebasUserService().addUser(newUser).then((value) {
      print("User eklendi!");
    });
  }

  Container passwordTextFormField(TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        style: GoogleFonts.aBeeZee(),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.lock,
            color: Colors.cyan,
            size: 30,
          ),
          hintText: 'password',
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

  Container nameSurnameTextFormField(TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        style: GoogleFonts.aBeeZee(),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.accessibility,
            color: Colors.cyan,
            size: 30,
          ),
          hintText: 'name surname',
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

  Container usernameTextFormField(TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        style: GoogleFonts.aBeeZee(),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.perm_identity,
            color: Colors.cyan,
            size: 30,
          ),
          hintText: 'username',
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

  Container emailTextFormFiled(TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        style: GoogleFonts.aBeeZee(),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.mail,
            color: Colors.cyan,
            size: 30,
          ),
          hintText: 'email',
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
