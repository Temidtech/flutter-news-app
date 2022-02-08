import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:intl/intl.dart';

class Card30x20 extends StatelessWidget {
  Card30x20(
      {Key? key,
      this.source = "Time",
      this.date = "February 2021",
      this.tagColor = Colors.blueGrey,
      this.title = 'Title',
      this.description = 'Description sfgsdfgsdfgdsfsdfgsffdsgdg',
      this.image = "https://picsum.photos/200/300"})
      : super(key: key);
  final source;
  String date;
  final tagColor;
  final title;
  final description;
  final image;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFor = DateFormat.yMMMM();
    DateTime dateTime = DateTime.parse(date);
    date = dateFor.format(dateTime);
    // print("this date $date");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          height: 170,
          width: 120,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.3)),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                top: 60,
              ),
              Positioned(
                child: Container(
                    width: 100,
                    padding: EdgeInsets.all(3),
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.3)),
                    child: Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
                top: 110,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            date,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: tagColor,
                  shape: BoxShape.rectangle,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 100,
                  child: Text(
                source,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
            ],
          ),
        ),
      ],
    );
  }
}
