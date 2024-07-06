import "package:bakeology/common/widgets/navigation_menu.dart";
import "package:bakeology/features/items/screens/add_item_scan_screen.dart";
import "package:bakeology/features/items/screens/edit_item_screen.dart";
import "package:bakeology/features/items/screens/item_details_screen.dart";
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

class ItemsListScreenContent extends StatelessWidget {
  const ItemsListScreenContent({super.key});

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
            hintText: 'Search your items',
          ),
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (
            BuildContext context,
            int index,
          ) =>
              ListTile(
            onTap: () =>
                Navigator.of(context).pushNamed(ItemDetailsScreen.routeName),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundImage:
                  const AssetImage('assets/images/white-loaf-temp.jpg'),
            ),
            title: const Text('White Loaf'),
            subtitle: const Text('Expires 7 May 2024'),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.edit),
                            title: const Text('Edit'),
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(EditItemScreen.routeName);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.delete),
                            title: const Text('Delete'),
                            onTap: () {},
                          ),
                        ],
                      );
                    });
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).pushNamed(AddItemScanScreen.routeName);
          },
          label: const Text('Add new item'),
          icon: const Icon(Icons.add),
        ));
  }
}
