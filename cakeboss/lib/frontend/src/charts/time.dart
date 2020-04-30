
/// Time chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class TimeChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final double height;
  final String title;
  TimeChart({
    @required this.seriesList,
    @required this.height,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: height,
              child: charts.TimeSeriesChart(
                seriesList,
                animate: true,
                dateTimeFactory: const charts.LocalDateTimeFactory(),
                defaultRenderer: charts.LineRendererConfig(
                  includePoints: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}