import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:sterownik_akwarium/app/core/providers.dart';
import 'package:sterownik_akwarium/app/domain/models/parameters_edit_page_model/parameters_edit_page_model.dart';
import 'package:sterownik_akwarium/app/domain/models/timer_page_model/timer_page_model.dart';
import 'package:sterownik_akwarium/app/pages/air_temperature_edit_page/air_temp_edit_page.dart';
import 'package:sterownik_akwarium/app/pages/change_socket_name/change_socket_name.dart';
import 'package:sterownik_akwarium/app/pages/edit_timer_page/edit_timer_page.dart';
import 'package:sterownik_akwarium/app/pages/login_page/login_page.dart';
import 'package:sterownik_akwarium/app/pages/ph_edit_page/ph_edit_page.dart';
import 'package:sterownik_akwarium/app/pages/register_page/register_page.dart';
import 'package:sterownik_akwarium/app/pages/splashscreen_page/splashscreen_page.dart';
import 'package:sterownik_akwarium/app/pages/water_temp_edit_page/water_temp_edit_page.dart';

import '../pages/devices_page/devices.dart';
import '../pages/home_page/home_page.dart';
import '../pages/parameters_page/parameters.dart';
import '../pages/timer_page/timer_page.dart';
import 'go_router_observer.dart';




final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _shellNavigatorKey =
GlobalKey<NavigatorState>(debugLabel: 'shellRoot');



final routes = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    observers: [GoRouterObserver()],
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreenPage(),
      ),
      GoRoute(
        path: '/login',
        name: LoginPage.pageConfig.name,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/home/:tab',
        name: HomePage.pageConfig.name,
        builder: (context, state) {
          final tab = state.pathParameters['tab'] ?? Parameters.pageConfig.name;
          return HomePage(tab: tab);
        },
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
      GoRoute(
        path: "/register",
        name: RegisterPage.pageConfig.name,
        builder: (context, state) {
          return RegisterPage();
        },
      ),

    ]);
