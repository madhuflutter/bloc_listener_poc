part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class StartSearchBlocEvent extends SearchEvent {
  const StartSearchBlocEvent();
  @override
  List<Object> get props => [];
}

class SearchTapEvent extends SearchEvent {
  const SearchTapEvent();
  final String searchText = "";
  @override
  //TODO: implement props
  List<Object> get props => null;
}

class SearchTypeEvent extends SearchEvent {
  const SearchTypeEvent({@required this.searchText});
  final String searchText;
  @override
  //TODO: implement props
  List<Object> get props => null;
}

class SearchProductsEvent extends SearchEvent {
  const SearchProductsEvent({@required this.searchText});
  final String searchText;
  @override
  //TODO: implement props
  List<Object> get props => null;
}

class SearchBackEvent extends SearchEvent {
  const SearchBackEvent();

  @override
  //TODO: implement props
  List<Object> get props => null;
}
