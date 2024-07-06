import 'package:bakeology/features/items/screens/add_item_manual_screen.dart';
import 'package:flutter/material.dart';

class AddItemScanScreen extends StatelessWidget {
  const AddItemScanScreen({
    super.key,
  });

  static const String routeName = '/add-item-scan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title:
              const Text('Add new item', style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset('assets/images/qr-code-temp.jpg'),
              const SizedBox(
                height: 200,
              ),
              FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.of(context)
                        .popAndPushNamed(AddItemManualScreen.routeName);
                  },
                  label: const Text('Add item manually'),
                  icon: const Icon(Icons.keyboard)),
            ],
          ),
        ));
  }
}
