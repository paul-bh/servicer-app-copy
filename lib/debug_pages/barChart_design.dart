import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:servicer/%08modules/getBanner.dart';
import 'package:servicer/MOD_PACKAGES/vertical_barchart-2.0.0+2/vertical-barchartmodel.dart';
import 'package:servicer/MOD_PACKAGES/vertical_barchart-2.0.0+2/vertical-barchart.dart';

class BarChartDesign extends StatefulWidget {
  BarChartDesign({Key? key}) : super(key: key);

  @override
  State<BarChartDesign> createState() => _BarChartDesignState();
}

class _BarChartDesignState extends State<BarChartDesign> {
  List<VBarChartModel> barData = [];
  double _maxValue = 0;

  //! 디버깅용 프리셋값
  double _dbgLabelStartingPoint = 96;
  double _dbgForcedChartLengthMultiplier_multipliedBy1000 = 1.00 * 1000;
  double _dbgBannerWidth = 70;
  double _dbgBannerHeight = 22;
  bool _dbgShowBox = false;

  Map<String, double> shoppingMallExampleData = {
    'kakaoStyle': 7,
    'naverSmartStore': 16,
    'zigzag': 14,
    'hiver': 17,
    'ably': 12,
    'coupang': 20,
    'lookpin': 11,
    'brandi': 9,
  };

  void updateData() {
    setState(() {
      // ANCHOR 정렬
      var mapEntries = shoppingMallExampleData.entries.toList()..sort((b, a) => a.value.compareTo(b.value));
      shoppingMallExampleData
        ..clear()
        ..addEntries(mapEntries);

      //!! ANCHOR 정렬된 쇼핑몰 데이터 맵의 데이터들로 VBarChartModel 객체를 만들어 barData 리스트에 넣는다. 여기서 max값을 찾는다.
      barData.clear();
      shoppingMallExampleData.forEach(
        (key, value) {
          if (_maxValue < value) _maxValue = value.toDouble();
          barData.add(
            VBarChartModel(
              tooltip: value.toInt().toString(),
              label: key,
              $labelWidget: getSmallBannerWithSize(key, _dbgBannerWidth, _dbgBannerHeight, _dbgShowBox), //15
              colors: [Colors.indigo, Colors.red],
              value: value,
              //tooltip:
            ),
          );
        },
      );
    });
  }

  @override
  // !! ANCHOR 값을 먼저 정렬함
  void initState() {
    updateData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            VerticalBarchart(
              maxX: _maxValue,
              data: barData,
              showLegend: true,
              alwaysShowDescription: false,
              showBackdrop: true,
              legend: [],

              $startAnimationDelay: Duration(milliseconds: 300),
              $startAnimationDuration: Duration(milliseconds: 1500),
              $backDropStartAnimationDuration: Duration(milliseconds: 250),
              $startAnimationCurve: Curves.fastLinearToSlowEaseIn,
              $backDropStartAnimationCurve: Curves.easeOutCirc,
              $chartBorderRadius: 4,
              $forcedLabelWidth: _dbgLabelStartingPoint, // 60
              $forcedChartLengthMultiplier: _dbgForcedChartLengthMultiplier_multipliedBy1000 / 1000,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('라벨 차지 영역 보기'),
                Checkbox(
                  value: _dbgShowBox,
                  onChanged: (value) {
                    HapticFeedback.lightImpact();
                    setState(() {
                      _dbgShowBox = !_dbgShowBox;
                      updateData();
                    });
                  },
                ),
              ],
            ),
            Text('라벨 기준점 위치: ${_dbgLabelStartingPoint.toInt()}'),
            Slider(
              min: 0,
              max: 250,
              divisions: (250 / 2).round().toInt(),
              value: _dbgLabelStartingPoint,
              onChanged: (value) {
                HapticFeedback.lightImpact();
                setState(() {
                  _dbgLabelStartingPoint = value;
                });
              },
            ),
            Text('라벨 가로 길이: ${_dbgBannerWidth.round().toInt()}'),
            Slider(
              min: 0,
              max: 300,
              divisions: (300 / 5).toInt(),
              value: _dbgBannerWidth,
              onChanged: (value) {
                HapticFeedback.lightImpact();
                setState(() {
                  _dbgBannerWidth = value;
                  updateData();
                });
              },
            ),
            Text('라벨 세로 길이: ${_dbgBannerHeight.toInt()}'),
            Slider(
              min: 0,
              max: 100,
              divisions: (100 / 2).toInt(),
              value: _dbgBannerHeight,
              onChanged: (value) {
                HapticFeedback.lightImpact();
                setState(() {
                  _dbgBannerHeight = value;
                  updateData();
                });
              },
            ),
            Text('그래프 가로길이 배수: ${_dbgForcedChartLengthMultiplier_multipliedBy1000 / 1000}'),
            Slider(
              min: 0 * 1000,
              max: 2 * 1000,
              divisions: (2000 / 10).toInt(),
              value: _dbgForcedChartLengthMultiplier_multipliedBy1000,
              onChanged: (value) {
                HapticFeedback.lightImpact();
                setState(() {
                  _dbgForcedChartLengthMultiplier_multipliedBy1000 = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
