import 'package:flutter/material.dart';

class DiscoveryCard extends StatelessWidget {
  const DiscoveryCard({Key? key,
    this.color = Colors.green, this.title = "News"}) : super(key: key);
  final color;
  final title;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 10,
      // width: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: color[100],
              shape: BoxShape.rectangle,
            ),
            child: Center(child: Text(title.toString().substring(0,1))),
          )
        ],
      ),
    );
  }
}
