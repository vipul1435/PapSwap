// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:papswap/widgets/reswap_card.dart';

class ReswapPost extends StatefulWidget {
  const ReswapPost({super.key});

  @override
  State<ReswapPost> createState() => _ReswapPostState();
}

class _ReswapPostState extends State<ReswapPost> {
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
      final collectionReference = _db.collection('users').doc(uid.toString().trim()).collection('reswaps');

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
      height: 1000,
      child: ListView.builder(
        controller: controller,
        itemCount: list.length,
        itemBuilder: (context, index) => Padding(
            padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                // child:  Text('ok'),
            child: ReswapCard(
              snap: list[index],
              uid: uid,
            )
        ),
      ),
    );
  }
}
