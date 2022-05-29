import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:servicer/%08modules/getBanner.dart';
import 'package:servicer/MOD_PACKAGES/vertical_barchart-2.0.0+2/vertical-barchartmodel.dart';
import 'package:servicer/MOD_PACKAGES/vertical_barchart-2.0.0+2/vertical-barchart.dart';
import 'package:servicer/sample_data/getdata.dart';

class MainPageSalesStatusBarChart extends StatefulWidget {
  MainPageSalesStatusBarChart({Key? key}) : super(key: key);

  @override
  State<MainPageSalesStatusBarChart> createState() => _MainPageSalesStatusBarChartState();
}

class _MainPageSalesStatusBarChartState extends State<MainPageSalesStatusBarChart> {
  @override
  Widget build(BuildContext context) {
    List<VBarChartModel> barData = [];
    double _maxValue = 0;
    Map<String, double> receivedData = {};
    return FutureBuilder(
      future: simulateGetData('mainBarChart'),
      builder: ((BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) return CircularProgressIndicator();
        receivedData = snapshot.data;
        var mapEntries = receivedData.entries.toList()..sort((b, a) => a.value.compareTo(b.value));
        receivedData
          ..clear()
          ..addEntries(mapEntries);
        barData.clear();
        receivedData.forEach(
          (key, value) {
            if (_maxValue < value) _maxValue = value.toDouble();
            barData.add(
              VBarChartModel(
                tooltip: value.toInt().toString(),
                label: key,
                $labelWidget: getSmallBannerWithSize(key, 65, 20, false), //15
                colors: [Colors.indigo, Colors.red],
                value: value,
                //tooltip:
              ),
            );
          },
        );
        return VerticalBarchart(
          maxX: _maxValue,
          data: barData,
          showLegend: true,
          alwaysShowDescription: false,
          showBackdrop: true,
          legend: [],

          $startAnimationDelay: Duration(milliseconds: 50),
          $startAnimationDuration: Duration(milliseconds: 1500),
          $backDropStartAnimationDuration: Duration(milliseconds: 250),
          $startAnimationCurve: Curves.fastLinearToSlowEaseIn,
          $backDropStartAnimationCurve: Curves.easeOutCirc,
          $chartBorderRadius: 4,
          $forcedLabelWidth: 90, // NOTE 가로 위치임
          $forcedChartLengthMultiplier: 1.04, //? 왠지 모르겠지만 최대 길이....
        );
      }),
    );
  }
}
