import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/utils/reusable_widgets/card_30x20.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:news_app/utils/reusable_widgets/discovery_card.dart';
import 'package:news_app/utils/reusable_widgets/news_details.dart';
import 'package:news_app/utils/service/network_service.dart';
import 'dart:math' as math;

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
        child: FutureBuilder<Map<String, dynamic>>(
            future: getNews(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
               var data = snapshot.data;
               print("what is returned $data");
                return Column(
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
                        itemBuilder: (context, index) {
                          var feature = data!['articles'][index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewsDetails(
                                        title: feature['title'],
                                      description: feature['description'],
                                      date: feature['publishedAt'],
                                        image: feature['urlToImage'],
                                        source: feature['source']["name"],)));
                            },
                            child: Card30x20(
                              source: feature['source']['name'],
                              description: feature['description'],
                              title: feature['title'],
                              image: feature['urlToImage'],
                              date: feature['publishedAt'],
                              tagColor: getColor(),
                            ));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 10);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("Discovery",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
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
                            WovenGridTile(3 / 3.5),
                            WovenGridTile(
                              0.9,
                              crossAxisRatio: 0.9,
                              alignment: AlignmentDirectional.centerEnd,
                            ),
                          ],
                        ),
                        childrenDelegate: SliverChildBuilderDelegate(
                            (context, index) {
                              var discover = data!['articles'][index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NewsDetails(
                                              title: discover['title'],
                                              description: discover['description'],
                                              source: discover['source']["name"],
                                            date: discover['publishedAt'],
                                            image: discover['urlToImage'],
                                          )));
                                },
                                child: DiscoveryCard(
                                  description: discover['description'],
                                  title: discover['title'],
                                  color: getColor(),
                                ));
                            },
                            childCount: data!['articles'].length),
                      ),
                    ),
                    // SizedBox(
                    //   height: 35,
                    // ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Something went wrong'),
                );
              } else {
                return Center(child: CircularProgressIndicator.adaptive());
              }
            }),
      ),
    );
  }
}

getColor(){
  // return Color((math.Random().nextDouble() * 0xFFFFFF).toInt());
  return Colors.primaries[Random().nextInt(Colors.primaries.length)];
}
