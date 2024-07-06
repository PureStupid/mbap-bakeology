import "package:bakeology/features/authentication/screens/signup_screen.dart";
import "package:flutter/material.dart";

import "login_form_widget.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // ! remember to change the routeName to "/login"
  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Align(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Welcome Back',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                const SizedBox(height: 100),
                Container(
                    height: 480,
                    color: Colors.white,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const LoginForm(),
                        Column(children: [
                          const SizedBox(height: 10),
                          SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        SignUpScreen.routeName);
                                  },
                                  child: const Text('Sign Up'))),
                        ])
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
