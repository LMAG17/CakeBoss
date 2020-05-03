import 'package:cakeboss/backend/data/dataModel.dart';
import 'package:equatable/equatable.dart';


class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

// Cuatro estados:
// - Cargando, loading
class Loading extends LoginState {}

// - Falla, failure
class Failure extends LoginState {}

// - Exito, success
class Success extends LoginState {
  final Login user;

  Success(this.user);
}
class LogOutSuccess extends LoginState {

}