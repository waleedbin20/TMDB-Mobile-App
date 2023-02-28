import 'package:flutter/material.dart';
import 'package:movie_app/Core/ViewModel/splash%20View%20Model/splashViewModel.dart';
import 'package:movie_app/UI/serviceLocator.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => serviceLocator<SplashViewModel>(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 130),
                child: LinearProgressIndicator(
                    color: Color.fromARGB(255, 120, 118, 118)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
