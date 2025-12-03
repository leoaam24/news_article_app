import 'package:flutter/material.dart';
import 'package:news_article_app/NewsService.dart';
import 'package:url_launcher/url_launcher.dart';


class IndividualNews extends StatefulWidget {
  const IndividualNews({super.key});

  @override
  State<IndividualNews> createState() => _State();
}

class _State extends State<IndividualNews> {

  final NewsService _newsService = NewsService();
  String _newsTitle = 'Loading...';
  String _newsDescription = 'Loading...';
  String _newsImage = 'No Image';
  String _newsAuthor = 'No Author';
  String _newsContent = 'No Content';
  String _newsUrl = '';


  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  void _loadNews() async {
    try {
      final newsData = await _newsService.fetchNews();
      setState(() {
        _newsTitle = newsData['title']!;
        _newsDescription = newsData['description']!;
        _newsImage = newsData['image']!;
        _newsAuthor = newsData['author']!;
        _newsContent = newsData['content']!;
        _newsUrl = newsData['url']!;
      });
    } catch (e) {
      setState(() {
        _newsTitle = 'Failed to load title';
        _newsDescription = 'Failed to load description';
      });
      print('Error fetching news: $e');
    }
  }

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(_newsImage),
            Divider(
              height: 20,
              color: Colors.grey[800],
            ),
            Center(
              child: TextButton.icon(onPressed: () async {
                final Uri uri = Uri.parse(_newsUrl);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  // Can't launch URL, show an error
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Could not launch $_newsUrl')),
                  );
                }
              },
                icon: Icon(Icons.link,
                  size: 15,
                  color: Colors.grey[400],
                ),
                label: Text('Read Full Article'),
              )
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(_newsTitle,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 20,
                wordSpacing: .5,
              ),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(_newsAuthor,
              style: TextStyle(
                color: Colors.red[200],
                fontSize: 15,
                wordSpacing: .5,
              ),
              ),
            ),
            SizedBox(height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(_newsContent,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 15,
                  wordSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
