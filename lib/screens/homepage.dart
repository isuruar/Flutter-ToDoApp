import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 22.0),
        color: Color(0xFFFE5E4E3),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(
                      bottom: 32.0,
                    ),
                    child: Image(image: AssetImage('assets/images/logo.png'))),
                TaskCardWidget(
                  title: "Get started",
                  desc: 'Hello how are you doing?',
                ),
              ],
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFe80061),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Image(
                    image: AssetImage(
                  "assets/images/add_icon.png",
                )),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
