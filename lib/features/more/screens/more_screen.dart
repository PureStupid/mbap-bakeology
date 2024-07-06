import 'package:bakeology/common/widgets/navigation_menu.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('More'),
        ),
        body: const Center(
          child: Text('More Screen'),
        ));
  }
}
