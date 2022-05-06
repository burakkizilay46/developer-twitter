
import 'package:dev_commit/pages/authentication/login_page.dart';
import 'package:dev_commit/pages/my_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.grey[725],
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey[900],
            ),
            child: Stack(
              children: <Widget>[
                const Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Burak Kızılay',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight + const Alignment(0, .3),
                  child: const Text(
                    'Flutter Developer',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () => Get.to( MyProfileView()),
            child: Align(
              child: ListTile(
                leading: const Icon(Icons.account_circle, size: 36),
                title: Text("PROFILE",
                    style: GoogleFonts.raleway(
                        textStyle: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(fontWeight: FontWeight.w500))),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan,
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                Get.offAll(const LoginPageView());
              },
              child: Text('Çıkış Yap',
                  style: GoogleFonts.raleway(
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(fontWeight: FontWeight.w500))),
            ),
          )
        ],
      ),
    );
  }
}
