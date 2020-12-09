import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:bloc_listener_poc/models/product.dart';
import 'package:bloc_listener_poc/models/search_suggestion.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchNoState());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    List<SearchSuggestionModel> _searchSuggestions = [];
    List<Product> _searchProducts = [];
    if (event is StartSearchBlocEvent) {
      yield SearchNoState();
    } else if (event is SearchTapEvent) {
      _searchSuggestions.add(SearchSuggestionModel(suggestion: 'suggestion 1'));
      _searchSuggestions.add(SearchSuggestionModel(suggestion: 'suggestion 2'));
      yield SearchSuggestionsState(
          searchText: event.searchText, searchSuggestions: _searchSuggestions);
    } else if (event is SearchTypeEvent) {
      _searchSuggestions.add(SearchSuggestionModel(suggestion: 'suggestion 1'));
      _searchSuggestions.add(SearchSuggestionModel(suggestion: 'suggestion 2'));
      yield SearchSuggestionsState(
          searchText: event.searchText, searchSuggestions: _searchSuggestions);
    } else if (event is SearchProductsEvent) {
      yield SearchInProgressState();
      _searchProducts.add(Product(title: 'product 1'));
      _searchProducts.add(Product(title: 'product 2'));
      yield SearchResultsState(
          searchText: event.searchText, searchedProducts: _searchProducts);
    } else if (event is SearchBackEvent) {
      yield SearchNoState();
    }
  }
}
