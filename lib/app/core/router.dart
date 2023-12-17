
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sterownik_akwarium/app/pages/change_socket_name/change_socket_name.dart';
import 'package:sterownik_akwarium/app/pages/edit_timer_page/edit_timer_page.dart';

import '../pages/devices_page/devices.dart';
import '../pages/home_page/home_page.dart';
import '../pages/login/login.dart';
import '../pages/parameters_page/parameters.dart';
import '../pages/timer_page/timer_page.dart';
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

      GoRoute(
        path: "/change_socket_name",
        name: ChangeSocketName.pageConfig.name,
        builder: (context, state) {
          final List<String>? socketNames = state.extra as List<String>?;

          return ChangeSocketName(
            socketNames: socketNames,
          );
        },
      ),
      GoRoute(
        path: "/timer",
        name: TimerPage.pageConfig.name,
        builder: (context, state) {
          return TimerPage();
        },
      ),
      GoRoute(
        path: "/edit_timer",
        name: EditTimer.pageConfig.name,
        builder: (context, state) {
          return EditTimer();
        },
      ),

    ]);
