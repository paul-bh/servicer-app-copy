import 'package:flutter/material.dart';
import 'package:servicer/debug_pages/barChart_design.dart';
import 'package:servicer/debug_pages/lineChart_design.dart';
import 'package:servicer/main_pages/start_page.dart';

class UITestPage extends StatefulWidget {
  UITestPage({Key? key}) : super(key: key);

  @override
  State<UITestPage> createState() => _UITestPageState();
}

class _UITestPageState extends State<UITestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UI 테스트 페이지')),
      body: ListView(
        children: [
          ElevatedButton(
            child: Text('메인 페이지'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => StartPage()));
            },
          ),
          ElevatedButton(
            child: Text('선그래프 애니메이션 테스트'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => GraphDesignPage()));
            },
          ),
          ElevatedButton(
            child: Text('가로방향 막대그래프 테스트'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BarChartDesign()));
            },
          ),
        ],
      ),
    );
  }
}
