
import 'package:dev_commit/pages/authentication/login_page.dart';
import 'package:dev_commit/pages/authentication/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Image.asset("assets/images/login_logo.png"),
            ),
            const SizedBox(height: 10),
            const CustomTextFormField(customHintText: "email"),
            const SizedBox(height: 10),
            const CustomTextFormField(customHintText: "username"),
            const SizedBox(height: 10),
            const CustomTextFormField(customHintText: "password"),
            const SizedBox(height: 36),
            SizedBox(
              width: 180,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {},
                child: Text("Register",
                    style: GoogleFonts.aBeeZee(
                      color: Colors.black,
                      fontSize: 18,
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already with us?",
                    style:
                        GoogleFonts.aBeeZee(fontSize: 12, color: Colors.grey)),
                TextButton(
                  onPressed: () => Get.off(LoginPageView()),
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
}
