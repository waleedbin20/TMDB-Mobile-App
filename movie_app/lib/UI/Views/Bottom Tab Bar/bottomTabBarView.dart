import 'package:flutter/material.dart' hide Router;
import 'package:movie_app/Core/Configs/enum.dart';
import 'package:movie_app/Core/ViewModel/Bottom%20Tab%20Bar%20View%20Model/bottomTabBarViewModel.dart';
import 'package:movie_app/UI/Widgets/offStageNavigator.dart';
import 'package:movie_app/UI/router.dart';
import 'package:movie_app/UI/serviceLocator.dart';
import 'package:stacked/stacked.dart';

class BottomTabBarView extends StatefulWidget {
  const BottomTabBarView({super.key});

  @override
  BottomTabBarViewState createState() => BottomTabBarViewState();
}

class BottomTabBarViewState extends State<BottomTabBarView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomTabBarViewModel>.reactive(
      viewModelBuilder: () => serviceLocator<BottomTabBarViewModel>(),
      builder: (context, viewModel, child) => WillPopScope(
        onWillPop: () async => viewModel.handleHardwareBackButton(),
        child: Scaffold(
          body: Stack(
            children: [
              OffStageNavigator(
                offStage: viewModel.currentTab != TabItem.Watch,
                navigatorKey: viewModel.navigatorKey(TabItem.Watch),
                onGenerateRoute: Router.generateRouteMore,
                initialRoute: viewModel.initialRoute(TabItem.Watch),
              ),
            ],
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(33.0),
              topRight: Radius.circular(33.0),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color.fromARGB(239, 46, 39, 57),
              selectedItemColor: Colors.white,
              unselectedItemColor: Color.fromARGB(232, 192, 186, 203),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard_rounded),
                  label: "Dashboard",
                  activeIcon: Icon(Icons.dashboard_rounded),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.play_circle_rounded),
                  label: "Watch",
                  activeIcon: Icon(Icons.play_circle_rounded),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.video_collection),
                  label: "Media Library",
                  activeIcon: Icon(Icons.video_collection),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list_rounded),
                  label: "More",
                  activeIcon: Icon(Icons.list_rounded),
                ),
              ],
              onTap: (index) => viewModel.onTapped(TabItem.values[index]),
              currentIndex: viewModel.currentTab.index,
            ),
          ),
        ),
      ),
    );
  }
}
