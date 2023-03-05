import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/Core/Models/Movies/MovieDetails/movieDetails.dart';
import 'package:movie_app/Core/Models/movieUpcomingModel.dart';
import 'package:movie_app/Core/ViewModel/Search%20View%20Model/searchResultViewModel.dart';
import 'package:movie_app/Core/ViewModel/Watch%20View%20Model/watchViewModel.dart';
import 'package:movie_app/UI/serviceLocator.dart';
import 'package:stacked/stacked.dart';

import '../../../Core/Configs/enum.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key, this.movieDetails, this.navigationFlow});

  final MovieUpcomingModel? movieDetails;
  final NavigationFlow? navigationFlow;

  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchResultViewModel>.reactive(
        viewModelBuilder: () => serviceLocator<SearchResultViewModel>(),
        onViewModelReady: (viewmodel) {
          viewmodel.movies = movieDetails;
        },
        builder: (context, viewmodel, _) => Scaffold(
              backgroundColor: const Color.fromARGB(0, 238, 238, 242),
              appBar: AppBar(
                leading: const BackButton(
                  color: Colors.black,
                ),
                toolbarHeight: 100,
                title: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Results Found',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
                elevation: 0.0,
                automaticallyImplyLeading: false,
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        onPressed: () async {}),
                  )
                ],
              ),
              body: (viewmodel.isBusy)
                  ? const LinearProgressIndicator()
                  : ListView.builder(
                      itemCount: viewmodel.movies?.results?.length ?? 0,
                      itemBuilder: (movies, index) {
                        final movies = viewmodel.movies!.results![index];
                        return GestureDetector(
                            child: makeMovieCard(
                                title: movies.title,
                                image: movies.backdropPath));
                      },
                    ),
            ));
  }

  Widget makeMovieCard({title, image}) {
    return Container(
      height: 200,
      margin: const EdgeInsets.all(14),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
