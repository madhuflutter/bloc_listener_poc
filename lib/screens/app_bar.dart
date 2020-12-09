import 'package:bloc_listener_poc/searchBloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class HomeSearchField extends StatelessWidget {
  final TextEditingController searchController;
  final bool bAutoFocus;
  final String routeName;
  HomeSearchField(
      {@required this.searchController,
      @required this.bAutoFocus,
      @required this.routeName});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: bAutoFocus,
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      onTap: () {
        if (routeName != '/search') {
          context.bloc<SearchBloc>().add(SearchTapEvent());
          Navigator.pushNamed(context, "/search");
        }
      },
      onChanged: (String value) {
        print("search changed event");
        context.bloc<SearchBloc>().add(SearchTypeEvent(searchText: value));
      },
      onSubmitted: (String value) {
        print("search submitted event");
        FocusScope.of(context).unfocus();
        if (value.isEmpty) {
          FocusScope.of(context).unfocus();
          searchController.clear();
          context.bloc<SearchBloc>().add(SearchBackEvent());

          Navigator.pop(context);
        } else {
          context
              .bloc<SearchBloc>()
              .add(SearchProductsEvent(searchText: value));
        }
      },
      style: TextStyle(color: Colors.black),
      controller: searchController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          fillColor: Colors.white,
          filled: true,
          //hintText: "Search Snapsale",
          hintText: 'search app',
          hintStyle: TextStyle(color: Colors.black87),
          focusColor: Colors.black),
    );
  }
}
