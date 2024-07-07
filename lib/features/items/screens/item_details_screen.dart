import 'package:bakeology/features/items/models/item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});

  static const String routeName = '/item-details';
  @override
  Widget build(BuildContext context) {
    Item selectedItem = ModalRoute.of(context)?.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Item Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(child: Image.asset('assets/images/image.png')),
            Center(
              child: Text(selectedItem.name,
                  style: Theme.of(context).textTheme.headlineLarge),
            ),
            const SizedBox(height: 8),
            Text(
                'Expiry Date: ${DateFormat('d MMMM yyyy').format(selectedItem.expiryDate)}',
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 8),
            Text(
                'Purchase Date: ${DateFormat('d MMMM yyyy').format(selectedItem.purchaseDate)}',
                style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
