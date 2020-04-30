
// import 'package:biometric_auth/backend/data/dataModel.dart';
// import 'package:biometric_auth/frontend/custom_grid_view/flutter_staggered_grid_view.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import 'package:sleek_circular_slider/sleek_circular_slider.dart';

// import 'example_view.dart';
// import 'homepage.dart';

// List<Widget> _tiles = const <Widget>[
//   // const _CustomGridCard(
//   //   title: 'Clientes',
//   //   color: Colors.lightBlue,
//   //   iconData: Icons.person_pin_circle,
//   //   destino: ClientesPage(),
//   //   valor: 200,
//   //   meta: 400,
//   //   subtitle: 'Total',
//   // ),
//   const _CustomGridCard(
//     title: 'Ventas',
//     color: Colors.red,
//     iconData: Icons.attach_money,
//     valor: 10542800,
//     meta: 15542800,
//     subtitle: 'Total',
//   ),

//   const _CustomGridCard(
//     title: 'Ventas',
//     color: Colors.blue,
//     iconData: Icons.attach_money,
//     valor: 10542800,
//     meta: 15542800,
//     subtitle: 'Total',
//   ),

//   const _CustomGridCard(
//     title: 'Ventas',
//     color: Colors.green,
//     iconData: Icons.attach_money,
//     valor: 10542800,
//     meta: 15542800,
//     subtitle: 'Total',
//   ),
//   // const _CustomGridCard(
//   //   title: 'Estadisticas',
//   //   color: Colors.amber,
//   //   iconData: Icons.insert_chart,
//   //   destino: MainIndicators(),
//   //   valor: 1020,
//   //   meta: 2020,
//   //   subtitle: 'Facturas',
//   // ),
//   // const _CustomGridCard(
//   //   title: 'Publicidad',
//   //   color: Colors.brown,
//   //   iconData: Icons.public,
//   //   destino: MainIndicators(),
//   //   valor: 1020,
//   //   meta: 1203,
//   //   subtitle: 'Alertas',
//   // ),
//   // const _CustomGridCard(
//   //   title: 'Domiciliarios',
//   //   color: Colors.deepOrange,
//   //   iconData: Icons.send,
//   //   destino: DomiciliariosPage(),
//   //   valor: 4,
//   //   meta: 10,
//   //   subtitle: 'Activos',
//   // ),
//   // const _CustomGridCard(
//   //   title: 'Mapa de calor',
//   //   color: Colors.indigo,
//   //   iconData: Icons.map,
//   //   destino: HeathMapPage(),
//   //   valor: 1,
//   //   meta: 3,
//   //   subtitle: 'Sedes',
//   // ),
// ];

// class MainIndicators extends StatefulWidget {
//   const MainIndicators( Login login);

//   @override
//   _MainIndicatorsState createState() => _MainIndicatorsState();
// }

// class _MainIndicatorsState extends State<MainIndicators> {
//   @override
//   Widget build(BuildContext context) {
//     print(widget);
//     List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
//       const StaggeredTile.count(4, 1.8),
//       const StaggeredTile.count(2, 2.5),
//       const StaggeredTile.count(2, 2),
//       const StaggeredTile.count(2, 2),
//       const StaggeredTile.count(2, 2),
//       const StaggeredTile.count(2, 2),
//     ];
//     Color colorFondo = Colors.white;
//     return Scaffold(
//       backgroundColor: colorFondo,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Theme.of(context).appBarTheme.color,
//         centerTitle: true,
//         title: Text(
//           'Indicadores Globales',
//           style: Theme.of(context).appBarTheme.textTheme.title,
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 12.0),
//         child: StaggeredGridView.count(
//           physics: NeverScrollableScrollPhysics(),
//           crossAxisCount: 4,
//           staggeredTiles: _staggeredTiles,
//           children: _tiles,
//           mainAxisSpacing: 4.0,
//           crossAxisSpacing: 4.0,
//           padding: const EdgeInsets.all(4.0),
//         ),
//       ),
//       bottomNavigationBar: Container(
//         height: 60,
//         color: Theme.of(context).appBarTheme.color,
//         child: InkWell(
//           onTap: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(builder: (BuildContext context) => HomePage()),
//             );
//           },
//           child: Padding(
//             padding: EdgeInsets.only(top: 8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Icon(
//                   Icons.home,
//                   color: Theme.of(context).appBarTheme.textTheme.body1.color,
//                 ),
//                 SizedBox(width: 10),
//                 Text(
//                   'Detalles',
//                   style: TextStyle(
//                       fontSize: 20,
//                       color:
//                           Theme.of(context).appBarTheme.textTheme.body1.color),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _CustomGridCard extends StatelessWidget {
//   const _CustomGridCard(
//       {this.title,
//       this.color,
//       this.iconData,
//       this.valor,
//       this.meta,
//       this.subtitle});

//   final String title;
//   final Color color;
//   final IconData iconData;
//   final double valor;
//   final double meta;
//   final String subtitle;
//   @override
//   Widget build(BuildContext context) {
//     final formato = NumberFormat('#,###');
//     final colorFondo = Colors.white;
//     var colorContenido = color /*Color.fromRGBO(219, 202, 72, 1)*/;

//     final customWidth02 =
//         CustomSliderWidths(trackWidth: 1, progressBarWidth: 2);
//     final customColors02 = CustomSliderColors(
//         trackColor: Colors.grey,
//         progressBarColor: colorContenido,
//         hideShadow: true);

//     final info02 = InfoProperties(
//         topLabelStyle: TextStyle(
//             color: colorContenido, fontSize: 22, fontWeight: FontWeight.w600),
//         topLabelText: '$subtitle',
//         bottomLabelStyle: TextStyle(
//             color: Colors.grey,
//             fontSize: title == 'Ventas' ? 10 : 14,
//             fontWeight: FontWeight.w300),
//         bottomLabelText: title == 'Ventas'
//             ? 'Meta : \$${(formato.format(meta))}'
//             : 'Meta : ${(formato.format(meta))}',
//         mainLabelStyle: TextStyle(
//             color: colorContenido,
//             fontSize: title == 'Ventas' ? 20 : 24,
//             fontWeight: FontWeight.w100),
//         modifier: (double value) {
//           final values = (valor).toInt();

//           return title == 'Ventas'
//               ? '\$${formato.format(values)}'
//               : '${formato.format(values)}';
//         });

//     final CircularSliderAppearance appearance02 = CircularSliderAppearance(
//       customWidths: customWidth02,
//       customColors: customColors02,
//       infoProperties: info02,
//       startAngle: 180,
//       angleRange: 270,
//       spinnerDuration: 9000,
//       animationEnabled: true,
//     );
//     final viewModel02 = ExampleViewModel(
//         appearance: appearance02,
//         min: 0,
//         max: meta,
//         value: valor,
//         pageColors: [colorFondo, Colors.black87]);
//     final example02 = ExamplePage(
//       viewModel: viewModel02,
//     );
//     return Card(
//       borderOnForeground: true,
//       elevation: 8,
//       shape: RoundedRectangleBorder(
//           side: BorderSide(
//             color: colorContenido,
//             width: 2,
//           ),
//           borderRadius: BorderRadius.circular(8)),
//       color: colorFondo,
//       child: InkWell(
//         // onTap: () => null,
//         child: Center(
//           child: Padding(
//               padding: const EdgeInsets.all(4.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Text(
//                     '$title',
//                     style: TextStyle(
//                         color: colorContenido,
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   Expanded(
//                     child: example02,
//                   ),
//                 ],
//               )),
//         ),
//       ),
//     );
//   }
// }
