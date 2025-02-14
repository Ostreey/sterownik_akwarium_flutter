import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sterownik_akwarium/app/pages/home_page/home_page.dart';
import 'package:sterownik_akwarium/app/pages/parameters_page/parameters.dart';
import 'package:sterownik_akwarium/app/pages/register_page/register_page.dart';
import 'package:sterownik_akwarium/app/pages/widgets/custom_button.dart';
import '../../core/page_config.dart';

// Add Firebase Auth provider
final authProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

class Login extends ConsumerStatefulWidget {
  const Login({Key? key}) : super(key: key);

  static final pageConfig = PageConfig(
    icon: Icons.login_outlined, 
    name: "login", 
    child: Login(),
  );

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

Future<void> _handleLogin() async {
  if (_formKey.currentState!.validate()) {
    try {
      final auth = ref.read(authProvider);
      
      // Add reCAPTCHA verification
      await auth.setSettings(
        appVerificationDisabledForTesting: false, // Set to true only for testing
      );
      
      final userCredential = await auth.signInWithEmailAndPassword(
        email: loginController.text,
        password: passwordController.text,
      );
      
      if (userCredential.user != null) {
        context.goNamed(
          HomePage.pageConfig.name,
          pathParameters: {
            'tab': Parameters.pageConfig.name,
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Wystąpił błąd podczas logowania';
      if (e.code == 'user-not-found') {
        errorMessage = 'Nie znaleziono użytkownika o podanym adresie email';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Nieprawidłowe hasło';
      }
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Wystąpił nieoczekiwany błąd: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}


  void _navigateToRegister() {
    context.pushNamed(RegisterPage.pageConfig.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AquariumLogo(),
              LoginForm(
                formKey: _formKey,
                loginController: loginController,
                passwordController: passwordController,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: "Zaloguj",
                onPressed: _handleLogin,
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: _navigateToRegister,
                child: const Text("Nie masz konta? Zarejestruj sterownik"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AquariumLogo extends StatelessWidget {
  const AquariumLogo({super.key});

  @override
  Widget build(BuildContext context) {
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
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.loginController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController loginController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Musisz wpisać adres e-mail';
                }
                return null;
              },
              controller: loginController,
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
              controller: passwordController,
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



