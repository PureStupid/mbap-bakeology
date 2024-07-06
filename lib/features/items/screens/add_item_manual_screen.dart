import "package:flutter/material.dart";

class AddItemManualScreen extends StatelessWidget {
  const AddItemManualScreen({super.key});

  static const String routeName = '/add-item-manual';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Add new item'),
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(children: [
            Image.asset('assets/images/image.png'),
            const SizedBox(height: 50),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.inventory),
                      labelText: 'Item name',
                      hintText: 'Enter item name',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.date_range),
                      labelText: 'Expiry date',
                      hintText: 'Enter item\'s expiry date',
                    ),
                  ),
                  const SizedBox(height: 70),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Add item'))),
                ],
              ),
            ),
          ]),
        )));
  }
}
