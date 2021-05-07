import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supply_cabinet/home/homepage.dart';
import 'package:supply_cabinet/widgets/widget.dart';
import 'package:splashscreen/splashscreen.dart';
Widget splash(BuildContext context)
{
  return SplashScreen(
    seconds: 10,
    gradientBackground: LinearGradient(
      colors:[
        Colors.black,
        Colors.red[900],
      ]
    ),
    image: Image.asset('assets/img/logo.png'),
    title: Text("SUPPLY CABINET",
      style: TextStyle(color: Colors.teal,
      fontWeight: FontWeight.bold,
      fontSize: 30),
      ),
    loadingText: Text("Loading",style: TextStyle(color: Colors.white),),
    photoSize: 100.0,
    loaderColor: Colors.black,
    navigateAfterSeconds: SignIn(),
  );
}
void checkId(String mail_id , String p) {
  String mail = "xyz@gmail.com";
  String password = "59900995A";

  /*if(mail == mail_id && password == p ) {
    Navigator.push(context,
      MaterialPageRoute( builder: (context) => MyHomePage()),
    );
    // Add navigator and take it to home screen of our project
  }
  else(){
    showDialog(context: context,
        builder: (context) => AlertDialog(
          title: Text("Incorrect"),
          content: Text("Email ID / Password is wrong"),
          actions: [
            FlatButton(onPressed: () {
              Navigator.push(context,
                MaterialPageRoute( builder: (context) => SignIn()),
              );
            }, child: Text("Okay")),
          ],
          elevation: 10.0,
          backgroundColor: Colors.black12,
          shape: CircleBorder(),
        ),
    );
  };*/
}

class SignIn extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SignIn> {

  TextEditingController email =new TextEditingController();
  TextEditingController password =new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body:SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.cyan[900],
                Colors.cyan[300],
              ],
            ),
          ),
          height: MediaQuery.of(context).size.height-50,
          alignment: Alignment.bottomCenter,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: email,
                    validator: (val){
                      return val.isEmpty || val.length < 5 ? "Please provide E-mail" : null ;
                    },
                    style: simpleTextStyle(),
                    decoration: textFieldInputDecoration("E-mail"),
                  ),
                  TextFormField(
                    controller: password,
                    validator: (val){
                      return val.isEmpty || val.length>8 ? null: "Please provide Password";
                    },
                    style: simpleTextStyle(),
                    decoration: textFieldInputDecoration("Password"),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text("Forgot Password?",style: simpleTextStyle(),),
                    ),
                  ),
                  SizedBox(height: 8,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute( builder: (context) => MyHomePage()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors:[
                            Colors.blueGrey[300],
                            Colors.white,
                          ]
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child:
                      Text("Sign In", style: simpleTextStyle(),
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                 /* Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child:
                    Text("Sign In with Google", style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                    ),
                  ),*/
                  SizedBox(height: 16,),
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                        style: buttonTextStyle(),
                      ),
                        Text("Register now",
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 16,
                        decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),*/
                  SizedBox(height: 100,),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
