
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sterownik_akwarium/app/domain/models/parameters_edit_page_model/parameters_edit_page_model.dart';
import 'package:sterownik_akwarium/app/domain/models/timer_page_model/timer_page_model.dart';
import 'package:sterownik_akwarium/app/pages/air_temperature_edit_page/air_temp_edit_page.dart';
import 'package:sterownik_akwarium/app/pages/change_socket_name/change_socket_name.dart';
import 'package:sterownik_akwarium/app/pages/edit_timer_page/edit_timer_page.dart';
import 'package:sterownik_akwarium/app/pages/ph_edit_page/ph_edit_page.dart';
import 'package:sterownik_akwarium/app/pages/splashscreen_page/splashscreen_page.dart';
import 'package:sterownik_akwarium/app/pages/water_temp_edit_page/water_temp_edit_page.dart';

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
        path: "/splash_screen",
        name: SplashScreen.pageConfig.name,
        builder: (context, state) {
          return SplashScreen();
        },
      ),
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
          final TimerPageModel model = state.extra as TimerPageModel;
          return TimerPage(data: model);
        },
      ),
      GoRoute(
        path: "/edit_timer",
        name: EditTimerPage.pageConfig.name,
        builder: (context, state) {
          final TimerPageModel model = state.extra as TimerPageModel;
          return EditTimerPage(data: model);
        },
      ),
      GoRoute(
        path: "/water_temp_edit",
        name: WaterTempEditPage.pageConfig.name,
        builder: (context, state) {
          final ParametersEditPageModel data = state.extra as ParametersEditPageModel;
          return WaterTempEditPage(data: data);
        },
      ),
      GoRoute(
        path: "/air_temp_edit",
        name: AirTempEditPage.pageConfig.name,
        builder: (context, state) {
          final ParametersEditPageModel data = state.extra as ParametersEditPageModel;
          return AirTempEditPage(data: data);
        },
      ),
      GoRoute(
        path: "/ph_edit",
        name: PhEditPage.pageConfig.name,
        builder: (context, state) {
          final ParametersEditPageModel data = state.extra as ParametersEditPageModel;
          return PhEditPage(data: data);
        },
      ),

    ]);
