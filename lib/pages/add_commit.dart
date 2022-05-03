
import 'package:dev_commit/pages/authentication/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCommitView extends StatelessWidget {
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
            CustomTextFormField(customHintText: 'Commit Message'),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 120,
              height: 36,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(), primary: Colors.cyan),
                  onPressed: () {},
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
}
