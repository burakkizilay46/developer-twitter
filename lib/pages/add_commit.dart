import 'package:dev_commit/model/post_model.dart';
import 'package:dev_commit/pages/authentication/widgets/custom_text_field.dart';
import 'package:dev_commit/pages/home_page.dart';
import 'package:dev_commit/service/firebase_post_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCommitView extends StatelessWidget {
  TextEditingController _commitController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Commit',
          style: GoogleFonts.aBeeZee(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _commitController,
                textInputAction: TextInputAction.next,
                style: GoogleFonts.aBeeZee(),
                decoration: InputDecoration(
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
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 120,
              height: 36,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(), primary: Colors.cyan),
                  onPressed: () {
                    addCommit(_commitController.text);
                    _commitController.clear();
                  },
                  child: Text(
                    'Commit',
                    style: GoogleFonts.aBeeZee(),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future<void> addCommit(String _commitMessage) async {
    Post newPost = Post();
    newPost.ownerId = 2;
    newPost.postId = 22;
    newPost.postTitle = _commitMessage.toString();
    await FirebasePostService().addPost(newPost).then((value) {
      Get.back(result: value);
    });
  }
}
