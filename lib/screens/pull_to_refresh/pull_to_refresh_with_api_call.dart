import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onboarding_screen/screens/pull_to_refresh/fruitList.dart';

import 'modals/fruits.dart';

class PullToRefreshWithApiCall extends StatefulWidget {
  const PullToRefreshWithApiCall({
    Key? key,
  }) : super(key: key);

  @override
  _PullToRefreshWithApiCallState createState() =>
      _PullToRefreshWithApiCallState();
}

class _PullToRefreshWithApiCallState extends State<PullToRefreshWithApiCall> {
  final String apiUrl = "https://randomuser.me/api/?results=10";

  List<dynamic> _users = [];

  void fetchUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    setState(() {
      _users = json.decode(result.body)['results'];
    });
  }

  String _name(dynamic user) {
    return user['name']['title'] +
        " " +
        user['name']['first'] +
        " " +
        user['name']['last'];
  }

  String _location(dynamic user) {
    return user['location']['country'];
  }

  String _age(Map<dynamic, dynamic> user) {
    return "Age: " + user['dob']['age'].toString();
  }

  Widget _buildList() {
    return _users.length != 0
        ? RefreshIndicator(
            child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: _users.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  _users[index]['picture']['large'])),
                          title: Text(_name(_users[index])),
                          subtitle: Text(_location(_users[index])),
                          trailing: Text(_age(_users[index])),
                        )
                      ],
                    ),
                  );
                }),
            onRefresh: _getData,
          )
        : Center(child: CircularProgressIndicator());
  }

  Future<void> _getData() async {
    setState(() {
      fetchUsers();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('User List'),
        ),
        body: Container(
          child: _buildList(),
        ),
      ),
    );
  }
}
