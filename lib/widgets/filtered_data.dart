// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:papswap/widgets/post_card.dart';

class FilteredScreen extends StatefulWidget {
  final catagory;
  const FilteredScreen({Key? key, required this.catagory}) : super(key: key);
  @override
  State<FilteredScreen> createState() => _FilteredScreenState();
}

class _FilteredScreenState extends State<FilteredScreen> {
  final ScrollController controller = ScrollController();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  List<Map<String, dynamic>> list = [];

  List<String> likedata = [];

  DocumentSnapshot? lastDocument;
  bool isMoredata = true;

  String catagory = '';
  bool isLoading = false;
  String uid = "";
  Future<void> pageData() async {
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
          querySnapshot = await collectionReference
              .where('catagory', isEqualTo: catagory)
              .limit(3)
              .get();
        } catch (e) {
          print(e);
        }
      } else {
        try {
          querySnapshot = await collectionReference
              .where('catagory', isEqualTo: catagory)
              .limit(3)
              .startAfterDocument(lastDocument!)
              .get();
        } catch (e) {
          print(e);
        }
      }

      List<String> currentids =
          querySnapshot.docs.map((e) => e.id.toString().trim()).toList();
      if (currentids.isNotEmpty) {
        try {
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
        }
      }

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
    setState(() {
      catagory=widget.catagory;

    });
    pageData();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        pageData();
      }
    });
  }
  
  void setfilter() async{
    if(catagory!=widget.catagory.toString().trim()){
      setState(() {
        catagory=widget.catagory.toString().trim();
        list=[];
        lastDocument=null;
        isMoredata=true;
        print(catagory);

      });
      await pageData();
    }
  }
  @override
  Widget build(BuildContext context) {
    setfilter();
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
