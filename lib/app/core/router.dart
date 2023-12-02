
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../pages/devices_page/devices.dart';
import '../pages/home_page/home_page.dart';
import '../pages/login/login.dart';
import '../pages/parameters_page/parameters.dart';
import 'go_router_observer.dart';


final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _shellNavigatorKey =
GlobalKey<NavigatorState>(debugLabel: 'shellRoot');

const String _basePath = "/home";

final routes = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',
    observers: [GoRouterObserver()],
    routes: [
        GoRoute(
            path: '/login',
            name: Login.pageConfig.name,
            builder: (context, state) {
                return Login(); // Return the widget/page for the '/login' route
            },
        ),

      ShellRoute(
        navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => child,
          routes: [
            GoRoute(path: '${HomePage.pageConfig.name}/:tab',
            name: HomePage.pageConfig.name,
            builder: (context, state) =>  HomePage(
              key: state.pageKey,
              tab: state.pathParameters['tab']!,
            ),
            )
          ]
      ),

/*GoRoute(
          path: '/setup_page',
          name: "/setup_page",
          builder: (context, state) {
            return SetupPage();
          }),*/

    ]);
