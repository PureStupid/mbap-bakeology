import 'package:bakeology/features/items/screens/items_list_screen.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email),
            labelText: 'Email',
            hintText: 'Enter your email address',
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock),
            labelText: 'Password',
            hintText: 'Enter your password',
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                )),
          ),
          keyboardType: TextInputType.visiblePassword,
          obscureText: _isObscure,
        ),
        const SizedBox(height: 5),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot password?',
              )),
        ),
        const SizedBox(height: 90),
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(ItemsListScreen.routeName);
                },
                child: const Text('Log In'))),
      ],
    ));
  }
}
