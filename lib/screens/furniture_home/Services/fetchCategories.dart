import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onboarding_screen/screens/furniture_home/models/Categories.dart';

// Fetch our Categories from API
Future<List<Category>> fetchCategories() async {
  String apiUrl =
      "https://5f210aa9daa42f001666535e.mockapi.io/api/categories";

  // ignore: file_names, file_names
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<Category> categories = (json.decode(response.body) as List)
        .map((data) => Category.fromJson(data))
        .toList();
    print("Success");
// ignore: file_names
// It returns list of categories
    return categories;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}
