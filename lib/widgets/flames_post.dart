// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:papswap/widgets/flames_card.dart';

class FlamesPost extends StatefulWidget {
  const FlamesPost({super.key});

  @override
  State<FlamesPost> createState() => _FlamesPostState();
}

class _FlamesPostState extends State<FlamesPost> {
  final ScrollController controller = ScrollController();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  List<Map<String, dynamic>> list = [];

  DocumentSnapshot? lastDocument;
  bool isMoredata = true;

  bool isLoading = false;
  String uid = "";
  void pageData() async {
    if (isMoredata) {
      setState(() {
        isLoading = true;
      });
      final collectionReference = _db.collection('users').doc(uid.toString().trim()).collection('flames');

      late QuerySnapshot<Map<String, dynamic>> querySnapshot;
      if (lastDocument == null) {
        try {
          querySnapshot = await collectionReference.limit(3).get();
        } catch (e) {
          print(e);
        }
      } else {
        print('Next two loading');
        try{

        querySnapshot = await collectionReference
            .limit(3)
            .startAfterDocument(lastDocument!)
            .get();
        } catch(e){
          print(e);
        }
      }

      lastDocument = querySnapshot.docs.last;

      list.addAll(querySnapshot.docs.map((e) => e.data()));
      print(list.length);
      isLoading = false;

      if (querySnapshot.docs.length < 3) {
        isMoredata = false;
      }
      setState(() {});
    } else {
      print('NO more data');
    }
  }

  @override
  void initState() {
    super.initState();
    if(uid.isEmpty){

    uid = FirebaseAuth.instance.currentUser!.uid;
    }
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
            padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                // child:  Text('ok'),
            child: FlamesCard(
              snap: list[index],
              uid: uid,
            )
            ),
      ),
    );
  }
}
