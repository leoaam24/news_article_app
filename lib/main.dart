import 'package:flutter/material.dart';
import 'package:news_article_app/pages/Home.dart';
import 'package:news_article_app/pages/IndividualNews.dart';

//This is app's main entry point
void main() {
  //running the material app
  runApp(MaterialApp(
    //making the home page as the initial route when the app is opened
      initialRoute: '/home',
      //add routes for other screens
      routes: {
        '/home': (context) => Home(),
        '/iNews': (context) => IndividualNews(),
      }
  ));
}









