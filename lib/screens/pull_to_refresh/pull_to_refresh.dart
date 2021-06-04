import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onboarding_screen/screens/pull_to_refresh/fruitList.dart';

import 'modals/fruits.dart';


class PullToRefresh extends StatefulWidget {
  final Future<List<Fruit>> products;



  const PullToRefresh({Key? key, required this.products}) : super(key: key);

  @override
  _PullToRefreshState createState() => _PullToRefreshState();
}

class _PullToRefreshState extends State<PullToRefresh> {


  Future<void> _refreshProducts(BuildContext context) async {
    return fetchFruit();
  }


  Future fetchFruit() async {
    final response = await http.get(Uri.parse(
        'https://postmanmaster.herokuapp.com/fruit/'));;
    if (response.statusCode == 200) {
      return decodeFruit(response.body);
    } else {
      throw Exception('Unable to fetch data from the REST API');
    }
  }

  List<Fruit> decodeFruit(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Fruit>((json) => Fruit.fromMap(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Rest API Demo"),
          backgroundColor: Colors.cyan,
          centerTitle: true,
        ),
    //     body: Center(
    //     //   child:
    //     //   FutureBuilder<List<Fruit>>(
    //     //    // future: products,
    //     //     builder: (context, snapshot) {
    //     //       if (snapshot.hasError) print(snapshot.error);
    //     //      // return snapshot.hasData
    //     //         //  ? FruitList(items: snapshot.data)
    //     //        //   : Center(child: CircularProgressIndicator()
    //     //         );
    //     //     },
    //     //   ),
    //     // )
    // );
    );
  }
}
