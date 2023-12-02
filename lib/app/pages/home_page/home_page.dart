
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';
import 'package:sterownik_akwarium/app/pages/alarms_page/alarms.dart';

import '../devices_page/devices.dart';
import '../parameters_page/parameters.dart';

class HomePage extends ConsumerStatefulWidget {
   HomePage({
    super.key,
    required String tab,
  }) : index = tabs.indexWhere((element) {
    debugPrint(element.name);
    return element.name == tab;
  });

  static final tabs = [
    Parameters.pageConfig,
    Devices.pageConfig,
    Alarms.pageConfig
  ];

  static const PageConfig pageConfig = PageConfig(
    icon: Icons.home_rounded,
    name: '/home',
  );

  final int index;

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
          child: AdaptiveLayout(
            primaryNavigation: SlotLayout(
              config: <Breakpoint, SlotLayoutConfig>{
                Breakpoints.mediumAndUp: SlotLayout.from(
                  key: const Key('primary-navigation-medium'),
                  builder: (context) => AdaptiveScaffold.standardNavigationRail(
                    trailing: IconButton(onPressed: (){
                      context.pushNamed("/setup_page");
                    }, icon: Icon(Icons.settings)),
                    onDestinationSelected: (index) => _tapOnNavigationDestination(context, index),
                    selectedIndex: widget.index,
                    destinations: destinations
                        .map(
                          (_) => AdaptiveScaffold.toRailDestination(_),
                    )
                        .toList(),
                  ),
                ),
              },
            ),
            bottomNavigation: SlotLayout(
              config: <Breakpoint, SlotLayoutConfig>{
                Breakpoints.small: SlotLayout.from(
                  key: const Key("bottom-navigation-small"),
                  builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
                      destinations: destinations,
                      onDestinationSelected: (index) =>
                          _tapOnNavigationDestination(context, index),
                      currentIndex: widget.index
                  ),
                ),
              },
            ),
            body: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.smallAndUp: SlotLayout.from(
                  key: const Key("primary-body-small"),
                  builder: (_) => HomePage.tabs[widget.index].child)
            }),
            secondaryBody: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.mediumAndUp: SlotLayout.from(
                  key: const Key('secondary-body-medium'),
                  builder: AdaptiveScaffold.emptyBuilder)
            }),
          )),
    );
  }




  void _tapOnNavigationDestination(BuildContext context, int index) => context.goNamed(
    HomePage.pageConfig.name,
    pathParameters: {
      'tab': HomePage.tabs[index].name,
    },
  );}



final destinations = HomePage.tabs
    .map(
      (page) => NavigationDestination(icon: Icon(page.icon), label: page.name),
)
    .toList();
