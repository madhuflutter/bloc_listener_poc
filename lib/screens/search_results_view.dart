import 'package:bloc_listener_poc/models/product.dart';
import 'package:flutter/material.dart';
import 'app_bar.dart';

class SearchResultsView extends StatelessWidget {
  TextEditingController _editingController = TextEditingController();
  final List<Product> searchedProducts;
  SearchResultsView({@required this.searchedProducts});

  @override
  Widget build(BuildContext context) {
    print('search results view builder function');
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: Colors.orange,
        title: HomeSearchField(
          searchController: _editingController,
          bAutoFocus: false,
          routeName: '/search_results',
        ),
        actions: <Widget>[],
      ),
      body: Container(
          child: SearchProductsList(
        searchedProducts: searchedProducts,
      )),
      //bottomNavigationBar: BottomNavigBar(0),
    );
  }
}

class SearchProductsList extends StatelessWidget {
  final List<Product> searchedProducts;
  SearchProductsList({@required this.searchedProducts});

  @override
  Widget build(BuildContext context) {
    print('search results view - search products list builder function');

    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            itemCount: searchedProducts.length,
            itemBuilder: (BuildContext context, int index) {
              Product product = searchedProducts[index];
              return Text(product.title);
            },
          ),
        ),
      ],
    );
  }
}
