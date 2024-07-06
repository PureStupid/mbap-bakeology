import 'package:bakeology/common/widgets/navigation_menu.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  static const String routeName = '/store';

  @override
  Widget build(BuildContext context) {
    return const NavigationMenu(
      content: StoreScreenContent(),
      selectedIndex: 1,
    );
  }
}

class StoreScreenContent extends StatelessWidget {
  const StoreScreenContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: SearchBar(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            leading: const Icon(Icons.search),
            hintText: 'Search the store',
          ),
        ),
        body: const Center(
          child: Text('Store Screen'),
        ));
  }
}
