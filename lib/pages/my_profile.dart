import 'package:dev_commit/model/post_model.dart';
import 'package:dev_commit/pages/custom_widgets/custom_commit_card.dart';
import 'package:dev_commit/service/firebase_post_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

late TabController tabController;

class MyProfileView extends StatefulWidget {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              child: Column(
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
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "developertwitter" * 100,
                              textScaleFactor: 0.75,
                              style: GoogleFonts.alegreya(),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 100),
                            child: Column(
                              children: const [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                      'https://avatars.githubusercontent.com/u/7940844?s=88&v=4'),
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
                ],
              ),
            ),
            tabBarPadding(context),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  Center(
                    child:
                        Container(child: Text('Henüz Commit Bulunmamaktadır')),
                  ), //myCommitsWidget()),
                  Center(
                    child:
                        Container(child: Text('Henüz Commit Bulunmamaktadır')),
                  ) //myCommitsWidget()),
                ],
              ),
            ),
          ],
        ));
  }

  Widget myCommitsWidget() {
    return FutureBuilder(
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
    );
  }
}

Padding tabBarPadding(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 8, right: 2, top: 6),
    child: tabBarContainer(context),
  );
}

SizedBox tabBarContainer(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.06,
    child: Column(
      children: [
        // SizedBox(height: 3,),
        DefaultTabController(
          length: 2,
          child: tabBar(context),
        ),
      ],
    ),
  );
}

TabBar tabBar(BuildContext context) {
  return TabBar(
    controller: tabController,
    tabs: [
      Column(
        children: [
          Icon(Icons.person),
          Text("My Commits", style: GoogleFonts.aBeeZee())
        ],
      ),
      Column(
        children: [
          Icon(Icons.favorite),
          Text("My Favorites", style: GoogleFonts.aBeeZee())
        ],
      ),
    ],
  );
}

/*
SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(itemBuilder: ((context, index) {
                return CustomCard(
                  post: Post(),
                );
              })),
            ), 
*/
