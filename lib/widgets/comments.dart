// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:papswap/widgets/comment_card.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(58, 202, 202, 202),
          elevation: 0,
          foregroundColor: Colors.black,
          title: const Text('Comments'),
          centerTitle: false,
        ),
        body: CommonCard(),
        bottomNavigationBar: SafeArea(
          child: Container(
            color: Color.fromARGB(58, 202, 202, 202),
            height: kToolbarHeight,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            padding: const EdgeInsets.only(left: 16, right: 8),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/finallogo.PNG'),
                  radius: 16,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 8),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Comments as username',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: const Text(
                      'Post',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
