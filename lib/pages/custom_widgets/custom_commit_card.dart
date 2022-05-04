import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/post_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
                //Icon(Icons.account_circle, size: 45),
                SizedBox(width: 15),
                Text(
                  "whoiselonmusk",
                  style: GoogleFonts.raleway(),
                ),
              ],
            ),
            SizedBox(height: 10),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${post.postTitle}',
                  style: GoogleFonts.aBeeZee(),
                )),
            Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                    ))),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
