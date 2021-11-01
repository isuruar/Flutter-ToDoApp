import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String title;
  final String desc;
  TaskCardWidget({required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
        margin: EdgeInsets.only(
          bottom: 20.0,
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'To Do App',
              style: TextStyle(
                color: Color(0xFF960440),
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                desc ?? "no desc added",
                style: TextStyle(
                  color: Color(0xFF8628290),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ));
  }
}
