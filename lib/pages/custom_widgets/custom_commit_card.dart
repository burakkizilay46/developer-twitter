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
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
                //Icon(Icons.account_circle, size: 45),
                const SizedBox(width: 15),
                Text(
                  "whoiselonmusk",
                  style: GoogleFonts.raleway(),
                ),
              ],
            ),
            const SizedBox(height: 10),
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
                    icon: const Icon(
                      Icons.favorite,
                    ))),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
