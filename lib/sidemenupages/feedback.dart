import 'package:flutter/material.dart';
import 'package:supply_cabinet/widgets/widget.dart';
class FeedBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      bottomNavigationBar: botttombar(),
      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[
              Colors.teal[300],
              Colors.red[300],
            ]
          )
        ),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
            TextField(
            style: simpleTextStyle(),
        decoration: textFieldInputDecoration("Feedback"),
      ),
       RaisedButton(
      child: Text(
      'Submit',
      style: TextStyle(color: Colors.blue, fontSize: 16),
    ),
    onPressed: () {
    }
       ),
   ], ),
    ),
    );
  }
}