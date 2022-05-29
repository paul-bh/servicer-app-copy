import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:servicer/design_standards/colors.dart';
import 'package:servicer/design_standards/text_styles.dart';
import 'package:servicer/design_standards/widget_styles.dart.dart';
import 'package:servicer/sub_widgets/mainPage_SalesStatus_barchart.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            // 중간에 잘린 배경색
            Container(
              color: $$mainColor2,
              width: double.infinity,
              height: 300,
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 24),
                      child: Row(
                        children: [
                          Flexible(
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: $$mainColor1,
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  height: 28,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text('공지'),
                                      margin: EdgeInsets.symmetric(horizontal: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                      ),
                                      height: 20,
                                      width: 50,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 1),
                                      child: Text(
                                        '새 기능이 추가되었습니다',
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Badge(
                            badgeContent: Text('3', style: TextStyle(color: Colors.white)),
                            child: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.notifications_outlined,
                                color: Colors.white,
                                size: $bigFontSize,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      '서비서 님, 좋은 아침이에요! ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: $bigFontSize,
                      ),
                    ),
                    Text(
                      '이번 달 판매 현황 >',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: $mediumFontSize,
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 24)),
                    Card(
                      elevation: $cardMenuElevation,
                      shape: $cardMenuShape,
                      margin: $cardMenuVerticalMargin,
                      child: SizedBox(
                        height: 120,
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Icon(Icons.fullscreen, size: 75), Text('asdf')],
                                  )),
                            ),
                            Container(
                              child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Icon(Icons.fullscreen, size: 75), Text('asdf')],
                                  )),
                            ),
                            Container(
                              child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Icon(Icons.fullscreen, size: 75), Text('asdf')],
                                  )),
                            ),
                            Container(
                              child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Icon(Icons.fullscreen, size: 75), Text('asdf')],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: $cardMenuElevation,
                      shape: $cardMenuShape,
                      margin: $cardMenuVerticalMargin,
                      child: Container(
                        margin: $cardMenuContainerMargin,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('이번 주 매출'),
                                SizedBox(width: 10),
                                Text('768,700 원', style: TextStyle(fontSize: $bigNumberSize, fontWeight: FontWeight.bold)),
                                Spacer(),
                                FittedBox(
                                  child: InkWell(
                                    child: const Padding(
                                      padding: EdgeInsets.all(6), //* 카드 세로 길이에 영향 주지 않는 최소 패딩값임.
                                      child: Text('바로 보기 >'),
                                    ),
                                    onTap: () {},
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: $cardMenuElevation,
                      shape: $cardMenuShape,
                      margin: $cardMenuVerticalMargin,
                      child: Container(
                        padding: EdgeInsets.zero,
                        margin: $cardMenuContainerMargin,
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(child: Text('쇼핑몰 주문 현황'), alignment: Alignment.topLeft),
                            Padding(padding: EdgeInsets.symmetric(vertical: 6)),
                            Center(
                              child: Container(
                                child: MainPageSalesStatusBarChart(),
                                alignment: Alignment.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
