import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/views/home_screen.dart';

class NewsDetails extends StatelessWidget {
  NewsDetails({Key? key, this.title = "Title",
    this.description = " Description", this.source = "NBC", this.date = "Feb 2022"})
      : super(key: key);
  final title;
  final description;
  final source;
  String date;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFor = DateFormat.yMMMMd();
    DateTime dateTime = DateTime.parse(date);
    date = dateFor.format(dateTime);
    print("this date $date");
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        backgroundColor: getColor(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(description,
                  style: TextStyle(fontSize: 14)),
              SizedBox(
                height: 100,
              ),
              Text("Source: $source.",
                  style: TextStyle(fontSize: 11)),
             Text("$date.",
                  style: TextStyle(fontSize: 11)),
            ],
          ),
        ),
      ),
    );
  }
}
