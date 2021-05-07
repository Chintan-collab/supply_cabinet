import 'package:flutter/material.dart';
import 'package:supply_cabinet/bloc/product_bloc.dart';
import 'package:supply_cabinet/home/homepage.dart';
import 'package:supply_cabinet/views/signin.dart';
import 'package:supply_cabinet/widgets/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
        create: (context) => ProductBloc(),
        child:MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primaryColor: Color(0xff1f1f1f),
        scaffoldBackgroundColor:Color(0xff1f1f1f),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: splash(context),
    ),
    );
  }
}