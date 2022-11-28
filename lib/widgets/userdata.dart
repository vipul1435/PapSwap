
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Userdata{
  String email="";
  String wallet="";
  String username="";
  String? uid;
  Future getuid() async{
    uid=FirebaseAuth.instance.currentUser!.uid;
  }
  Future getdata() async{
    var userdata = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    
      wallet = userdata['wallet'].toString();
      email=userdata['email'].toString();
      print(wallet);
      print(email);
      print('tata bye bye');
  }
  Userdata(){
    getuid();
    getdata();
  }
}