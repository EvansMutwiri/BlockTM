// import 'package:btm/utils/colors.dart';
import 'package:btm/responsive/responsive_layout.dart';
import 'package:btm/responsive/web_layout.dart';
import 'package:flutter/material.dart';

import 'responsive/mobile_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Block TM',
      theme: ThemeData.dark().copyWith(
        // scaffoldBackgroundColor: mobileBackgroundColor
      ),
      home: const ResponsiveLayout(
        webScreen: WebScreenLayout(), mobileScreen: MobileScreenLayout())
    );
  }
}

