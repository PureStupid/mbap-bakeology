import "package:bakeology/features/authentication/screens/login_screen.dart";
import "package:bakeology/features/authentication/screens/signup_form_widget.dart";
import "package:flutter/material.dart";

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const String routeName = "/signup";

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
                    'Create Account',
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
                        const SignUpForm(),
                        Column(children: [
                          const SizedBox(height: 10),
                          SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        LoginScreen.routeName);
                                  },
                                  child: const Text('Log In'))),
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
