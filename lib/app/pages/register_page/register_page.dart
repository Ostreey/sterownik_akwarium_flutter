import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sterownik_akwarium/app/pages/widgets/custom_button.dart';
import '../../core/page_config.dart';

final authProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static final pageConfig = PageConfig(
    icon: Icons.app_registration,
    name: "register",
    child: RegisterPage(),
  );

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controllerNumberController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _handleRegister() async {
    if (_formKey.currentState!.validate()) {
      try {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) =>
              const Center(child: CircularProgressIndicator()),
        );

        final auth = ref.read(authProvider);
        final userCredential = await auth.createUserWithEmailAndPassword(
          email: controllerNumberController.text,
          password: passwordController.text,
        );

        Navigator.pop(context);

        if (userCredential.user != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Konto zostało utworzone pomyślnie'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context); // Return to login screen
        }
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        String errorMessage = 'Wystąpił błąd podczas rejestracji';

        switch (e.code) {
          case 'weak-password':
            errorMessage = 'Hasło jest za słabe';
            break;
          case 'email-already-in-use':
            errorMessage = 'Sterownik o tym numerze jest już zarejestrowany';
            break;
          case 'invalid-email':
            errorMessage = 'Nieprawidłowy numer sterownika';
            break;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      } catch (e) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Wystąpił nieoczekiwany błąd: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
              RegisterForm(
                formKey: _formKey,
                controllerNumberController: controllerNumberController,
                passwordController: passwordController,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: "Zarejestruj",
                onPressed: _handleRegister,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required this.formKey,
    required this.controllerNumberController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controllerNumberController;
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
                  return 'Musisz wpisać adres email';
                }
                return null;
              },
              controller: controllerNumberController,
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
              controller: passwordController,
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
