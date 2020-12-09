import 'package:flutter/cupertino.dart';

class SearchHistoryModel {
  SearchHistoryModel({@required this.category, @required this.searchText});
  final String category;
  final String searchText;

  /*factory SearchHistoryModel.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }    
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }
  */
}
