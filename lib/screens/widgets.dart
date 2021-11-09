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
              // title ?? 'unnamed task',
              (title == null) ? 'unnamed task' : title,
              style: TextStyle(
                color: Color(0xFF960440),
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                // desc ?? "no desc added",
                (desc == null) ? 'unnamed task' : desc,
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

class TodoWidget extends StatelessWidget {
  final String text;
  final bool isDone;

  //constructor
  TodoWidget({required this.text, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 8.0,
      ),
      child: Row(
        children: [
          Container(
              width: 24.0,
              height: 24.0,
              margin: EdgeInsets.only(
                right: 12.0,
              ),
              decoration: BoxDecoration(
                  color: isDone ? Color(0xFFE70061) : Colors.transparent,
                  borderRadius: BorderRadius.circular(6.0),
                  border: isDone
                      ? null
                      : Border.all(
                          color: Color(0xFFAA6481),
                          width: 1.5,
                        )),
              child: Image(
                image: AssetImage('assets/images/check_icon.png'),
              )),
          Text(
            text ?? '(unnamed todo)',
            style: TextStyle(
              color: isDone ? Color(0xFF960440) : Color(0xFFB59DA7),
              fontSize: 16.0,
              fontWeight: isDone ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
