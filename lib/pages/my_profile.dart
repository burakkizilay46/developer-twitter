import 'package:dev_commit/model/post_model.dart';
import 'package:dev_commit/pages/custom_widgets/custom_commit_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "ulascanimoglu" * 100,
                    textScaleFactor: 0.75,
                    style: GoogleFonts.alegreya(),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 100),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/images/user.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Divider(thickness: 3),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: ListView.builder(itemBuilder: ((context, index) {
              return CustomCard(
                post: Post(),
              );
            })),
          ),
        ],
      ),
    );
  }
}
