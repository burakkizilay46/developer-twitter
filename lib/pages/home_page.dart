import 'package:dev_commit/pages/add_commit.dart';
import 'package:dev_commit/pages/custom_widgets/custom_commit_card.dart';
import 'package:dev_commit/service/firebase_post_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/post_model.dart';
import 'hamburger_menu.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  bool haveChanged = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () => getToCommitScreen(),
        child: const Icon(Icons.flutter_dash),
      ),
      drawer: const HamburgerMenu(),
      appBar: AppBar(),
      body: Center(
          child: FutureBuilder(
        future: FirebasePostService().getPost(),
        builder: (context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.data != null) {
            var posts = snapshot.data;
            return ListView.builder(
              itemCount: posts?.length,
              itemBuilder: ((context, index) {
                Post post = posts![index];
                return CustomCard(post: post);
              }),
            );
          } else if (snapshot.hasError) {
            print("HATA: ${snapshot.error}");
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      )),
    );
  }

  Future<void> getToCommitScreen() async {
    var data = await Get.to(AddCommitView());
    print(data);
    if (data == true) {
      setState(() {});
    } else
      print("False geldi abi");
  }
}
