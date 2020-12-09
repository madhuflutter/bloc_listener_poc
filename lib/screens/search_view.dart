import 'package:bloc_listener_poc/searchBloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_bar.dart';
import 'package:flutter/scheduler.dart';

class SearchView extends StatelessWidget {
  TextEditingController _editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print('search view builder function');
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: Colors.orange,
        title: HomeSearchField(
          searchController: _editingController,
          bAutoFocus: true,
          routeName: '/search',
        ),
        actions: <Widget>[],
      ),
      body: BlocListener<SearchBloc, SearchState>(
        listenWhen: (previous, current) {
          if (previous is SearchInProgressState) {
            return true;
          } else {
            return false;
          }
        },
        listener: (context, state) {
          if (state is SearchResultsState) {
            print('search view listener. state is SearchResultsState');

            //after results are calculated (in SearchResultsState),
            //set searchbloc to initial state so that when Search view is called again it behaves as if it is called for the first time

            SchedulerBinding.instance.addPostFrameCallback((_) {
              context.bloc<SearchBloc>().add(StartSearchBlocEvent());
              Navigator.pushNamed(context, '/search_results',
                  arguments: state.searchedProducts);
            });
          }
        },
        child: Container(child: SearchSuggestions()),
      ),
    );
  }
}

class SearchSuggestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('search suggestions build function');

    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state is SearchSuggestionsState) {
        print('search view. state is SearchSuggestionsState');
        return ListView.builder(
            itemCount: state.searchSuggestions.length,
            padding: EdgeInsets.all(2.0),
            itemBuilder: (_, index) {
              //print(snapshot.data[index].suggestion);
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  context.bloc<SearchBloc>().add(SearchProductsEvent(
                      searchText: state.searchSuggestions[index].suggestion));
                },
                child: Text(state.searchSuggestions[index].suggestion,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 10.0)),
              );
            });
      } else if (state is SearchInProgressState) {
        print('search view. state is SearchInProgressState');
        return const CircularProgressIndicator();
      } else {
        print('search view. state is else');
        return Container(
          width: 0,
          height: 0,
        );
      }
    });
  }
}
