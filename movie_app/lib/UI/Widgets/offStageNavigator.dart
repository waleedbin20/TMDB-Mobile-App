import 'package:flutter/material.dart' hide Router;

class OffStageNavigator extends StatelessWidget {
  const OffStageNavigator({
    super.key,
    required this.offStage,
    required this.navigatorKey,
    required this.initialRoute,
    required this.onGenerateRoute,
  });

  final bool offStage;
  final GlobalKey<NavigatorState> navigatorKey;
  final String initialRoute;
  final Route<dynamic>? Function(RouteSettings) onGenerateRoute;
  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: offStage,
      child: Navigator(
        key: navigatorKey,
        initialRoute: initialRoute,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
