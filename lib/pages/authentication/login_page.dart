
import 'package:dev_commit/pages/authentication/register_page.dart';
import 'package:dev_commit/pages/authentication/widgets/custom_text_field.dart';
import 'package:dev_commit/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Image.asset("assets/images/login_logo.png"),
          ),
          const SizedBox(height: 30),
          const CustomTextFormField(customHintText: "username"),
          const SizedBox(height: 15),
          const CustomTextFormField(customHintText: "password"),
          const SizedBox(height: 10),
          Text("Forgot your login or password?",
              style: GoogleFonts.aBeeZee(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 36),
          SizedBox(
            width: 180,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan,
                shape: const StadiumBorder(),
              ),
              onPressed: ()=> Get.to(const HomePageView()),
              child: Text("Login",
                  style: GoogleFonts.aBeeZee(
                    color: Colors.black,
                    fontSize: 18,
                  )),
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
}
