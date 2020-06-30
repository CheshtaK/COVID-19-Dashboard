import 'package:covid_dashboard/config/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CovidBarChart extends StatelessWidget {
  final List<double> covidCases;

  const CovidBarChart({@required this.covidCases});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Daily New Cases',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 16.0,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    margin: 10.0,
                    showTitles: true,
                    textStyle: Styles.chartLabelsTextStyle,
                    rotateAngle: 35.0,
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 0:
                          return 'June 24';
                        case 1:
                          return 'June 25';
                        case 2:
                          return 'June 26';
                        case 3:
                          return 'June 27';
                        case 4:
                          return 'June 28';
                        case 5:
                          return 'June 29';
                        case 6:
                          return 'June 30';
                        default:
                          return '';
                      }
                    },
                  ),
                  leftTitles: SideTitles(
                    margin: 10.0,
                    showTitles: true,
                    textStyle: Styles.chartLabelsTextStyle,
                    getTitles: (value) {
                      if (value == 0) {
                        return '0';
                      } else if (value % 3 == 0) {
                        return '${value ~/ 3 * 5}K';
                      }
                      return '';
                    },
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  checkToShowHorizontalLine: (value) => value % 3 == 0,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.black12,
                    strokeWidth: 1.0,
                    dashArray: [5],
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: covidCases
                    .asMap()
                    .map((key, value) => MapEntry(
                        key,
                        BarChartGroupData(
                          x: key,
                          barRods: [
                            BarChartRodData(y: value, color: Colors.red),
                          ],
                        )))
                    .values
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
