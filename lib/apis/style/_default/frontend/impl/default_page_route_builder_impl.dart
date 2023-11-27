import 'package:eliud_core_main/apis/style/frontend/has_page_route_builder.dart';
import 'package:flutter/material.dart';

class DefaultPageRouteBuilderImpl implements HasPageRouteBuilder {
  DefaultPageRouteBuilderImpl();

  @override
  PageRouteBuilder pageRoute(
      String name, Map<String, dynamic>? parameters, Widget page) {
    return DefaultFadeRoute(
        name: name, parameters: parameters, page: page, milliseconds: 1000);
  }
}

class DefaultFadeRoute extends PageRouteBuilder {
  final Widget? page;
  final int milliseconds;

  DefaultFadeRoute(
      {String? name,
      Map<String, dynamic>? parameters,
      this.page,
      required this.milliseconds})
      : super(
          settings: RouteSettings(name: name, arguments: parameters),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page!,
          transitionDuration: Duration(milliseconds: milliseconds),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
