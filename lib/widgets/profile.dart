// ignore_for_file: override_on_non_overriding_member, must_be_immutable, unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, sized_box_for_whitespace, avoid_web_libraries_in_flutter, unused_field
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:papswap/widgets/bottomnavigationbar.dart';
import 'package:papswap/widgets/flames_post.dart';
import 'package:papswap/widgets/homepage.dart';
import 'package:papswap/widgets/profilesetting.dart';
import 'package:papswap/widgets/provider.dart';
import 'package:papswap/widgets/styling.dart';
import 'package:papswap/widgets/wallet.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  DataController? dataController;
  String email='';
  String username='';

  @override
  void initState() {
    super.initState();
    dataController = Get.put(DataController());
    try{
       email=dataController!.myDocumnet!.get('email').toString();
    } catch(e){
      email='';
    }
    try{
       username=dataController!.myDocumnet!.get('username').toString();
    } catch(e){
      username='';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'your profile',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.indigo.shade900),
        ),
        elevation: 0,
        actions: [
          Container(
            width: 50,
            height: 50,
            // color: Colors.green,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SettingScreen(),
                  ),
                );
              },
              icon: Icon(Icons.settings_outlined),
              color: Colors.black,
            ),
          ),
        ],
        // foregroundColor: Colors.indigo.shade900,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppThemePapswap().freeboxh(20),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppThemePapswap().freeboxw(26),
                CircleAvatar(
                  radius: 34,
                  backgroundImage: AssetImage('assets/finallogo.PNG'),
                ),
                AppThemePapswap().freeboxw(20),
                Container(
                  // color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppThemePapswap().freeboxh(6),
                      Text(
                        username,
                        style: TextStyle(
                          letterSpacing: 1,
                          height: 1,
                          wordSpacing: 1,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      AppThemePapswap().freeboxh(10),
                      Text(
                        email,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                AppThemePapswap().freeboxw(1),
                Container(
                  padding: EdgeInsets.all(0),
                  width: 20,
                  // color: Colors.blue,
                  child: Column(
                    children: [
                      AppThemePapswap().freeboxh(8),
                      IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppThemePapswap().freeboxh(20),
            Container(
              // color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppThemePapswap().freeboxw(30),
                  Icon(
                    Icons.calendar_month,
                    size: 26,
                    color: Colors.grey,
                  ),
                  AppThemePapswap().freeboxw(4),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 6.5,
                      ),
                      Text(
                        'Joined April 2022',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AppThemePapswap().freeboxh(30),
            // Container(
            //   height: 100,
            // child:
            Container(
              color: Colors.green,
              height: 441,
              child: DefaultTabController(
                length: 2,
                initialIndex: 1,
                child: Scaffold(
                  appBar: TabBar(
                    // controller: _tabController,
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    indicatorWeight: 1,
                    indicatorColor: Colors.blue,
                    labelStyle: TextStyle(
                      fontSize: 14,
                    ),
                    tabs: [
                      Tab(
                        text: 'Reswap',
                      ),
                      Tab(
                        text: 'Flames',
                      ),
                    ],
                  ),

                  // Container(
                  // color: Colors.amber,

                  body: TabBarView(
                    // controller: _tabController
                    // controller: TabController(length: 1),
                    children: [
                      Center(
                        child:Text('naman2'),
                      ),
                      Center(
                        child: FlamesPost(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}