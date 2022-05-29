import 'package:flutter/material.dart';
import 'package:servicer/debug_pages/ui_test_page.dart';

final String _MODE_ = 'UITEST';
//! UITEST: 메인화면에서 UI 요소들을 보고 싶을 때 사용

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: (_MODE_ == 'UITEST') ? UITestPage() : Container(),
    );
  }
}
