import 'package:flutter/material.dart';

class DiscoveryCard extends StatelessWidget {
  const DiscoveryCard(
      {Key? key,
      this.color = Colors.green,
      this.title = "News",
      this.description = "Breaking News,Latest"})
      : super(key: key);
  final color;
  final title;
  final description;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 10,
      // width: 10,
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: color[400],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(7)),
              child: Center(
                child: Text(title.toString().substring(0, 1),
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 45,
              width: 160,
              child: Text(title, overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            SizedBox(
              height: 15,
              // width: 160,
            ),
            Text(description,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(fontSize: 12, color: Colors.white))
          ],
        ),
      ),
    );
  }
}
