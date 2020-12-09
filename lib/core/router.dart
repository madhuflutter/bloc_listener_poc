import 'package:bloc_listener_poc/models/product.dart';
import 'package:bloc_listener_poc/screens/home_view.dart';
import 'package:bloc_listener_poc/screens/search_results_view.dart';
import 'package:bloc_listener_poc/screens/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const String initialRoute = "login";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    print('inside router with ' + settings.name);

    switch (settings.name) {

      case '/':

        return MaterialPageRoute(
            settings: settings, builder: (_) => HomeView());
      case '/search':

        return MaterialPageRoute(
            settings: settings, builder: (_) => SearchView());
      case '/search_results':
        List<Product> _searchedProducts = settings.arguments;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => SearchResultsView(
                  searchedProducts: _searchedProducts,
                ));

      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
