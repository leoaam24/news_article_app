import 'dart:convert';
import 'package:http/http.dart' as http;
//This Class is used for fetching API from the provider
class NewsApi {
  //Constructor for initializing the API fetch
  NewsApi();
  //Method to fetch data from the API
  Future<Map<String, dynamic>> getData() async {
    try {
      // 1. Create the URL
      var url = Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b59bf945dc1649a78afc781b9f6d1941');

      // 2. Make the request and wait for the response
      var response = await http.get(url);

      // 3. Check if the request was successful
      if (response.statusCode == 200) {
        // 4. Decode the JSON response and return it
        return jsonDecode(response.body);
      } else {
        // Handle the error
        throw Exception('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Handle exceptions like no internet connection
      print('An error occurred: $e');
      rethrow;
    }
  }
}
