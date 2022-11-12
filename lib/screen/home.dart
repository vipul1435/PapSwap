import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

String username = '';
String email = '';
late DocumentSnapshot snap;
Map<String, dynamic> snapdata = snap.data() as Map<String, dynamic>;

class _HomeState extends State<Home> {
  Future<void> getdata() async {
    snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
    username = snapdata['username'];
      email = snapdata['email'];
      // print(username);
    });
  }

  @override
  Widget build(BuildContext context) {
    getdata();
    return Scaffold(
      appBar: AppBar(
        title: Text('hello, $username'),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Container(),
    );
  }
}
