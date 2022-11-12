// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print, unnecessary_brace_in_string_interps, unused_element, unused_local_variable, unused_import, prefer_const_declarations, deprecated_member_use

import 'dart:convert';
import 'dart:io';
// import 'dart:html';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:papswap/widgets/comments.dart';
import 'package:papswap/widgets/forgot_password.dart';
import 'package:papswap/widgets/modal_class.dart';
import 'package:papswap/widgets/styling.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PostingScreen extends StatefulWidget {
  const PostingScreen({super.key});

  @override
  State<PostingScreen> createState() => _PostingScreenState();
}

class _PostingScreenState extends State<PostingScreen> {
  List<Document> result = [];
  ScrollController scrollController = ScrollController();
  bool loading = true;
  int offset = 0;
  @override
  void initState() {
    super.initState();
    fetchData(offset);
    handleNext();
  }

  void fetchData(paraOffset) async {
    var response = await http.get(Uri.parse(
        "https://firestore.googleapis.com/v1/projects/papswap-791f0/databases/(default)/documents/posts"));

    print(response.body);
    Welcome modelClass = Welcome.fromJson(json.decode(response.body));
    // print(modelClass);
    result = result + modelClass.documents;
    int localOffset = offset + 15;
    setState(() {
      result;
      loading = false;
      offset = localOffset;
    });
  }

  void handleNext() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        fetchData(offset);
      }
    });
  }

  final imageurl =
      'https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?k=20&m=517188688&s=612x612&w=0&h=i38qBm2P-6V4vZVEaMy_TaTEaoCMkYhvLCysE7yJQ5Q=';
  @override
  Widget build(BuildContext context) {
    return
        //  Scaffold(
        // body:
        Container(
      height: 670,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        itemCount: result.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            // color: Colors.red,
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 486,
              decoration: BoxDecoration(
                // color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              // child: Container(
              //     decoration: BoxDecoration(
              //         color: Colors.red, borderRadius: BorderRadius.circular(10),
              // ),
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
                        // color: Colors.green,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppThemePapswap().freeboxh(10),
                            Container(
                              // padding: EdgeInsets.only(top: 10),
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
                                                  AppThemePapswap()
                                                      .freeboxw(24),
                                                  Icon(
                                                    Icons.report_gmailerrorred,
                                                    color: Colors.red,
                                                  ),
                                                  AppThemePapswap()
                                                      .freeboxw(24),
                                                  Text(
                                                    'Report Post',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  // Container(
                                                  //   child: Text('naman'),
                                                  //   color: Colors.red,
                                                  //   height: 100,
                                                  // )
                                                ],
                                              ),
                                              AppThemePapswap().freeboxh(40),
                                            ],
                                          ),
                                        );
                                        // Padding(
                                        //     padding: EdgeInsets.only(
                                        //         bottom:
                                        //             MediaQuery.of(context)
                                        //                 .viewInsets
                                        //                 .bottom))
                                        //   ],
                                        // ),
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
                      Text(
                        'fetching data',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  AppThemePapswap().freeboxh(14),
                  // Text(result[index].name),
                  Container(
                    height: 300,
                    width: 300,
                    child: Image.network(
                      // imageurl
                        result[index].fields.image.stringValue /*result[index].url*/),
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
                          onPressed: () {},
                          icon: Icon(
                            Icons.local_fire_department_sharp,
                            color: Color.fromARGB(255, 101, 101, 101),
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
                          onPressed: () {},
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
                        Container(
                          // color: Colors.green,
                          child: IconButton(
                            iconSize: 20,
                            padding: EdgeInsets.all(0),
                            constraints: BoxConstraints(minHeight: 5),
                            alignment: Alignment.bottomLeft,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CommentPage(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.insert_comment,
                              color: Color.fromARGB(255, 101, 101, 101),
                            ),
                          ),
                        ),
                        AppThemePapswap().freeboxw(168),
                        Container(
                          child: IconButton(
                            padding: EdgeInsets.all(0),
                            constraints: BoxConstraints(minHeight: 5),
                            alignment: Alignment.bottomLeft,
                            onPressed: () async {
                              final uri = Uri.parse(imageurl);
                              final res = await http.get(uri);
                              final bytes = res.bodyBytes;

                              final temp = await getTemporaryDirectory();
                              final path = '${temp.path}/image.jpg';
                              File(path).writeAsBytesSync(bytes);

                              await Share.shareFiles([path]);
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
                            result[index].fields.like.integerValue,
                            style: TextStyle(fontSize: 12),
                          ),
                          //   ],
                          // ),
                        ),
                        AppThemePapswap().freeboxw(20),
                        Container(
                          // color: Colors.green,

                          alignment: Alignment.bottomLeft,
                          child: Text(
                            '111',
                            style: TextStyle(fontSize: 12),
                          ),
                          //   ],
                          // ),
                        ),
                        AppThemePapswap().freeboxw(20),
                        Container(
                          // color: Colors.green,

                          alignment: Alignment.bottomLeft,
                          child: Text(
                           result[index].fields.comment.mapValue.fields.length.toString(),
                            style: TextStyle(fontSize: 12),
                          ),
                          //   ],
                          // ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // ),
            // ),
          ),
        ),
      ),
    );
  }
}
