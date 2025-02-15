import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sterownik_akwarium/app/pages/home_page/home_page.dart';
import 'package:sterownik_akwarium/app/pages/parameters_page/parameters.dart';
import 'package:sterownik_akwarium/app/pages/register_page/register_page.dart';
import 'package:sterownik_akwarium/app/pages/widgets/custom_button.dart';
import 'package:sterownik_akwarium/app/pages/widgets/snackbar.dart';
import '../../core/page_config.dart';
import 'login_view_model_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const pageConfig = PageConfig(
    icon: Icons.login_outlined,
    name: "login_page",
    child: LoginPage(),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginViewModelProvider);
    final loginViewModel = ref.watch(loginViewModelProvider.notifier);
    ref.listen(loginViewModelProvider, (previous, next) {
      if (next is AsyncError) {
        Snackbar.show(context, next.error.toString());
      } else if (next is AsyncData) {
        context.goNamed(
          HomePage.pageConfig.name,
          pathParameters: {
            'tab': Parameters.pageConfig.name,
          },
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildAquariumLogo(context),
              _buildLoginForm(context, loginViewModel),
              const SizedBox(height: 20),
              CustomButton(
                isLoading: loginState.isLoading,
                text: "Zaloguj",
                onPressed: () => loginViewModel.handleLogin(),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => context.pushNamed(RegisterPage.pageConfig.name),
                child: const Text("Nie masz konta? Zarejestruj sterownik"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAquariumLogo(BuildContext context) {
    return Column(
      children: [
        Text(
          "Sterownik akwarium",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 40),
        Image.asset(
          'assets/logo.png',
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildLoginForm(BuildContext context, LoginViewModel loginViewModel) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Form(
        key: loginViewModel.formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Musisz wpisać adres e-mail';
                }
                return null;
              },
              controller: loginViewModel.loginController,
              decoration: const InputDecoration(
                hintText: "Podaj adres e-mail",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Musisz wpisać hasło';
                }
                return null;
              },
              controller: loginViewModel.passwordController,
              decoration: const InputDecoration(
                hintText: "hasło",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

