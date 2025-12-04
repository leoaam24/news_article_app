import 'package:flutter/material.dart';
import 'package:news_article_app/NewsCard.dart';
import 'package:news_article_app/NewsService.dart';
//Home Page of the project
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
//This is a stateful widget for interactivity within the page
class _HomeState extends State<Home> {
  //placeholder values
  //changed when data is received from the API
  String _newsTitle = 'Loading...';
  String _newsDescription = 'Loading...';
  String _newsImage = 'https://media.istockphoto.com/id/1369150014/vector/breaking-news-with-world-map-background-vector.jpg?s=612x612&w=0&k=20&c=9pR2-nDBhb7cOvvZU_VdgkMmPJXrBQ4rB1AkTXxRIKM=';
  //Instantiating a use of NewsService
  final NewsService _newsService = NewsService();

  //starting initial state
  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  //Extracting data fetched from API through newsService
  void _loadNews() async {
    try {
      //storing service class result
      final newsData = await _newsService.fetchNews();
      //changing the values to reflect the data
      setState(() {
        _newsTitle = newsData['title']!;
        _newsDescription = newsData['description']!;
        _newsImage = newsData['image']!;
      });
      //catching and representing the error
    } catch (e) {
      setState(() {
        _newsTitle = 'Failed to load title';
        _newsDescription = 'Failed to load description';
      });
      //for api fetch errors
      print('Error fetching news: $e');
    }
  }

  //actual design and structure of the page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('News Article App',
            style: TextStyle(
              color: Colors.white,
            ),),
          centerTitle: true,
          backgroundColor: Colors.red[700],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(_newsImage),
                  Divider(
                    height: 50,
                    color: Colors.grey[800],
                  ),
                  SizedBox(height: 10,
                  ),
                  Text(_newsTitle,
                    style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.grey[400],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(_newsDescription,
                    style: TextStyle(
                        letterSpacing: 2,
                        color: Colors.grey[400],
                        fontSize: 14
                    ),
                  ),
                  Divider(
                    height: 50,
                    color: Colors.grey[800],
                  ),
                  CardTemplate(newsTitle: _newsTitle, newsDescription: _newsDescription, newsImage: _newsImage),
                ],
              ),
            ),
          ),
        )
    );
  }
}
