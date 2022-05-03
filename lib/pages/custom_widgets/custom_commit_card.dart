import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCommitCardView extends StatefulWidget {
  @override
  State<CustomCommitCardView> createState() => _CustomCommitCardViewState();
}

class _CustomCommitCardViewState extends State<CustomCommitCardView> {
  bool isClicked = false;

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
                Text("whoiselonmusk" ,style: GoogleFonts.raleway(),),
              ],
            ),
            SizedBox(height: 10),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Everything is Widget Bro!" ,style: GoogleFonts.aBeeZee(),)),
            Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    isClicked = !isClicked;
                    setState(() {});
                  },
                  icon: Icon(Icons.favorite,
                      color: isClicked ? Colors.red : Colors.grey),
                )),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
