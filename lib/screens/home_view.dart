import 'package:flutter/material.dart';
import 'app_bar.dart';

class HomeView extends StatelessWidget {
  TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: HomeSearchField(
          searchController: _editingController,
          bAutoFocus: false,
          routeName: '/',
        ),
        elevation: 0.0,
        actions: <Widget>[],
      ),
      body: Container(child: HomeViewBody()),
    );
  }
}

class HomeViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //print('Home view body ');

    return Text('Home Page');
  }
}
