// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authprocess {
  String error='';
  Future<void> tryAuth(String username, String email, String password,
    bool islogin, List<dynamic> list) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential;
    if (islogin) {
      print('meeee');
      try {
        userCredential = await auth.signInWithEmailAndPassword(
            email: email, password: password);
      } on FirebaseAuthException catch (e) {
        error = e.message.toString();
        print(e);
        // Errors.showSnackBar(e.message);
      } catch (e) {
        print(e);
      }
    } else {
      try {
        userCredential = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String uid = userCredential.user!.uid;
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'username': username,
          'email': email,
          'password': password,
          'data': list
        });
      } on FirebaseAuthException catch (e) {
        error=e.message.toString();
        // Errors.showSnackBar(e.message);
        print(e);
      } catch (e) {
        print(e);
      }
    }
  }
  String errorgetter(){
    return error;
  }
}
