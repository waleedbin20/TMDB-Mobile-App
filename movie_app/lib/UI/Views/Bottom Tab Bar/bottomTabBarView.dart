import 'package:flutter/cupertino.dart' hide Router;
import 'package:flutter/material.dart' hide Router;
import 'package:movie_app/Core/Configs/enum.dart';
import 'package:movie_app/Core/Configs/routePath.dart';
import 'package:movie_app/Core/Services/Navigation/iNavigationService.dart';
import 'package:movie_app/Core/ViewModel/Bottom%20Tab%20Bar%20View%20Model/bottomTabBarViewModel.dart';
import 'package:movie_app/UI/Views/Dashboard/dashboardView.dart';
import 'package:movie_app/UI/Views/Media%20Library/mediaView.dart';
import 'package:movie_app/UI/Views/More/moreView.dart';

import 'package:movie_app/UI/Views/Watch/watchView.dart';

import 'package:movie_app/UI/router.dart';
import 'package:movie_app/UI/serviceLocator.dart';
import 'package:stacked/stacked.dart';

class BottomTabBarView extends StatefulWidget {
  const BottomTabBarView({super.key});

  @override
  BottomTabBarViewState createState() => BottomTabBarViewState();
}

class BottomTabBarViewState extends State<BottomTabBarView> {
  final _controller = CupertinoTabController();
  late int _currentIndex;
  @override
  void initState() {
    _currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomTabBarViewModel>.reactive(
      builder: (context, viewModel, child) => WillPopScope(
        onWillPop: () async => handleHardwareBackButton(),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(33.0),
            topRight: Radius.circular(33.0),
          ),
          child: CupertinoTabScaffold(
              controller: _controller,
              tabBar: CupertinoTabBar(
                backgroundColor: const Color.fromARGB(235, 55, 46, 69),
                items: buildTabBarItems(context, viewModel),
                inactiveColor: const Color.fromARGB(211, 149, 145, 152),
                activeColor: Color.fromARGB(235, 245, 245, 245),
                onTap: (index) => _onTapped(index),
              ),
              tabBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return _getTabView(
                        const DashboardView(), NavigationFlow.Dashboard);
                  case 1:
                    return _getTabView(WatchView(), NavigationFlow.Watch);
                  case 2:
                    return _getTabView(
                        const MediaView(), NavigationFlow.MediaLibrary);
                  case 3:
                    return _getTabView(const MoreView(), NavigationFlow.More);

                  default:
                    return _getTabView(
                        const MoreView(), NavigationFlow.Default);
                }
              }),
        ),
      ),
      viewModelBuilder: () => serviceLocator<BottomTabBarViewModel>(),
    );
  }

  Future<bool> handleHardwareBackButton() async {
    {
      final canPop = !await getCurrentNavigatorKey()!.currentState!.maybePop();
      if (canPop && _controller.index != 0) {
        setState(() {
          _controller.index = 0;
        });
        return false;
      }
      return canPop;
    }
  }

  List<BottomNavigationBarItem> buildTabBarItems(
    BuildContext context,
    BottomTabBarViewModel viewModel,
  ) {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.dashboard_rounded),
        label: "Dashboard",
        activeIcon: Icon(Icons.dashboard_rounded),
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.play_circle_rounded),
        label: "Watch",
        activeIcon: Icon(Icons.play_circle_rounded),
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.video_collection),
        label: "Media Library",
        activeIcon: Icon(Icons.video_collection),
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.list_rounded),
        label: "More",
        activeIcon: Icon(Icons.list_rounded),
      ),
    ];
  }

  Widget _getTabView(Widget widget, NavigationFlow flow) {
    return CupertinoTabView(
      onGenerateRoute: Router.generateRoute,
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: widget,
      ),
      navigatorKey: serviceLocator<INavigationService>().navigatorKeys[flow],
    );
  }

  _onTapped(int index) {
    switch (index) {
      case 0:
        if (index == _currentIndex) {
          serviceLocator<INavigationService>().popUntil(RoutePaths.dashboard,
              navigationFlow: NavigationFlow.Dashboard);
        } else {
          _setCurrentTabIndex(index);
        }
        break;
      case 1:
        if (index == _currentIndex) {
          serviceLocator<INavigationService>()
              .popUntil(RoutePaths.watch, navigationFlow: NavigationFlow.Watch);
        } else {
          _setCurrentTabIndex(index);
        }
        break;
      case 2:
        if (index == _currentIndex) {
          serviceLocator<INavigationService>().popUntil(RoutePaths.mediaLibrary,
              navigationFlow: NavigationFlow.MediaLibrary);
        } else {
          _setCurrentTabIndex(index);
        }
        break;
      case 3:
        if (index == _currentIndex) {
          serviceLocator<INavigationService>()
              .popUntil(RoutePaths.more, navigationFlow: NavigationFlow.More);
        } else {
          _setCurrentTabIndex(index);
        }
        break;
    }
  }

  _setCurrentTabIndex(int index) {
    setState(() {
      _currentIndex = index;
      _controller.index = index;
    });
  }

  GlobalKey<NavigatorState>? getCurrentNavigatorKey() {
    switch (_controller.index) {
      case 0:
        return serviceLocator<INavigationService>()
            .navigatorKeys[NavigationFlow.Dashboard];
      case 1:
        return serviceLocator<INavigationService>()
            .navigatorKeys[NavigationFlow.Watch];
      case 2:
        return serviceLocator<INavigationService>()
            .navigatorKeys[NavigationFlow.MediaLibrary];
      case 3:
        return serviceLocator<INavigationService>()
            .navigatorKeys[NavigationFlow.More];
    }

    return null;
  }
}
