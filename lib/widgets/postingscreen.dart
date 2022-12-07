
// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:papswap/widgets/post_card.dart';

class PostingSCreen extends StatefulWidget {
  const PostingSCreen({super.key});

  @override
  State<PostingSCreen> createState() => _PostingSCreenState();
}

class _PostingSCreenState extends State<PostingSCreen> {
  final ScrollController controller = ScrollController();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  List<Map<String, dynamic>> list = [];

  List<String> likedata = [];

  DocumentSnapshot? lastDocument;
  bool isMoredata = true;

  bool isLoading = false;
  String uid = "";
  void pageData() async {
    if (isMoredata) {
     
        if (mounted) {
        setState(() {
          isLoading = true;
        });
      }
      final collectionReference = _db.collection('posts');

      late QuerySnapshot<Map<String, dynamic>> querySnapshot;
      if (lastDocument == null) {
        try {
          querySnapshot = await collectionReference.limit(3).get();
        } catch (e) {
          print(e);
        }
      } else {
        try {
          querySnapshot = await collectionReference
              .limit(3)
              .startAfterDocument(lastDocument!)
              .get();
        } catch (e) {
          print(e);
        }
      }

      List<String> currentids =
          querySnapshot.docs.map((e) => e.id.toString().trim()).toList();
      if(currentids.isNotEmpty){try {
        final status = await FirebaseFirestore.instance
            .collection('users')
            .doc(uid.toString().trim())
            .collection('flames')
            .where('post_Id', whereIn: currentids)
            .get();
        likedata.addAll(status.docs
            .map((e) => e.data()['post_Id'].toString().trim())
            .toList());
      } catch (e) {
        print(e);
      }}

      lastDocument = querySnapshot.docs.last;


      list.addAll(querySnapshot.docs.map((e) => e.data()));

      isLoading = false;

      if (querySnapshot.docs.length < 3) {
        isMoredata = false;
      }
      if (mounted) {
        setState(() {});
      } 
      
    } else {
      print('NO more data');
    }
  }

  @override
  void initState() {
    super.initState();
    uid = FirebaseAuth.instance.currentUser!.uid;
    pageData();

    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        pageData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 622,
      child: ListView.builder(
        controller: controller,
        itemCount: list.length,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: PostingCard(
              snap: list[index],
              uid: uid,
              likedata: likedata,
            )),
      ),
    );
  }
}
