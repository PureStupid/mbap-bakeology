import 'package:bakeology/common/widgets/navigation_menu.dart';
import 'package:bakeology/features/authentication/screens/login_screen.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  static const String routeName = '/more';
  @override
  Widget build(BuildContext context) {
    return const NavigationMenu(content: MoreScreenContent(), selectedIndex: 2);
  }
}

class MoreScreenContent extends StatelessWidget {
  const MoreScreenContent({
    super.key,
  });

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss the dialog
                _performLogout(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _performLogout(BuildContext context) {
    // Navigate back to the login page route
    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);

    // Show a snackbar with a logout message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('You have been logged out.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('More'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showLogoutConfirmation(context),
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
