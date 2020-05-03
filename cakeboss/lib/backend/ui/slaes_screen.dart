import 'package:cakeboss/backend/data/dataModel.dart';
import 'package:cakeboss/backend/sales_bloc/sales_bloc.dart';
import 'package:cakeboss/frontend/src/pages/sales_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesScreen extends StatelessWidget {
  final Login login;

  SalesScreen({Key key, this.login}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SalesBloc>(
      create: (context) => SalesBloc(),
      child: SalesPage(
        login: login,
      ),
    );
  }
}
