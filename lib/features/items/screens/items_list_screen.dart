import "package:bakeology/common/widgets/navigation_menu.dart";
import "package:bakeology/features/items/screens/add_item_scan_screen.dart";
import "package:bakeology/features/items/widgets/my_items.dart";
import "package:flutter/material.dart";

class ItemsListScreen extends StatelessWidget {
  const ItemsListScreen({super.key});

  static const String routeName = '/items-list';

  @override
  Widget build(BuildContext context) {
    return const NavigationMenu(
        content: ItemsListScreenContent(), selectedIndex: 0);
  }
}

class ItemsListScreenContent extends StatefulWidget {
  const ItemsListScreenContent({super.key});

  @override
  State<ItemsListScreenContent> createState() => _ItemsListScreenContentState();
}

class _ItemsListScreenContentState extends State<ItemsListScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('My items'),
        ),
        body: const MyItems(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).pushNamed(AddItemScanScreen.routeName);
          },
          label: const Text('Add new item'),
          icon: const Icon(Icons.add),
        ));
  }
}
