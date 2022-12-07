// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<void> reswapData({
  required String filepath,
  required String text,
  required String image,
  required String category,
  required String posttext,
  required int reswaps,
  required String uid,
  required String postId,
}) async {
  print('i am created');
  String uploadedId='';
  final ref = FirebaseFirestore.instance
      .collection('posts')
      .doc(postId.toString().trim())
      .collection('comments')
      .doc();
  String genid = ref.id;
  print(filepath);
  print(genid);
  try{
    var storage = FirebaseStorage.instance.ref().child('reswaps/$genid');
    var upload = storage.putFile(File(filepath));
    upload.whenComplete(()async{
      //  await uploadedId= storage.getDownloadURL().then((value) => value.toString());
    });
    
  } catch(e){
    print(e);
  }

}
