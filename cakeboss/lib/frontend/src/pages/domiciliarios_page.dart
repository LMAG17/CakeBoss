import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DomiciliariosPage extends StatelessWidget {
  const DomiciliariosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    var dataDomiciliarios = [
      Domiciliario('Disponible', 4, Colors.green),
      Domiciliario('Off-Line', 6, Colors.red),
      Domiciliario('Ocupado', 5, Colors.amber),
    ];
    List<charts.Series<Domiciliario, String>> _dataDomiciliarios() {
      return [
        charts.Series<Domiciliario, String>(
          id: 'Domiciiliarios',
          data: dataDomiciliarios,
          domainFn: (Domiciliario domiciliario, __) =>
              domiciliario.disponibilidad,
          measureFn: (Domiciliario domiciliario, __) => domiciliario.cantidad,
          labelAccessorFn: (Domiciliario domiciliario, _) {
            return '${domiciliario.cantidad}';
          },
          colorFn: (Domiciliario domiciliario, __) =>
              charts.ColorUtil.fromDartColor(domiciliario.color),
        ),
      ];
    }

    var dataServicios = [
      Servicios('Finalizazdos', 4, Colors.green),
      Servicios('Cancelados', 6, Colors.red),
    ];
    List<charts.Series<Servicios, String>> _dataServicios() {
      return [
        charts.Series<Servicios, String>(
          id: 'Domiciiliarios',
          data: dataServicios,
          domainFn: (Servicios service, __) => service.service,
          measureFn: (Servicios service, __) => service.value,
          labelAccessorFn: (Servicios service, _) {
            return '${service.value}';
          },
          colorFn: (Servicios service, __) =>
              charts.ColorUtil.fromDartColor(service.color),
        ),
      ];
    }

    var dataTimes = [
      Times('En ruta', 23, Colors.lightBlue),
      Times('Alistamiento', 6, Colors.red),
      Times('Leggada a PDV', 3, Colors.orange),
      Times('Asignacion', 30, Colors.yellow),
      Times('Gestion', 30, Colors.green),
    ];
    List<charts.Series<Times, String>> _dataTimes() {
      return [
        charts.Series<Times, String>(
          id: 'Domiciiliarios',
          data: dataTimes,
          domainFn: (Times time, __) => time.tipe,
          measureFn: (Times time, __) => time.minutes,
          labelAccessorFn: (Times time, _) {
            return '${time.minutes}';
          },
          colorFn: (Times time, __) =>
              charts.ColorUtil.fromDartColor(time.color),
        ),
      ];
    }

    var dataServiceForHour = [
      ServiceForHour('1hr', 23, Colors.lightBlue),
      ServiceForHour('2hr', 6, Colors.red),
      ServiceForHour('3hr', 3, Colors.orange),
      ServiceForHour('4hr', 30, Colors.yellow),
      ServiceForHour('5hr', 30, Colors.green),
    ];
    List<charts.Series<ServiceForHour, String>> _dataServiceForHour() {
      return [
        charts.Series<ServiceForHour, String>(
          id: 'Domiciiliarios',
          data: dataServiceForHour,
          domainFn: (ServiceForHour service, __) => service.hour,
          measureFn: (ServiceForHour service, __) => service.services,
          labelAccessorFn: (ServiceForHour service, _) {
            return '${service.services}';
          },
          colorFn: (ServiceForHour service, __) =>
              charts.ColorUtil.fromDartColor(service.color),
        ),
      ];
    }

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text('Domiciliarios'),
                ),
                Tab(
                  child: Text('Servicios'),
                ),
              ],
            ),
            title: Text('Domiciliarios'),
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Card(
                    elevation: 8,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Cantidad de Domiciliarios',
                              style: titleStyle,
                            ),
                          ),
                        ),
                        Container(
                          height: 400,
                          child: charts.PieChart(
                            _dataDomiciliarios(),
                            animate: true,
                            behaviors: [
                              charts.DatumLegend(
                                horizontalFirst: false,
                                showMeasures: true,
                                desiredMaxColumns: 1,
                                outsideJustification:
                                    charts.OutsideJustification.start,
                                legendDefaultMeasure:
                                    charts.LegendDefaultMeasure.firstValue,
                              ),
                            ],
                            defaultRenderer: charts.ArcRendererConfig(
                                arcRendererDecorators: [
                                  charts.ArcLabelDecorator(
                                      labelPosition:
                                          charts.ArcLabelPosition.auto),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 16),
                        Center(
                            child: Text(
                          'Cantidad de Domiciliarios',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                        SizedBox(height: 16),
                        DataTable(
                          columnSpacing:
                              MediaQuery.of(context).size.width * 0.05,
                          columns: [
                            DataColumn(label: Text('Estado')),
                            DataColumn(label: Text('Sede')),
                            DataColumn(label: Text('Nombre')),
                          ],
                          rows: [
                            DataRow(
                              selected: true,
                              cells: [
                                DataCell(Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle),
                                )),
                                DataCell(Text('Bogota Cedritos')),
                                DataCell(Text('Alejo Muñoz')),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                )),
                                DataCell(Text('Bogota Chapinero')),
                                DataCell(Text('Pedro cortez')),
                              ],
                            ),
                            DataRow(
                              selected: true,
                              cells: [
                                DataCell(Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                )),
                                DataCell(Text('Bogota Plaza')),
                                DataCell(Text('Mauricio Castro')),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      shape: BoxShape.circle),
                                )),
                                DataCell(Text('Bogota Kennedy')),
                                DataCell(Text('Felipe Sanchez')),
                              ],
                            ),
                            DataRow(
                              selected: true,
                              cells: [
                                DataCell(Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      shape: BoxShape.circle),
                                )),
                                DataCell(Text('Chia')),
                                DataCell(Text('Javier Garcia')),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                )),
                                DataCell(Text('Cartagena')),
                                DataCell(Text('Fidel Carreño')),
                              ],
                            ),
                            DataRow(
                              selected: true,
                              cells: [
                                DataCell(Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle),
                                )),
                                DataCell(Text('Bog. Centro Mayor')),
                                DataCell(Text('Ricardo Romero')),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle),
                                )),
                                DataCell(Text('Bogota Fontibon')),
                                DataCell(Text('Carlos Murcia')),
                              ],
                            ),
                            DataRow(
                              selected: true,
                              cells: [
                                DataCell(Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      shape: BoxShape.circle),
                                )),
                                DataCell(Text('Bogota Suba')),
                                DataCell(Text('Pedro fonseca')),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle),
                                )),
                                DataCell(Text('Medellin')),
                                DataCell(Text('Manuel Cubillos')),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Card(
                    elevation: 8,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Estados de los servicios',
                            style: titleStyle,
                          ),
                        ),
                        Container(
                          height: 400,
                          child: charts.PieChart(
                            _dataServicios(),
                            animate: true,
                            behaviors: [
                              charts.DatumLegend(
                                horizontalFirst: false,
                                showMeasures: true,
                                desiredMaxColumns: 1,
                                outsideJustification:
                                    charts.OutsideJustification.start,
                                legendDefaultMeasure:
                                    charts.LegendDefaultMeasure.firstValue,
                              ),
                            ],
                            defaultRenderer: charts.ArcRendererConfig(
                                arcRendererDecorators: [
                                  charts.ArcLabelDecorator(
                                      labelPosition:
                                          charts.ArcLabelPosition.auto),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 8,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Promedio tiempos de gestion',
                            style: titleStyle,
                          ),
                        ),
                        Container(
                          height: 400,
                          child: charts.BarChart(
                            _dataTimes(),
                            vertical: false,
                            animate: true,
                            primaryMeasureAxis: charts.NumericAxisSpec(
                              tickProviderSpec:
                                  charts.BasicNumericTickProviderSpec(
                                      desiredMinTickCount: 5),
                            ),
                            behaviors: [
                              charts.DatumLegend(
                                horizontalFirst: false,
                                showMeasures: true,
                                desiredMaxColumns: 1,
                                outsideJustification:
                                    charts.OutsideJustification.start,
                                legendDefaultMeasure:
                                    charts.LegendDefaultMeasure.firstValue,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 8,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Servicios por hora',
                            style: titleStyle,
                          ),
                        ),
                        Container(
                          height: 400,
                          child: charts.BarChart(
                            _dataServiceForHour(),
                            animate: true,
                            primaryMeasureAxis: charts.NumericAxisSpec(
                              tickProviderSpec:
                                  charts.BasicNumericTickProviderSpec(
                                      desiredMinTickCount: 5),
                            ),
                            behaviors: [
                              charts.DatumLegend(
                                horizontalFirst: false,
                                showMeasures: true,
                                desiredMaxColumns: 1,
                                outsideJustification:
                                    charts.OutsideJustification.start,
                                legendDefaultMeasure:
                                    charts.LegendDefaultMeasure.firstValue,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class Domiciliario {
  final String disponibilidad;
  final int cantidad;
  final Color color;
  Domiciliario(this.disponibilidad, this.cantidad, this.color);
}

class Servicios {
  final String service;
  final int value;
  final Color color;

  Servicios(this.service, this.value, this.color);
}

class Times {
  final String tipe;
  final int minutes;
  final Color color;

  Times(this.tipe, this.minutes, this.color);
}

class ServiceForHour {
  final String hour;
  final int services;
  final Color color;

  ServiceForHour(this.hour, this.services, this.color);
}