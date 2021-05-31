import 'package:cloud_firestore/cloud_firestore.dart';


class CrudMethods{
  Future<void> addData(profileData) async {
    FirebaseFirestore.instance.collection("profile").add(profileData).catchError((e){
      print(e);
    }) ;
  }

  getData () async {
    return await FirebaseFirestore.instance.collection("profile").get();
  }
}
