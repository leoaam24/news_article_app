import 'package:news_article_app/NewsApi.dart';

class NewsService {
  final NewsApi _newsApi = NewsApi();

  Future<Map<String, String>> fetchNews() async {
    final data = await _newsApi.getData();

    // Assuming 'articles' is a list and is not empty
    if (data['articles'] != null && data['articles'].isNotEmpty) {
      final article = data['articles'][3];
      return {
        'title': article['title'] ?? 'No Title',
        'description': article['description'] ?? 'No Description',
        'image': article['urlToImage'] ?? 'https://media.istockphoto.com/id/1369150014/vector/breaking-news-with-world-map-background-vector.jpg?s=612x612&w=0&k=20&c=9pR2-nDBhb7cOvvZU_VdgkMmPJXrBQ4rB1AkTXxRIKM=',
        'author': article['author'] ?? 'No Author',
        'content': article['content'] ?? 'No Content',
        'url': article['url'] ?? '',
      };
    } else {
      // Handle case where articles are empty or null
      throw Exception('No articles found');
    }
  }
}
