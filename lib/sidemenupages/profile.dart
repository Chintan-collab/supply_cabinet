//import 'dart:async';
//import 'dart:html';
//import 'package:async/async.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  /*Widget textfield(@required String hintText) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'hintText',
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueGrey[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: 550,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    Text(
                      'Nick Albertz',
                      style: TextStyle(
                        //letterSpacing: 2,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 30.0,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'nickalbertz404@gmail.com',
                      style: TextStyle(
                        //letterSpacing: 2,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                        fontSize: 25.0,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '1425366954',
                      style: TextStyle(
                        //letterSpacing: 2,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurves(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Profile",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("profile.png"),
                    )),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 270, left: 185),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(icon: Icon(Icons.edit), onPressed: null),
            ),
          )
        ],
      ),
    );
  }
}

class HeaderCurves extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blueGrey[800];
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width, 270, size.height, 10)
      ..relativeLineTo(0, -130)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
