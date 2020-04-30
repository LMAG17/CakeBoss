

/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final double height;
  final String title;
  final String buttonTitle;
  final bool button;
  BarChart({
    @required this.seriesList,
    @required this.height,
    @required this.title,
    this.buttonTitle,
    @required this.button,
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
            button
                ? RaisedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            // return _DialogForLists(
                            //     items: dataProducts,
                            //     selectedItems: dataProducts2,
                            //     onSelectedItemListChanged: (cities) {
                            //       setState(() {
                            //         dataProducts2 = cities;
                            //       });
                            //       print(dataProducts2);
                            //     });
                          });
                    },
                    child: Text(
                      'Elegir Productos',
                    ),
                  )
                : SizedBox(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: height,
              child: charts.BarChart(
                seriesList,
                vertical: false,
                animate: true,
                barRendererDecorator: charts.BarLabelDecorator<String>(),
                domainAxis:
                    charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}