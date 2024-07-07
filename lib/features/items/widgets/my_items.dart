import 'package:bakeology/features/items/models/item.dart';
import 'package:bakeology/features/items/screens/edit_item_screen.dart';
import 'package:bakeology/features/items/screens/item_details_screen.dart';
import 'package:bakeology/features/items/services/item_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class MyItems extends StatefulWidget {
  const MyItems({
    super.key,
  });

  @override
  State<MyItems> createState() => _MyItemsState();
}

class _MyItemsState extends State<MyItems> {
  final ItemService _itemService = GetIt.instance<ItemService>();

  void deleteItem(String id) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: const Text('Delete Item'),
                content:
                    const Text('Are you sure you want to delete this item?'),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('No')),
                  TextButton(
                      onPressed: () {
                        _itemService.deleteItem(id).then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Item deleted')));
                          Navigator.of(context).pop();
                        }).onError((error, stackTrace) {
                          debugPrint('Error while deleting item: $error');
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'An error occurred while deleting')));
                        });
                      },
                      child: const Text('Yes')),
                ]));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Item>>(
        stream: _itemService.getItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('An error occurred'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Column(children: [
                Image.asset('assets/images/empty-item.png', scale: 1.5),
                Text(
                  'No items added yet',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Text('Add one to start tracking!')
              ]),
            );
          }

          // Calculate items expiring soon
          final expiringSoonCount = snapshot.data!
              .where((item) =>
                  item.expiryDate.isAfter(DateTime.now()) &&
                  item.expiryDate
                      .isBefore(DateTime.now().add(const Duration(days: 7))))
              .length;

          // Calculate expired items
          final expiredCount = snapshot.data!
              .where((item) => item.expiryDate.isBefore(DateTime.now()))
              .length;

          return Column(
            children: [
              if (expiringSoonCount > 0)
                Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.warning, color: Colors.orange),
                    title: Text(
                      '$expiringSoonCount item${expiringSoonCount == 1 ? ' is' : 's are'} expiring soon',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              if (expiredCount >
                  0) // Conditionally display the expired items card
                Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.error, color: Colors.red),
                    title: Text(
                      '$expiredCount item${expiredCount == 1 ? ' has' : 's have'} expired',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) =>
                      ListTile(
                    onTap: () => Navigator.pushNamed(
                        context, ItemDetailsScreen.routeName,
                        arguments: snapshot.data![index]),
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundImage:
                          const AssetImage('assets/images/image.png'),
                    ),
                    title: Text(snapshot.data![index].name),
                    subtitle: Text(
                      '${snapshot.data![index].expiryDate.isBefore(DateTime.now().subtract(const Duration(days: 1))) ? "Expired" : "Expires"} on ${DateFormat('d MMMM yyyy').format(snapshot.data![index].expiryDate)}',
                    ),
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
                                      Navigator.pushNamed(
                                          context, EditItemScreen.routeName,
                                          arguments: snapshot.data![index]);
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.delete),
                                    title: const Text('Delete'),
                                    onTap: () =>
                                        deleteItem(snapshot.data![index].id),
                                  ),
                                ],
                              );
                            });
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
