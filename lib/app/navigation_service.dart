import 'package:flutter/cupertino.dart';

class NavigationServiceImpl extends NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<dynamic>? popAndNavigateTo(String routeName,{dynamic arguments}) {
    return navigatorKey.currentState?.popAndPushNamed(routeName,arguments: arguments);
  }
  Future<dynamic>? navigateTo(String routeName,{dynamic arguments}) {
    return navigatorKey.currentState?.pushNamed(routeName,arguments: arguments);
  }
}

abstract class NavigationService {
  GlobalKey<NavigatorState> get navigatorKey;
  Future<dynamic>? navigateTo(String routeName,{dynamic arguments});
  Future<dynamic>? popAndNavigateTo(String routeName,{dynamic arguments});
}