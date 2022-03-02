// import 'package:btm/utils/colors.dart';
import 'package:btm/responsive/responsive_layout.dart';
import 'package:btm/responsive/web_layout.dart';
import 'package:btm/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'responsive/mobile_layout.dart';

Future main() async {
  await dotenv.load(fileName: ".environment");
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
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
            scaffoldBackgroundColor: mobileBackgroundColor
            ),
        home: ResponsiveLayout(
            webScreen: WebScreenLayout(), mobileScreen: MobileScreenLayout()));
  }
}
