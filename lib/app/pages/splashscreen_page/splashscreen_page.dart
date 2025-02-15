import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';
import 'package:sterownik_akwarium/app/pages/login_page/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const PageConfig pageConfig = PageConfig(
    icon: Icons.electrical_services,
    name: 'splash_screen',
    child: SplashScreen(),
  );
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3)); 
    context.goNamed(LoginPage.pageConfig.name) ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo.png'), // Your splash screen content
      ),
    );
  }
}
