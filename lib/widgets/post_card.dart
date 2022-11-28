// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print, unnecessary_brace_in_string_interps, unused_element, unused_local_variable, unused_import, prefer_const_declarations, deprecated_member_use, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
// import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:papswap/widgets/swap_reswap.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:papswap/widgets/forgot_password.dart';
import 'package:papswap/widgets/styling.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PostingCard extends StatefulWidget {
  final snap;
  final uid;
  const PostingCard({
    Key? key,
    required this.snap,
    required this.uid,
  }) : super(key: key);
  @override
  State<PostingCard> createState() => _PostingCardState();
}

class _PostingCardState extends State<PostingCard> {
  bool isLiked = false;

  Future<void> likeprocess() async {
    try {
      if(widget.snap['like_data'].contains(widget.uid.toString().trim())){
        await FirebaseFirestore.instance.collection('posts').doc(widget.snap['post_id'].toString().trim()).update({
          'like':widget.snap['like']-1,
          'like_data': FieldValue.arrayRemove([widget.uid.toString().trim()])
        });
      } else{
        await FirebaseFirestore.instance.collection('posts').doc(widget.snap['post_id'].toString().trim()).update({
          'like':widget.snap['like']+1,
          'like_data': FieldValue.arrayUnion([widget.uid.toString().trim()])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  final imageurl =
      'https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?k=20&m=517188688&s=612x612&w=0&h=i38qBm2P-6V4vZVEaMy_TaTEaoCMkYhvLCysE7yJQ5Q=';
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      // color: Colors.red,
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 486,
        decoration: BoxDecoration(
          // color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppThemePapswap().freeboxh(20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppThemePapswap().freeboxw(10),
                Container(
                  child: Column(
                    children: [
                      AppThemePapswap().freeboxh(10),
                      Container(
                        height: 30,
                        width: 30,
                        child: Image.asset('assets/finallogo.PNG'),
                      ),
                    ],
                  ),
                ),
                AppThemePapswap().freeboxw(20),
                Container(
                  // color: Colors.green,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('PapSwap_official',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold)),
                      AppThemePapswap().freeboxh(6),
                      Text('2w ago'),
                    ],
                  ),
                ),
                AppThemePapswap().freeboxw(40),
                Container(
                  // color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppThemePapswap().freeboxh(3),
                      IconButton(
                          padding: EdgeInsets.all(0),
                          alignment: Alignment.topRight,
                          onPressed: () {
                            showModalBottomSheet(
                                elevation: 20,
                                enableDrag: true,
                                // constraints:
                                //     BoxConstraints(maxHeight: 600, minHeight: 600),
                                isScrollControlled: true,
                                isDismissible: true,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15))),
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (context) {
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.start,
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.start,
                                      children: [
                                        AppThemePapswap().freeboxh(5),
                                        Container(
                                          height: 6,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            // fontSize: 100,
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        AppThemePapswap().freeboxh(25),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppThemePapswap().freeboxw(24),
                                            Icon(
                                              Icons.report_gmailerrorred,
                                              color: Colors.red,
                                            ),
                                            AppThemePapswap().freeboxw(24),
                                            Text(
                                              'Report Post',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        AppThemePapswap().freeboxh(40),
                                      ],
                                    ),
                                  );
                                });
                          },
                          icon: Icon(
                            Icons.more_horiz,
                            color: Colors.grey,
                          )),
                    ],
                  ),
                )
              ],
            ),
            AppThemePapswap().freeboxh(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppThemePapswap().freeboxw(2),
                // Expanded(
                //   child: FittedBox(
                // child:
                Text(
                  widget.snap['catagory'],
                  // result[index].fields.username.stringValue,
                  style: TextStyle(fontSize: 16),
                ),
                // ),
                // ),
              ],
            ),
            AppThemePapswap().freeboxh(14),
            // Text(result[index].name),
            Container(
              height: 300,
              width: 300,
              child: Image.network(
                widget.snap['image'],
              ),
              // 'https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?k=20&m=517188688&s=612x612&w=0&h=i38qBm2P-6V4vZVEaMy_TaTEaoCMkYhvLCysE7yJQ5Q=' /*result[index].url*/),
              // color: Color.fromARGB(161, 255, 214, 214),
            ),
            AppThemePapswap().freeboxh(16),
            Container(
              // color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    constraints: BoxConstraints(minHeight: 5),
                    padding: EdgeInsets.all(0),
                    alignment: Alignment.bottomLeft,
                    onPressed: () async {
                      await likeprocess();
                    },
                    icon: !widget.snap['like_data'].contains(widget.uid.toString().trim())
                        ? Icon(
                            Icons.local_fire_department_sharp,
                            color: Color.fromARGB(255, 101, 101, 101),
                          )
                        : Icon(
                            Icons.local_fire_department_sharp,
                            color: Color.fromARGB(255, 255, 0, 0),
                          ),
                  ),
                  // Container(
                  //   // color: Colors.green,

                  //   alignment: Alignment.bottomLeft,
                  //   child: Text(
                  //     '111',
                  //     style: TextStyle(fontSize: 12),
                  //   ),
                  //   //   ],
                  //   // ),
                  // ),
                  AppThemePapswap().freeboxw(20),
                  IconButton(
                    padding: EdgeInsets.all(0),
                    constraints: BoxConstraints(minHeight: 5),
                    alignment: Alignment.topLeft,
                    onPressed: () {
                      showModalBottomSheet(elevation: 10,enableDrag: true,isDismissible: true,shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),),
                      ),
                      context: context,
                      builder: (context) => ReSwap(link: widget.snap['image']),
                      );
                    },
                    icon: Icon(
                      Icons.swap_horiz,
                      color: Color.fromARGB(255, 101, 101, 101),
                    ),
                  ),
                  // Container(
                  //   // color: Colors.green,
                  //   padding: EdgeInsets.all(0),
                  //   child: Text(
                  //     '111',
                  //     style: TextStyle(fontSize: 12),
                  //   ),
                  // ),
                  AppThemePapswap().freeboxw(18),
                  // Container(
                  //   // color: Colors.green,
                  //   child: IconButton(
                  //     iconSize: 20,
                  //     padding: EdgeInsets.all(0),
                  //     constraints: BoxConstraints(minHeight: 5),
                  //     alignment: Alignment.bottomLeft,
                  //     onPressed: () {
                  //       Navigator.of(context).push(
                  //         MaterialPageRoute(
                  //           builder: (context) => CommentPage(),
                  //         ),
                  //       );
                  //     },
                  //     icon: Icon(
                  //       Icons.insert_comment,
                  //       color: Color.fromARGB(255, 101, 101, 101),
                  //     ),
                  //   ),
                  // ),
                  AppThemePapswap().freeboxw(168),
                  Container(
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      constraints: BoxConstraints(minHeight: 5),
                      alignment: Alignment.bottomLeft,
                      onPressed: () async {
                        final uri = Uri.parse(widget.snap['image']);
                        final res = await http.get(uri);
                        final bytes = res.bodyBytes;

                        final temp = await getTemporaryDirectory();
                        final path = '${temp.path}/image.jpg';
                        File(path).writeAsBytesSync(bytes);

                        await Share.shareFiles([path],text: 'See the latest pilocies by Goverment and Share your Opinion');
                      },
                      icon: Icon(
                        Icons.share,
                        color: Color.fromARGB(255, 101, 101, 101),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppThemePapswap().freeboxh(1),
            Container(
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppThemePapswap().freeboxw(4),
                  Container(
                    // color: Colors.green,

                    alignment: Alignment.bottomLeft,
                    child: Text(
                      widget.snap['like'].toString(),
                      // snap['naman'],
                      style: TextStyle(fontSize: 12),
                    ),
                    //   ],
                    // ),
                  ),
                  AppThemePapswap().freeboxw(20),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '111',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  AppThemePapswap().freeboxw(20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
