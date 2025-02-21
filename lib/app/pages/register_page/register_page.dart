import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sterownik_akwarium/app/pages/widgets/custom_button.dart';

import '../../core/page_config.dart';
import 'register_view_model_provider.dart';

final authProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

class RegisterPage extends ConsumerWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static const pageConfig = PageConfig(
    icon: Icons.app_registration,
    name: "register",
    child: RegisterPage(),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerState = ref.watch(registerViewModelProvider);
    final registerViewModel = ref.watch(registerViewModelProvider.notifier);

    ref.listen(registerViewModelProvider, (previous, next) {
      if (next is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error.toString()),
            backgroundColor: Colors.red,
          ),
        );
      } else if (next is AsyncData) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Konto zostało utworzone pomyślnie'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context); // Return to login screen
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Załóż konto'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 200,
                height: 200,
              ),
              _buildRegisterForm(context, registerViewModel),
              const SizedBox(height: 20),
              CustomButton(
                isLoading: registerState.isLoading,
                text: "Zarejestruj",
                onPressed: () => registerViewModel.handleRegister(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterForm(
      BuildContext context, RegisterViewModel registerViewModel) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Form(
        key: registerViewModel.formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Musisz wpisać adres email';
                }
                return null;
              },
              controller: registerViewModel.emailController,
              decoration: const InputDecoration(
                hintText: "wpisz adres email",
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
              controller: registerViewModel.passwordController,
              decoration: const InputDecoration(
                hintText: "hasło",
              ),
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
