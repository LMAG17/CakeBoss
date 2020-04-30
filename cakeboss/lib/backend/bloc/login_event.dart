import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

// logedout
class LogOut extends LoginEvent{
  final String token;

  LogOut(this.token);
}

//Submittign
class Submitted extends LoginEvent {
  final String email;
  final String password;
  const Submitted({@required this.email, this.password});
  @override
  List<Object> get props => [email, password];
  @override
  String toString() {
    return 'Submitted {email:$email,password:$password}';
  }
}
//Login with email
class LoginWithUserAndPassword extends LoginEvent {
  final String user;
  final String password;
  const LoginWithUserAndPassword({@required this.user, this.password});
  @override
  List<Object> get props => [user, password];
  @override
  String toString() {
    return 'LoginWithUserAndPassword {user:$user,password:$password}';
  }
}