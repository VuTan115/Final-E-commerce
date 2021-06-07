import 'package:flutter/material.dart';

//key: GlobalKeys.main5NavigatorState,
//observers: <NavigatorObserver>[
//NavigatorObserverExtend(callback: Callback()),
//],

class NavigatorObserverExtend extends NavigatorObserver {
  NavigatorObserverExtend(
      {required this.callback,
      required this.pushCallback,
      required this.popCallback,
      required this.replaceCallback});

  final VoidCallback callback;
  final VoidCallback pushCallback;
  final VoidCallback popCallback;
  final VoidCallback replaceCallback;

  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (pushCallback != null) pushCallback();
    if (callback != null) callback();
  }

  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (popCallback != null) popCallback();
    if (callback != null) callback();
  }

  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (replaceCallback != null) replaceCallback();
    if (callback != null) callback();
  }
}
