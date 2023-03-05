import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Core/Configs/enum.dart';
import 'package:movie_app/Core/ViewModel/Search%20View%20Model/searchViewModel.dart';
import 'package:movie_app/Core/ViewModel/Watch%20View%20Model/watchViewModel.dart';
import 'package:movie_app/UI/Widgets/genreTile.dart';
import 'package:movie_app/UI/serviceLocator.dart';
import 'package:stacked/stacked.dart';

import '../../../Core/Models/Genres.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key, this.navigationFlow}) : super(key: key);

  final NavigationFlow? navigationFlow;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    FocusNode inputNode = FocusNode();

    void openKeyboard() {
      FocusScope.of(context).requestFocus(inputNode);
    }

    return ViewModelBuilder<SearchViewModel>.reactive(
      viewModelBuilder: () => serviceLocator<SearchViewModel>(),
      builder: (context, viewmodel, _) => Scaffold(
        backgroundColor: Color.fromARGB(237, 221, 216, 216),
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 100,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          automaticallyImplyLeading: false,
          // The search area here
          title: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(129, 219, 219, 223),
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: TextField(
                  focusNode: inputNode,
                  autofocus: true,
                  controller: _searchController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          Navigator.pop(context);
                        },
                      ),
                      hintText: 'Tv Shown, movies and more',
                      border: InputBorder.none),
                  onSubmitted: (value) async {
                    await viewmodel.openSearchResultDetails(value);
                  },
                ),
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 28 / 16),
                children: [
                  for (var i = 0; i < viewmodel.genres.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GenreTile(
                        genre: viewmodel.genres[i],
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
