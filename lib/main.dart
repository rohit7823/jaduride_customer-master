import 'package:flutter/material.dart';
import 'app/constants.dart';
import 'package:jaduride/app/routeGenerator.dart';
import 'app/routes.dart';
import 'package:jaduride/app/theme.dart';

import 'app/di.dart';
import 'app/navigation_service.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        //DeviceOrientation.portraitDown
      ]);
  await initAppModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: MaterialApp(
        color: Colors.red,
        debugShowCheckedModeBanner: false,
        navigatorKey: instance<NavigationService>().navigatorKey,
        title: Constants.appName,
        theme: AppTheme.lightTheme,
        initialRoute: Routes.splash,
        onGenerateRoute: RouteGenerator.getRoute,
        themeMode: ThemeMode.light,
      ),
    );
  }
}