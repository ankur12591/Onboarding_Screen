// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:getwidget/components/search_bar/gf_search_bar.dart';
// //import 'package:getwidget/getwidget.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//     title: 'GetWidget',
//     debugShowCheckedModeBanner: false,
//     home: MyHomePage(),
//   );
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final String _playStoreLink =
//       'https://play.google.com/store/apps/details?id=dev.getflutter.appkit';
//   // final String _appStoreLink = 'Coming Soon';
//   final String _githuAppRepoLink =
//       'https://github.com/ionicfirebaseapp/getwidget-app-kit';
//   final String _githubLibraryRepoLink =
//       'https://github.com/ionicfirebaseapp/getwidget';
//
//   late List _list;
//
//
//
//   void values() {
//     _list = [];
//     _list.add("Indian rupee");
//     _list.add("United States dollar");
//     _list.add("Australian dollar");
//     _list.add("Euro");
//     _list.add("British pound");
//     _list.add("Yemeni rial");
//     _list.add("Japanese yen");
//     _list.add("Hong Kong dollar");
//   }
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     backgroundColor: GFColors.DARK,
//     appBar: AppBar(
//       title: Text(
//         "SearchBar App",
//       ),
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             _selectedItemText,
//           ),
//           GFSearchBar(
//             searchList: _list,
//             searchQueryBuilder: (query, _list) {
//               return _list
//                   .where((item) =>
//
//
//                   item.toLowerCase().contains(query.toLowerCase()))
//                   .toList();
//             },
//             overlaySearchListItemBuilder: (item) {
//               return Container(
//                 padding: const EdgeInsets.all(8),
//                 child: Text(
//                   item,
//                   style: const TextStyle(fontSize: 18),
//                 ),
//               );
//             },
//             onItemSelected: (item) {
//               setState(() {
//                 _selectedItemText = item;
//               });
//             },
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
//
//
//
//
//   String _selectedItemText = "Our Selection Item";
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "SearchBar App",
//           ),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 _selectedItemText,
//               ),
//               GFSearchBar(
//                 searchList: _list,
//                 searchQueryBuilder: (query, list) {
//                   return list
//                       .where((item) =>
//                       item!.toLowerCase().contains(query.toLowerCase()))
//                       .toList();
//                 },
//                 overlaySearchListItemBuilder: (item) {
//                   return Container(
//                     padding: const EdgeInsets.all(8),
//                     child: Text(
//                       item,
//                       style: const TextStyle(fontSize: 18),
//                     ),
//                   );
//                 },
//                 onItemSelected: (item) {
//                   setState(() {
//                     _selectedItemText = item;
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }