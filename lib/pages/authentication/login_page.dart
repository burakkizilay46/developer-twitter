
import 'package:dev_commit/pages/authentication/register_page.dart';
import 'package:dev_commit/pages/authentication/widgets/custom_text_field.dart';
import 'package:dev_commit/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Image.asset("assets/images/login_logo.png"),
          ),
          SizedBox(height: 30),
          CustomTextFormField(customHintText: "username"),
          SizedBox(height: 15),
          CustomTextFormField(customHintText: "password"),
          SizedBox(height: 10),
          Text("Forgot your login or password?",
              style: GoogleFonts.aBeeZee(fontSize: 12, color: Colors.grey)),
          SizedBox(height: 36),
          SizedBox(
            width: 180,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan,
                shape: StadiumBorder(),
              ),
              onPressed: ()=> Get.to(HomePageView()),
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
