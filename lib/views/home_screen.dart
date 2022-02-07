import 'package:flutter/material.dart';
import 'package:news_app/utils/reusable_widgets/card_30x20.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:news_app/utils/reusable_widgets/discovery_card.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "News+",
          style: TextStyle(
              color: Colors.black, fontSize: 21, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_rounded,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 20),
              child: Text("Featured",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 240,
              // height: double.maxFinite,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) => Card30x20(),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 5);
                },
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Discovery",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 400,
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              // height: double.maxFinite,
              child: GridView.custom(
                shrinkWrap: true,
                gridDelegate: SliverWovenGridDelegate.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  pattern: [
                    WovenGridTile(1),
                    WovenGridTile(
                      5 / 7,
                      crossAxisRatio: 0.9,
                      alignment: AlignmentDirectional.centerEnd,
                    ),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) => DiscoveryCard(),
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),

          ],
        ),
      ),
    );
  }
}
