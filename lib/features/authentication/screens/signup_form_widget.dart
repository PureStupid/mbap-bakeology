import 'package:bakeology/features/items/screens/items_list_screen.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.person),
            labelText: 'Full Name',
            hintText: 'Enter your full name',
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email),
            labelText: 'Email',
            hintText: 'Enter your email address',
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.lock),
            labelText: 'Password',
            hintText: 'Enter your password',
            suffixIcon:
                IconButton(onPressed: null, icon: Icon(Icons.visibility)),
          ),
        ),
        const SizedBox(height: 70),
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(ItemsListScreen.routeName);
                },
                child: const Text('Sign Up'))),
      ],
    ));
  }
}
