import 'dart:async';
import 'package:one_studio_task/core/app/app_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get context => navigatorKey.currentState!.context;

  PageRoute _createSlidePageRoute({required Widget screen}) {
    return CupertinoPageRoute(
      builder: (context) => screen,
      settings: const RouteSettings(),
      maintainState: true,
      fullscreenDialog: false,
    );
  }

  PageRoute _createFadePageRoute({required Widget screen}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.easeInOut;
        Animatable<double> tween = Tween(begin: begin, end: end,).chain(CurveTween(curve: curve));
        return FadeTransition(opacity: animation.drive(tween), child: child);
      },
    );
  }

  Future<void> push({required Widget screen, bool isFade = false}) async {
    await navigatorKey.currentState!.push(isFade? _createFadePageRoute(screen: screen) : _createSlidePageRoute(screen: screen),);
  }

  Future<void> pushReplacement({required Widget screen, bool isFade = false,}) async {
    await navigatorKey.currentState!.pushReplacement(isFade? _createFadePageRoute(screen: screen) : _createSlidePageRoute(screen: screen),);
  }

  Future<void> pushAndRemoveUntil({required Widget screen, bool isFade = false}) async {
    await navigatorKey.currentState!.pushAndRemoveUntil(
      isFade? _createFadePageRoute(screen: screen) : _createSlidePageRoute(screen: screen),
      (route) => false,
    );
  }

  void pop({dynamic object}) {
    navigatorKey.currentState!.pop<dynamic>(object);
  }

  void popToFrist({dynamic object}) {
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Future<void> exitApp({dynamic object}) async {
    await navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) => const MyApp()),
      (Route<dynamic> route) => false,
    );
  }
}
