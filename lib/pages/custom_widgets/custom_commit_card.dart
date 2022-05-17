import 'package:dev_commit/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/post_model.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Column(
          children: [
            UserInfo(),
            const SizedBox(height: 10),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${widget.post.postTitle}',
                  style: GoogleFonts.aBeeZee(),
                )),
            Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    isClicked = !isClicked;
                    setState(() {});
                  },
                  icon: Icon(Icons.favorite,
                      color: isClicked == false ? Colors.grey : Colors.red),
                )),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
              'https://avatars.githubusercontent.com/u/7940844?s=88&v=4'),
        ),
        //Icon(Icons.account_circle, size: 45),
        const SizedBox(width: 15),
        Text(
          "username",
          style: GoogleFonts.raleway(),
        ),
      ],
    );
  }
}
