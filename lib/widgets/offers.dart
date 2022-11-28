// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_print

import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:papswap/widgets/styling.dart';

class NewOffers extends StatelessWidget {
  // final snap1;
  // const NewOffers({
  //   Key? key,
  //   required this.snap1,
  // }) : super(key: key);
  List<MaterialColor> colorizeColors = [
    // Colors.purple,
    Colors.blue,
    // Colors.yellow,
    Colors.red,
    Colors.blue,
    Colors.red,
  ];
  TextStyle colorizeTextStyle = TextStyle(
    fontSize: 50.0,
    // fontFamily: 'Horizon',
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image.network0'www.greenqueen.com.hk/wp-content/uploads/2020/01/Coming-Soon.jpg'),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            height: 390,
            decoration: BoxDecoration(
              // color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Row(
                    children: [
                      AppThemePapswap().freeboxh(14),
                    ],
                  ),
                ),
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Row(
                    children: [
                      AppThemePapswap().freeboxh(14),
                      // ignore: prefer_const_constructors
                      Text(
                        'Newspaper Subcription',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      AppThemePapswap().freeboxh(8),
                    ],
                  ),
                ),
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Row(
                    children: [
                      AppThemePapswap().freeboxh(8),
                    ],
                  ),
                ),
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Row(
                    children: [
                      Text(
                        '500  ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'PapTokens ',
                        style: TextStyle(
                          fontSize: 15,
                          // fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: AppThemePapswap().freeboxh(16),
                ),
                Stack(
                  children: [
                    Positioned(
                      // top: 50,
                      // left: 0,
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                        child: Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            child: Image.asset('assets/finallogo.PNG'),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 100,
                        left: 40,
                        // child: AnimatedTextKit(
                        //   animatedTexts: [
                        //     TypewriterAnimatedText(
                        //       'Hello world!',
                        //       textStyle: const TextStyle(
                        //         fontSize: 32.0,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //       speed: const Duration(milliseconds: 2000),
                        //     ),
                        //   ],
                        //   totalRepeatCount: 4,
                        //   pause: const Duration(milliseconds: 1000),
                        //   displayFullTextOnTap: true,
                        //   stopPauseOnTap: true,
                        // ),

                        child: Container(
                          width: 254,
                          height: 70,
                          color: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              ColorizeAnimatedText(
                                ' Larry Page',
                                textStyle: colorizeTextStyle,
                                colors: colorizeColors,
                              ),
                              ColorizeAnimatedText(
                                ' Bill Gates',
                                textStyle: colorizeTextStyle,
                                colors: colorizeColors,
                              ),
                              ColorizeAnimatedText(
                                ' Steve Jobs',
                                textStyle: colorizeTextStyle,
                                colors: colorizeColors,
                              ),
                            ],
                            repeatForever: true,
                            isRepeatingAnimation: true,
                            onTap: () {
                              print("Tap Event");
                            },
                          ),
                        )
                        // child: Container(
                        //   height: 100,
                        //   width: MediaQuery.of(context).size.width - 100,
                        //   child: Text(
                        //     'Comming Soon',
                        //     style: TextStyle(
                        //         fontSize: 26,
                        //         color: Colors.blue.shade500,
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        ),
                  ],
                  // child: Container(
                  //   height: 300,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: ClipRRect(
                  //     child: Image.asset('pictures1/Final logo .PNG'),
                  //   ),
                  // ),
                )
              ],
            ),
          ),
        ),
        AppThemePapswap().freeboxh(20),
      ],
    );
  }
}