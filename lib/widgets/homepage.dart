// ignore_for_file: prefer_const_constructors, unused_local_variable

// import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:papswap/widgets/post_card.dart';
import 'package:papswap/widgets/styling.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Uri _url = Uri.parse('https://papswap.in');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
  String? uid;
  setuseruid() async{
    uid = FirebaseAuth.instance.currentUser!.uid.toString();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final screenHeight = height;
    final screenWidth = width;
    final blockWidth = screenWidth / 100;
    final blockHeight = screenHeight / 100;
    final textMultiplier = blockHeight;
    final imageSizeMultiplier = blockWidth;
    final heightMultiplier = blockHeight;
    final widthMultiplier = blockWidth;
    setuseruid();
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            // Text(
            //   'PapSwap',
            //   style: TextStyle(color: Colors.red),
            // ),
            Text('PAP S',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 2.35 * textMultiplier,
                )),
            RotationTransition(
              turns: const AlwaysStoppedAnimation(270 / 360),
              child: Text(
                "W",
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 2.12 * textMultiplier,
                ),
              ),
            ),
            Text('AP',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 2.35 * textMultiplier,
                )),
          ],
        ),
        elevation: 0,
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {
              _launchUrl();
            },
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            AppThemePapswap().freeboxh(10),
            Container(
              padding: EdgeInsets.only(bottom: 10, top: 10),
              // color: Colors.white,
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        // width: 170,
                        decoration: BoxDecoration(
                            // color: Color.fromARGB(161, 255, 214, 214),
                            color: Color.fromARGB(58, 202, 202, 202),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                          child: Text(
                            '   Ministry of Development   ',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        // width: 70,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(58, 202, 202, 202),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                            child: Text(
                          '   Ministry of Rural area Development   ',
                          style: TextStyle(color: Colors.black),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        // width: 70,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(58, 202, 202, 202),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                            child: Text(
                          '   Ministry of Child Development   ',
                          style: TextStyle(color: Colors.black),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        // width: 70,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(58, 202, 202, 202),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                            child: Text(
                          '   Ministry of Defence   ',
                          style: TextStyle(color: Colors.black),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        // width: 70,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(58, 202, 202, 202),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                            child: Text(
                          '   Road and transportation ministry   ',
                          style: TextStyle(color: Colors.black),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        // width: 70,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(58, 202, 202, 202),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                            child: Text(
                          '   Ministry of Educational Development   ',
                          style: TextStyle(color: Colors.black),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        // width: 70,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(58, 202, 202, 202),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                            child: Text(
                          '   Health Ministry   ',
                          style: TextStyle(color: Colors.black),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        // width: 70,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(58, 202, 202, 202),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                            child: Text(
                          '   Home Ministry   ',
                          style: TextStyle(color: Colors.black),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                AppThemePapswap().freeboxw(15),
                Text(
                  'trending',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.indigo.shade900,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
            AppThemePapswap().freeboxh(8),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('posts').snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container(
                  height: 622,
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 4),
                      child: PostingCard(
                        snap: snapshot.data!.docs[index].data(),uid: uid,
                      ),
                    ),
                  ),
                );
              },
            ),
            // PostingScreen(),
          ],
        ),
      ),
    );
  }
}