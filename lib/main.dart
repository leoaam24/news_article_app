import 'package:flutter/material.dart';
import 'package:news_article_app/pages/Home.dart';
import 'package:news_article_app/pages/IndividualNews.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/iNews': (context) => IndividualNews(),
      }
  ));
}









