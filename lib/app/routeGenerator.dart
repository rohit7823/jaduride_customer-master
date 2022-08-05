import 'package:flutter/material.dart';
import 'package:jaduride/app/pages/home_page.dart';
import 'package:jaduride/app/pages/intro_page.dart';
import 'package:jaduride/app/pages/mobile_input_page.dart';
import 'package:jaduride/app/pages/otp_input.dart';
import 'package:jaduride/app/pages/personal_details.dart';
import 'package:jaduride/app/transition_event_detection.dart';
import 'package:jaduride/app/view_models/mobile_input_view_model.dart';
import '../app/routes.dart';
import 'package:jaduride/app/pages/splash_page.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    Widget page;
    switch (routeSettings.name) {
      case Routes.splash:
        page = const SplashPage();
        break;
      case Routes.home:
        page = const HomePage();
        break;
      case Routes.intro:
        page = const IntroPage();
        break;
      case Routes.mobileInput:
        page = const MobileInput();
        break;
      case Routes.personalDetails:
        String arg = routeSettings.arguments as String;
        page = PersonalDetails(arg);
        break;
      case Routes.otp:
        MobileAndOtp arg = routeSettings.arguments as MobileAndOtp;
        page = OtpInput(arg);
        break;
      default:
        page = Text("Undefined route");
        break;
    }
    return PageRouteBuilder(
      maintainState: false,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: Duration(milliseconds: 1000),
      reverseTransitionDuration: Duration(milliseconds: 1000),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var event = TransitionEventDetector.detect(animation, secondaryAnimation);
        switch(event){
          case TransitionEvent.NONE:
            return child;
            break;
          case TransitionEvent.ENTER:
            const begin = Offset(1, 0.0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
            break;
          case TransitionEvent.EXIT:
            const begin = Offset.zero;
            const end = Offset(-1, 0.0);
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = secondaryAnimation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
            break;
          case TransitionEvent.POP_ENTER:
            const begin = Offset.zero;
            const end = Offset(-1, 0.0);
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = secondaryAnimation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
            break;
          case TransitionEvent.POP_EXIT:
            const begin = Offset(1, 0.0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
            break;
        }
        //print("0000 ${routeSettings.name} ${animation.status} ${secondaryAnimation.status}");
        //return child;
        /*final fadeAnimation = animation.drive(Tween(begin: 0.0,end: 1.0));
        return FadeTransition(
          opacity:fadeAnimation ,
          child: child,
        );*/
        print("${routeSettings.name} secondary = "+secondaryAnimation.status.name);
        print("${routeSettings.name} isDismissed="+animation.isDismissed.toString());
        print("${routeSettings.name} status="+animation.status.name);
        print("${routeSettings.name} status_c="+(animation.status==AnimationStatus.completed).toString());
        if(animation.status==AnimationStatus.completed){
          print("ccccccccccccccccccccccccccc");
        }
        switch(animation.status){

          case AnimationStatus.dismissed:
            // TODO: Handle this case.
            break;
          case AnimationStatus.forward:
            {
              print("222 ${routeSettings.name} ${animation.status.name} ${secondaryAnimation.status.name}");
              const begin = Offset(1, 0.0);
              const end = Offset.zero;
              final tween = Tween(begin: begin, end: end);
              final offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            }
            break;
          case AnimationStatus.reverse:
            {
              if(secondaryAnimation.status==AnimationStatus.dismissed){
                const begin = Offset(1, 0.0);
                const end = Offset.zero;
                final tween = Tween(begin: begin, end: end);
                final offsetAnimation = animation.drive(tween);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              }
              else{
                const begin = Offset.zero;
                const end = Offset(-1, 0.0);
                final tween = Tween(begin: end, end: begin);
                final offsetAnimation = animation.drive(tween);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              }
            }
            break;
          case AnimationStatus.completed:
            {
              print("000 ${routeSettings.name} ${animation.status} ${secondaryAnimation.status}");
              if(secondaryAnimation.status==AnimationStatus.forward){
                print("999999999999999999");
                const begin = Offset.zero;
                const end = Offset(-1, 0.0);
                final tween = Tween(begin: begin, end: end);
                final offsetAnimation = secondaryAnimation.drive(tween);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
                /*final fadeAnimation = animation.drive(Tween(begin: 0.0,end: 1.0));
                return FadeTransition(
                  opacity:fadeAnimation ,
                  child: child,
                );*/
              }
              else{
                print("8888888888888888");
                return child;
              }
            }
            break;
        }
        return child;
        if(animation.status==AnimationStatus.forward){
          print("222 ${routeSettings.name} ${animation.status.name} ${secondaryAnimation.status.name}");
          const begin = Offset(1, 0.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        }
        else if(animation.status==AnimationStatus.reverse){
          print("333 ${routeSettings.name} ${animation.status.name} ${secondaryAnimation.status.name}");
          /*const begin = Offset(0, 1.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);
          final fadeAnimation = animation.drive(Tween(begin: 0.0,end: 1.0));
          return SlideTransition(
            position: offsetAnimation,
            child: FadeTransition(
              opacity:fadeAnimation ,
              child: child,
            ),
          );*/
          if(secondaryAnimation.status==AnimationStatus.dismissed){
            const begin = Offset(1, 0.0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          }
          else{
            const begin = Offset.zero;
            const end = Offset(-1, 0.0);
            final tween = Tween(begin: end, end: begin);
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          }
          /*final fadeAnimation = animation.drive(Tween(begin: 0.0,end: 1.0));
          return FadeTransition(
            opacity:fadeAnimation ,
            child: child,
          );*/
        }
        else{
          print("111 ${routeSettings.name} ${animation.status.name} ${secondaryAnimation.status.name}");
          if(animation.status==AnimationStatus.completed&&secondaryAnimation.status==AnimationStatus.forward){
            const begin = Offset.zero;
            const end = Offset(-1, 0.0);
            final tween = Tween(begin: end, end: begin);
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          }
          return child;
        }
      },
    );
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Text("Undefined route"),
        ));
  }
}