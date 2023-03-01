import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/Core/Configs/enum.dart';
import 'package:movie_app/Core/ViewModel/Watch%20View%20Model/watchViewModel.dart';
import 'package:movie_app/UI/serviceLocator.dart';
import 'package:stacked/stacked.dart';

class WatchView extends StatefulWidget {
  WatchView({Key? key}) : super(key: key);

  @override
  State<WatchView> createState() => _WatchViewState();
}

class _WatchViewState extends State<WatchView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WatchViewModel>.reactive(
      viewModelBuilder: () => serviceLocator<WatchViewModel>(),
      builder: (context, viewmodel, _) => Center(
        child: ElevatedButton(
          child: const Text('Get upcoming Movies'),
          onPressed: () {
            viewmodel.getUpcomingMovies();
          },
        ),
      ),
    );
  }
}
