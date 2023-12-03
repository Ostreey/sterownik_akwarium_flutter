


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sterownik_akwarium/app/pages/home_page/home_page.dart';
import 'package:sterownik_akwarium/app/pages/parameters_page/parameters.dart';

import '../../core/page_config.dart';
import '../widgets/custom_button.dart';

class Login extends ConsumerStatefulWidget {
  const Login({Key? key}) : super(key: key);

  static final pageConfig = PageConfig(icon: Icons.login_outlined, name: "login", child: Login());

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
     // backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Sterownik akwarium", style: Theme.of(context).textTheme.headlineLarge,),
                SizedBox(height: 40,),
                Image.asset('assets/logo.png', width: 200, height: 200,),
                SizedBox(height: 20,),
              Container(

                  width: MediaQuery.of(context).size.width / 1.5,
                 child: Form(
                   key: _formKey,
                   child: Column(
                     children: [
                       TextFormField(
                         validator: (value) {
                           if (value == null || value.isEmpty) {
                             return 'Musisz wpisać numer sterownika';
                           }
                           return null;
                         },
                         controller: loginController,
                         decoration: const InputDecoration(
                           hintText: "Wpisz numer sterownika",
                         ),
                       ),
                       SizedBox(height: 20,),
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
                ),
                SizedBox(height: 20,),
                CustomButton(
                  text: "Zaloguj",
                  onPressed: () async {
                //    if (_formKey.currentState!.validate()) {
                      print(loginController.text);
                      print(passwordController.text);
                      //context.go("/home/parameters");
                      context.goNamed(
                        HomePage.pageConfig.name,
                        pathParameters: {
                          'tab': Parameters.pageConfig.name,
                        },
                      );
                   // }
                  },
                ),
              ],
            ),

        ),
      ),
    );
  }
}

