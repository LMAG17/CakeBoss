import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'backend/authentication_bloc/authentication_bloc.dart';
import 'backend/authentication_bloc/authentication_event.dart';
import 'backend/authentication_bloc/authentication_state.dart';
import 'backend/authentication_bloc/simple_bloc_delegate.dart';
import 'backend/ui/home_screen.dart';
import 'backend/ui/login_screen.dart';
import 'backend/ui/splash_screen.dart';
import 'frontend/src/pages/homepage.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(
    BlocProvider(
      create: (context) =>
          AuthenticationBloc()..add(AppStarted()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/homePage': (context) => HomePage(login: null),
      },
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state is Uninitialized) {
          return SplassScreen();
        }
        if (state is Authenticated) {
          return HomeScreen(
            login: state.user,
          );
        }
        if (state is Unauthenticated) {
          return LoginScreen();
        }
        return Container();
      }),
    );
  }
}