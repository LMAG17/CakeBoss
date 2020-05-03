import 'package:cakeboss/backend/data/dataModel.dart';
import 'package:equatable/equatable.dart';

abstract class SalesEvent extends Equatable {
  const SalesEvent();
  @override
  List<Object> get props => [];
}

class FetchData extends SalesEvent {
  final Login establisment;

  FetchData(this.establisment);
}
