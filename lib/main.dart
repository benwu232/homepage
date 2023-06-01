import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:yelwinoo/presentation/configs/configs.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

import 'presentation/utils/custom_scroll_behaviour.dart';
import 'presentation/views/home/home_page.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ye-Lwin-Oo',
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: context.theme(),
      home: const HomePage(),
    );
  }
}