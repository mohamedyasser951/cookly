import 'package:cookly/cookly_app.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<void> push({
    required Widget screen,
    bool fullscreenDialog = false,
  }) async {
    await navigatorKey.currentState!.push(
      MaterialPageRoute(
        builder: (BuildContext context) => screen,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  Future<void> pushReplacement({required Widget screen}) async {
    await navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(builder: (BuildContext context) => screen),
    );
  }

  dynamic pop({dynamic object}) {
    return navigatorKey.currentState!.pop<dynamic>(object);
  }

  dynamic popUtill({required Widget screen}) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext c) => screen),
      (Route route) => false,
    );
  }

  dynamic popToFirst({dynamic object}) {
    return navigatorKey.currentState!.popUntil((Route rout) => rout.isFirst);
  }

  dynamic popToRawy({dynamic object}) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) =>  CooklyApp()),
      (Route<dynamic> route) => false,
    );
  }
}
