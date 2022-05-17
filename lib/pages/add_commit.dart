import 'package:dev_commit/model/post_model.dart';
import 'package:dev_commit/service/firebase_post_service.dart';
import 'package:dev_commit/shared/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCommitView extends StatelessWidget {
  final TextEditingController _commitController = TextEditingController();

  AddCommitView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addCommitAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customCommitTextField(),
            const SizedBox(
              height: 15,
            ),
            addCommitTextField()
          ],
        ),
      ),
    );
  }

  AppBar addCommitAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Add Commit',
        style: GoogleFonts.aBeeZee(),
      ),
    );
  }

  SizedBox addCommitTextField() {
    return SizedBox(
      width: 120,
      height: 36,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(), primary: Colors.cyan),
          onPressed: () {
            addCommit(_commitController.text);
            _commitController.clear();
          },
          child: Text(
            'Commit',
            style: GoogleFonts.aBeeZee(),
          )),
    );
  }

  Container customCommitTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _commitController,
        textInputAction: TextInputAction.next,
        style: GoogleFonts.aBeeZee(),
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.person,
            color: Colors.cyan,
            size: 30,
          ),
          hintText: 'Commit Message',
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

  Future<void> addCommit(String _commitMessage) async {
    Post newPost = Post();
    newPost.ownerId = SharedPrefs.getUserId;
    newPost.postId = 22;
    newPost.postTitle = _commitMessage.toString();
    await FirebasePostService().addPost(newPost).then((value) {
      Get.back(result: value);
    });
  }
}
