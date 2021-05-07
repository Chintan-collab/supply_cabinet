import 'package:flutter/material.dart';
import 'package:supply_cabinet/sidemenupages/feedback.dart';
import 'package:supply_cabinet/sidemenupages/logout.dart';
import 'package:supply_cabinet/sidemenupages/profile.dart';
import 'package:supply_cabinet/widgets/widget.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.blueGrey[900],
                  Colors.red,
                ],
              ),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/img/ppt.jpg'))),
          ),
          Container(
            decoration: gradientbutton(),
            child: ListTile(
              leading: Icon(Icons.input),
              title: Text('Welcome'),
              onTap: () => {},
            ),
          ),
          SizedBox(height: 8,),
          GestureDetector(
            onTap: (){
            Navigator.push(context,
             MaterialPageRoute( builder: (context) => Profile(),),
            );
            },
            child: Container(
              decoration: gradientbutton(),
              child: ListTile(
                leading: Icon(Icons.verified_user),
                title: Text('Profile'),
              ),
            ),
          ),
          SizedBox(height: 8,),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute( builder: (context) => FeedBack(),),
              );
            },
            child: Container(
              decoration: gradientbutton(),
              child: ListTile(
                leading: Icon(Icons.border_color),
                title: Text('Feedback'),
              ),
            ),
          ),
          SizedBox(height: 8,),
          GestureDetector(
            onTap: (){
            Navigator.pushReplacement(context,
            MaterialPageRoute( builder: (context) => Logout(),),
            );
            },
            child: Container(
              decoration: gradientbutton(),
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}