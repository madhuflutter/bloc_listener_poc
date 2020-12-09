import 'dart:core';
import 'package:bloc/bloc.dart';
import 'package:bloc_listener_poc/searchBloc/search_bloc.dart';
import 'package:bloc_listener_poc/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_listener_poc/core/router.dart' as appRouter;

import 'dart:async';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();
  runApp(new InitializeApp());
}

class InitializeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShoppingAppStfl();
  }
}

class ShoppingAppStfl extends StatefulWidget {
  @override
  _ShoppingAppStflState createState() => _ShoppingAppStflState();
}

class _ShoppingAppStflState extends State<ShoppingAppStfl> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchBloc>(
          create: (_) => SearchBloc()..add(StartSearchBlocEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: appRouter.Router.generateRoute,
      ),
    );
  }
}
