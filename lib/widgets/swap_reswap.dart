// ignore_for_file: prefer_const_literals_to_create_immutables, unused_import, prefer_const_constructors, prefer_typing_uninitialized_variables

// import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:papswap/widgets/reswap_screen.dart';
import 'package:papswap/widgets/styling.dart';
import 'package:http/http.dart' as http;

class ReSwap extends StatefulWidget {
  final link;
  const ReSwap({
    Key? key,
    required this.link,
  }) : super(key: key);

  @override
  State<ReSwap> createState() => _ReSwapState();
}

class _ReSwapState extends State<ReSwap> {
  @override
  Widget build(BuildContext context) {
    // print(78);
    // print(widget.link);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppThemePapswap().freeboxh(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppThemePapswap().freeboxw(180),
            Container(
              height: 6,
              width: 40,
              decoration: BoxDecoration(
                color: Color.fromARGB(231, 186, 183, 183),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            AppThemePapswap().freeboxh(26),
          ],
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ReSwapScreen(
                  link: widget.link,
                ),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppThemePapswap().freeboxw(22),
              Icon(
                Icons.swap_horiz,
                size: 30,
                color: Color.fromARGB(255, 100, 99, 99),
              ),
              AppThemePapswap().freeboxw(18),
              Column(
                children: [
                  AppThemePapswap().freeboxh(4),
                  Text(
                    'Reswap',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 49, 49, 49),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              // AppThemePapswap().freeboxh(20),
            ],
          ),
        ),
        AppThemePapswap().freeboxh(24),
      ],
    );
  }
}