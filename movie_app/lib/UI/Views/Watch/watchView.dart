import 'package:flutter/material.dart';

import 'package:movie_app/Core/ViewModel/Watch%20View%20Model/watchViewModel.dart';
import 'package:movie_app/UI/serviceLocator.dart';
import 'package:stacked/stacked.dart';

class WatchView extends StatefulWidget {
  const WatchView({Key? key}) : super(key: key);

  @override
  State<WatchView> createState() => _WatchViewState();
}

class _WatchViewState extends State<WatchView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WatchViewModel>.reactive(
        viewModelBuilder: () => serviceLocator<WatchViewModel>(),
        onViewModelReady: (viewmodel) => viewmodel.fetchMovies(),
        builder: (context, viewmodel, _) => Scaffold(
              backgroundColor: const Color.fromARGB(0, 238, 238, 242),
              appBar: AppBar(
                toolbarHeight: 100,
                title: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Watch',
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
                            onTap: () {
                              viewmodel.openMovieDetails(movies.id.toString());
                            },
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
