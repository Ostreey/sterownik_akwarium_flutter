import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';
import 'package:sterownik_akwarium/app/core/services/preferences_service.dart';
import 'package:sterownik_akwarium/app/pages/choose_controller_page/choose_controller_page.dart';
import 'package:sterownik_akwarium/app/pages/home_page/home_page.dart';
import 'package:sterownik_akwarium/app/pages/login_page/login_page.dart';
import 'package:sterownik_akwarium/app/pages/parameters_page/parameters.dart';

import '../../core/providers.dart';

class SplashScreenPage extends ConsumerStatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  static const PageConfig pageConfig = PageConfig(
    icon: Icons.electrical_services,
    name: 'splash_screen',
    child: SplashScreenPage(),
  );

  @override
  ConsumerState<SplashScreenPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authStateProvider, (previous, next) {
      next.whenData((user) async {
        if (user != null) {
          final savedControllerId =
              await PreferencesService().getString(PreferenceKey.controllerId);
          if (savedControllerId != null) {
            context.goNamed(
              HomePage.pageConfig.name,
              pathParameters: {
                'tab': Parameters.pageConfig.name,
              },
            );
          } else {
            context.goNamed(
              ChooseControllerPage.pageConfig.name,
            );
          }
        } else {
          context.goNamed(LoginPage.pageConfig.name);
        }
      });
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 24),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
