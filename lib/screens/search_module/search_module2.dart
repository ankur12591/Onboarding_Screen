import 'package:flutter/material.dart';

class SearchModuleExample2 extends StatefulWidget {
  @override
  _SearchModuleExample2State createState() => _SearchModuleExample2State();
}

class _SearchModuleExample2State extends State<SearchModuleExample2> {
  Widget appBarTitle = Text(
    "Search Example",
    style: TextStyle(color: Colors.black),
  );
  Icon icon = Icon(
    Icons.search,
    color: Colors.black,
  );
  late TextField textField = const TextField();
  final globalKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = TextEditingController();
  late List<dynamic> _list;
  late bool _isSearching;
  String _searchText = "";
  List searchresult = [];

  _SearchModuleExample2State() {
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _controller.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    values();
  //  buildAppBar(context);
  }

  void values() {
    _list = [];
    _list.add("Indian rupee");
    _list.add("United States dollar");
    _list.add("Australian dollar");
    _list.add("Euro");
    _list.add("British pound");
    _list.add("Yemeni rial");
    _list.add("Japanese yen");
    _list.add("Hong Kong dollar");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: globalKey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(
              //  color: Colors.orange,
              child: buildAppBar(context)),
        ),
        body: Container(
          //  margin: EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 6.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (this.textField == TextField()) {

                                  this.textField = TextField(
                                        controller: _controller,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(5.0)),
                                              borderSide: BorderSide(
                                                color: Colors.blueGrey,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(5.0)),
                                              borderSide: BorderSide(color: Colors.redAccent),
                                            ),
                                            prefixIcon:
                                            Icon(Icons.search, color: Colors.black87),
                                            border: InputBorder.none,
                                            hintText: "Search...",
                                            hintStyle: TextStyle(color: Colors.black54)),
                                        onChanged: searchOperation,
                                      );
                                  _handleSearchStart();
                                } else {
                                  _handleSearchEnd();
                                }
                              });
                            },

                            child: TextField(
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(color: Colors.white,),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white,),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                hintText: "Search..",
                                // suffixIcon: Icon(
                                //   Icons.search,
                                //   color: Colors.black,
                                // ),
                                hintStyle: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                ),
                              ),
                              maxLines: 1,
                            //  controller: _searchControl,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (this.icon.icon == Icons.search) {
                                this.icon = Icon(
                                  Icons.close,
                                  color: Colors.black,
                                );
                                this.appBarTitle = Card(
                                  elevation: 6,
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      //color: Colors.orange,
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                    ),
                                    child: TextField(
                                      controller: _controller,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(5.0)),
                                            borderSide: BorderSide(
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(5.0)),
                                            borderSide: BorderSide(color: Colors.redAccent),
                                          ),
                                          prefixIcon:
                                          Icon(Icons.search, color: Colors.black87),
                                          border: InputBorder.none,
                                          hintText: "Search...",
                                          hintStyle: TextStyle(color: Colors.black54)),
                                      onChanged: searchOperation,
                                    ),
                                  ),
                                );
                                _handleSearchStart();
                              } else {
                                _handleSearchEnd();
                              }
                            });
                          },
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),

              Flexible(
                  child: searchresult.length != 0 || _controller.text.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: searchresult.length,
                          itemBuilder: (BuildContext context, int index) {
                            String listData = searchresult[index];
                            return ListTile(
                              title: Text(listData.toString()),
                            );
                          },
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: _list.length,
                          itemBuilder: (BuildContext context, int index) {
                            String listData = _list[index];
                            return ListTile(
                              title: Text(listData.toString()),
                            );
                          },
                        ))
            ],
          ),
        ));
  }

  Widget buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
          centerTitle: true,
          toolbarHeight: 100,
          title: appBarTitle,
          actions: <Widget>[
            IconButton(
              icon: icon,
              onPressed: () {
                setState(() {
                  if (this.icon.icon == Icons.search) {
                    this.icon = Icon(
                      Icons.close,
                      color: Colors.black,
                    );
                    this.appBarTitle = Card(
                      elevation: 6,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          //color: Colors.orange,
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        child: TextField(
                          controller: _controller,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.black87),
                              border: InputBorder.none,
                              hintText: "Search...",
                              hintStyle: TextStyle(color: Colors.black54)),
                          onChanged: searchOperation,
                        ),
                      ),
                    );
                    _handleSearchStart();
                  } else {
                    _handleSearchEnd();
                  }
                });
              },
            ),
          ]),
    );
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.icon = Icon(
        Icons.search,
        color: Colors.black,
      );
      this.appBarTitle = Text(
        "Search Sample",
        style: TextStyle(color: Colors.black),
      );
      _isSearching = false;
      _controller.clear();
    });
  }

  void searchOperation(String searchText) {
    searchresult.clear();
    if (_isSearching != null) {
      for (int i = 0; i < _list.length; i++) {
        String data = _list[i];
        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          searchresult.add(data);
        }
      }
    }
  }
}
