import 'package:flutter/material.dart';

class CardTemplate extends StatelessWidget {

  final String? newsTitle;
  final String? newsDescription;
  final String? newsImage;


  const CardTemplate({super.key, this.newsTitle, this.newsDescription, this.newsImage});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      color: Colors.grey[600],
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            // Handle null or empty image URL
            if (newsImage != null && newsImage!.isNotEmpty)
              Image.network(newsImage!)
            else
              // Show a placeholder if no image is available
              Container(
                height: 150,
                color: Colors.grey[800],
                child: Center(child: Icon(Icons.image_not_supported, color: Colors.white)),
              ),

            SizedBox(height: 10),

            // Handle null title
            Text(newsTitle ?? 'No Title Available',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            SizedBox(height: 8),

            // Handle null description
            Text(newsDescription ?? 'No Description Available',
              style: TextStyle(
                color: Colors.white,
              ),
            ),

            SizedBox(height: 8),

            TextButton(onPressed: () {
              Navigator.pushNamed(context, '/iNews');
            },
                child: Text('See more...'))
          ],
        ),
      ),
    );
  }
}
