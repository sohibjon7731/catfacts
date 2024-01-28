import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  var text_box = Hive.box("text");

  var data_box = Hive.box("data");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
        backgroundColor: const Color(0xFF131524),
        title: const Text(
          "History",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(25),
            ),
            padding: EdgeInsets.all(10),
            width: double.infinity,
            margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text(text_box.values.toList()[index]),
                SizedBox(
                  height: 5,
                ),
                Text(changeDate(data_box.values.toList()[index])),
              ],
            ),
          );
        },
        itemCount: text_box.values.toList().length,
      ),
    );
  }
}

String changeDate(String data) {
  DateTime inputDate = DateTime.parse(data);

  String formattedDate = DateFormat('dd MMMM yyyy').format(inputDate);
  return formattedDate;
}
