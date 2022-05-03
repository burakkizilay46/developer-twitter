
import 'package:dev_commit/pages/add_commit.dart';
import 'package:dev_commit/pages/custom_widgets/custom_commit_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'hamburger_menu.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () {
          Get.to(AddCommitView());
        },
        child: Icon(Icons.flutter_dash),
      ),
      drawer: HamburgerMenu(),
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: ListView.builder(
            itemBuilder: ((context, index) {
              return CustomCommitCardView();
            }),
          ),
        ),
      ),
    );
  }
}
