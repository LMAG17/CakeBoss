
import 'package:cakeboss/backend/data/dataModel.dart';
import 'package:cakeboss/backend/service/interactor.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


import 'bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {


  @override
  LoginState get initialState => LoginState();

  @override


  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    
    if (event is LoginWithUserAndPassword) {
      yield* _mapLoginWithUserAndPasswordToState(
          user: event.user, password: event.password);
    }
    if (event is LogOut){
      yield* _mapLogOutUserWithToken(token: event.token);
    }
  }

  Stream<LoginState> _mapLoginWithUserAndPasswordToState(
      {String user, String password}) async* {
    yield Loading();
    try {
     var users = await  ServiceInteractor().loginPost(Credentials(user:user,password:password));

      yield Success(users);

    } catch (_) {
      yield Failure();
    }
  }
  Stream<LoginState> _mapLogOutUserWithToken(
    {String token}) async*{
    yield Loading();
    try {
     await  ServiceInteractor().logoutDelete(token);
      yield LogOutSuccess();
    } catch (e) {
      yield Failure();
    }

    }
}
