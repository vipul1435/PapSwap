// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, avoid_unnecessary_containers, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:papswap/widgets/offers.dart';
import 'package:papswap/widgets/styling.dart';
import 'package:papswap/widgets/userdata.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});
  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  'account overview',
                  style: TextStyle(color: Colors.indigo.shade900),
                ),
                actions: [
                  IconButton(
                      tooltip: 'Wallet log',
                      onPressed: () {
                        // Navigator.of(context).push(PageTransition(
                        //     child: const TransactionsScreen(),
                        //     type: PageTransitionType.topToBottom));
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                        size: 28,
                      )),
                ],
                // bottom: AppBar(
                //   toolbarHeight: 100,
                //   elevation: 0,
                //   backgroundColor: Colors.transparent,
                //   // title: WalletCard(
                //   //   showadfn: _showRewardedAd,
                //   //   userData: userData,
                //   // ),
                // ),
              ),
            ];
           
          },
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 124,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 70, 177, 254),
                              Color.fromARGB(255, 43, 140, 209),
                              Color.fromARGB(255, 31, 124, 192),
                              Color.fromARGB(255, 18, 104, 166),
                              Color.fromARGB(255, 11, 90, 147),
                              Color.fromARGB(255, 5, 73, 121),
                              Color.fromARGB(255, 0, 58, 100),
                             
                            ]),
                            borderRadius: BorderRadius.circular(12),
                            // color: Colors.red,
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppThemePapswap().freeboxw(30),
                              Column(
                                children: [
                                  AppThemePapswap().freeboxh(34),
                                  Row(
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        child: Text(
                                          '123',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                      ),
                                      AppThemePapswap().freeboxw(10),
                                      Text(
                                        'paptokens',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  AppThemePapswap().freeboxh(0),
                                  Text(
                                    'Current Balance',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              AppThemePapswap().freeboxw(110),
                              Column(
                                children: [
                                  AppThemePapswap().freeboxh(30),
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Icon(
                                        Icons.add,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        AppThemePapswap().freeboxh(20),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(0),
                              margin: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      AppThemePapswap().freeboxh(10),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      AppThemePapswap().freeboxw(137),
                                      Container(
                                        // color: Colors.green,
                                        child: IconButton(
                                          constraints: BoxConstraints(
                                            maxHeight: 49,
                                          ),
                                          padding: EdgeInsets.all(0),
                                          alignment: Alignment.topRight,
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.info_outline,
                                          ),
                                        ),
                                      ),
                                      AppThemePapswap().freeboxw(8),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      AppThemePapswap().freeboxw(10),
                                      Container(
                                        padding: EdgeInsets.all(0),
                                        height: 60,
                                        width: 40,
                                        // color: Colors.red,
                                        child: Image.asset(
                                          'assets/finallogo.PNG',
                                          alignment: Alignment.topLeft,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      AppThemePapswap().freeboxh(10),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppThemePapswap().freeboxw(10),
                                      Text(
                                        'SuperTokens',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppThemePapswap().freeboxh(10),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppThemePapswap().freeboxw(10),
                                      Text(
                                        '''SuperTokens can only be
earned after the content
verification.''',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 145, 145, 145),
                                          // fontWeight: FontWeight.w400,
                                          // fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppThemePapswap().freeboxh(10),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppThemePapswap().freeboxw(10),
                                      Text(
                                        '''values upto 500 INR for
every SuperTokens''',
                                        style: TextStyle(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppThemePapswap().freeboxh(8),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppThemePapswap().freeboxw(42),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Check Now',
                                        ),
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.red),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [AppThemePapswap().freeboxh(10)],
                                  ),
                                ],
                              ),
                            ),
                            AppThemePapswap().freeboxw(10),
                            Container(
                              width: 170,
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                // border: Border.all(
                                //     // color: Colors.black,
                                //     // width: 1,
                                //     ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      AppThemePapswap().freeboxh(10),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      AppThemePapswap().freeboxw(136),
                                      Container(
                                        // color: Colors.green,
                                        child: IconButton(
                                          constraints: BoxConstraints(
                                            maxHeight: 49,
                                          ),
                                          padding: EdgeInsets.all(0),
                                          alignment: Alignment.topRight,
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.info_outline,
                                          ),
                                        ),
                                      ),
                                      AppThemePapswap().freeboxw(10),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      AppThemePapswap().freeboxw(10),
                                      Container(
                                        padding: EdgeInsets.all(0),
                                        height: 60,
                                        width: 40,
                                        // color: Colors.red,
                                        child: Image.asset(
                                          'assets/finallogo.PNG',
                                          alignment: Alignment.topLeft,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      AppThemePapswap().freeboxh(10),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppThemePapswap().freeboxw(10),
                                      Text(
                                        'Earn PapTokens',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppThemePapswap().freeboxh(10),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppThemePapswap().freeboxw(10),
                                      Text(
                                        '''Earn PapTokens daily
with bonus and through
swaps.''',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 145, 145, 145),
                                          // fontWeight: FontWeight.w400,
                                          // fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppThemePapswap().freeboxh(10),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppThemePapswap().freeboxw(7),
                                      Text(
                                        '''upto 45 PapTokens every
week''',
                                        style: TextStyle(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      AppThemePapswap().freeboxw(6),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppThemePapswap().freeboxh(8),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppThemePapswap().freeboxw(42),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Earn Now',
                                        ),
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.red),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [AppThemePapswap().freeboxh(10)],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AppThemePapswap().freeboxh(14),
                          ],
                        ),
                        Row(
                          children: [
                            AppThemePapswap().freeboxw(6),
                            Text(
                              'Claim Rewards',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue.shade900,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AppThemePapswap().freeboxh(16),
                          ],
                        ),
                        Row(
                          children: [
                            AppThemePapswap().freeboxw(6),
                            Text(
                              'New Offers',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AppThemePapswap().freeboxh(8),
                          ],
                        ),
                        NewOffers(),
                      ],
                    ),
                  ),
                ),
                // SliverList(
                //     delegate: SliverChildBuilderDelegate(
                //   (context, index) {
                //     return widget.rewardData.rewarddata[index].data()['show']
                //         ? RewardTile(
                //             rewarddata:
                //                 widget.rewardData.rewarddata[index].data(),
                //           )
                //         : const SizedBox();
                //   },
                //   childCount: widget.rewardData.rewarddata.length,
                // )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
