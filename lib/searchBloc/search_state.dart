part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchStartState extends SearchState {
  const SearchStartState(
      {@required this.searchText, @required this.searchSuggestions});
  final String searchText;
  final List<SearchSuggestionModel> searchSuggestions;
  @override
  //TODO: implement props
  List<Object> get props => [searchText, searchSuggestions];
}

class SearchSuggestionsState extends SearchState {
  const SearchSuggestionsState(
      {@required this.searchText, this.searchSuggestions});
  final String searchText;
  final List<SearchSuggestionModel> searchSuggestions;
  @override
  //TODO: implement props
  List<Object> get props => [searchText, searchSuggestions];
}

class SearchInProgressState extends SearchState {
  const SearchInProgressState();
  @override
  //TODO: implement props
  List<Object> get props => [];
}

class SearchResultsState extends SearchState {
  const SearchResultsState(
      {@required this.searchText, @required this.searchedProducts});
  final String searchText;
  final List<Product> searchedProducts;
  @override
  //TODO: implement props
  List<Object> get props => [searchText, searchedProducts];
}

class SearchNoState extends SearchState {
  @override
  //TODO: implement props
  List<Object> get props => null;
}
