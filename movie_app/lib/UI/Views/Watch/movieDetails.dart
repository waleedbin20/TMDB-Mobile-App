import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/Core/Configs/enum.dart';
import 'package:movie_app/Core/Models/Movies/MovieDetails/movieDetails.dart';
import 'package:movie_app/Core/ViewModel/Watch%20View%20Model/movieDetailsViewModel.dart';
import 'package:movie_app/UI/Views/Watch/watchView.dart';
import 'package:movie_app/UI/Widgets/movieWatchButton.dart';
import 'package:movie_app/UI/serviceLocator.dart';
import 'package:stacked/stacked.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({
    Key? key,
    required this.movieDetails,
    this.navigationFlow,
  }) : super(key: key);

  final MovieDetails? movieDetails;
  final NavigationFlow? navigationFlow;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieDetailsViewModel>.reactive(
      viewModelBuilder: () => serviceLocator<MovieDetailsViewModel>(),
      onViewModelReady: (viewmodel) {
        viewmodel.movieDetails = movieDetails;
      },
      builder: (context, viewModel, _) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            movieDetails!.title!,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          leading: const BackButton(
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      image: NetworkImage(movieDetails!.posterPath!),
                      fit: BoxFit.fill)),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.black.withOpacity(0.6),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 150,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'In Theaters ${movieDetails!.releaseDate!}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MovieButton(
                              inputText: 'Get Tickets',
                              icon: const SizedBox(),
                              onTap: () {},
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(237, 97, 196, 242),
                                  width: 2),
                              backgroundColor:
                                  const Color.fromARGB(237, 97, 196, 242),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            MovieButton(
                              inputText: 'Watch Trailer',
                              icon: const Icon(Icons.play_arrow_rounded),
                              onTap: () {
                                viewModel.playVideo(movieDetails?.trailerId);
                              },
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(237, 97, 196, 242),
                                  width: 2),
                              backgroundColor: Colors.transparent,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: 160,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Genres",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BuildGenreChips(movieDetails!),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 1,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Overview",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    movieDetails!.overview!,
                    style: const TextStyle(
                        color: Colors.grey, fontSize: 13, height: 1.8),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget BuildGenreChips(MovieDetails movieDetails) {
    final Random random = Random();

    Color _getRandomColor() => Color.fromRGBO(
        random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);

    return Wrap(
      runSpacing: 8,
      spacing: 8,
      children: movieDetails.genres?.map((genre) {
            return Chip(
              labelPadding: const EdgeInsets.all(4),
              label: Text(genre.name ?? ""),
              labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
              backgroundColor: _getRandomColor(),
            );
          }).toList() ??
          [],
    );
  }
}
