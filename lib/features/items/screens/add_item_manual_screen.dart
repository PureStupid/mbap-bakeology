import "package:bakeology/features/items/services/item_service.dart";
import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import "package:get_it/get_it.dart";

class AddItemManualScreen extends StatefulWidget {
  const AddItemManualScreen({super.key});

  static const String routeName = '/add-item-manual';

  @override
  State<AddItemManualScreen> createState() => _AddItemManualScreenState();
}

class _AddItemManualScreenState extends State<AddItemManualScreen> {
  final ItemService _itemService = GetIt.instance<ItemService>();
  var form = GlobalKey<FormState>();

  String? name;
  DateTime? expiryDate;
  DateTime? purchaseDate;

  void presentExpiryDatePicker(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now().add(const Duration(days: 365)))
        .then((value) {
      if (value == null) return;
      setState(() {
        expiryDate = value;
      });
    });
  }

  void presentPurchaseDatePicker(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now().add(const Duration(days: 365)))
        .then((value) {
      if (value == null) return;
      setState(() {
        purchaseDate = value;
      });
    });
  }

  void saveForm() {
    bool isValid = form.currentState!.validate();
    purchaseDate ??= DateTime.now();

    if (expiryDate == null) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select an expiry date')));
    } else {
      if (isValid) {
        form.currentState!.save();
        debugPrint('Name: $name');
        debugPrint('Expiry date: ${DateFormat.yMd().format(expiryDate!)}');
        debugPrint('Purchase date: ${DateFormat.yMd().format(purchaseDate!)}');
        _itemService.addItem(name!, expiryDate!, purchaseDate!).then((value) {
          // Hide the keyboard
          FocusScope.of(context).unfocus();

          // Reset the form
          form.currentState!.reset();
          expiryDate = null;
          purchaseDate = null;

          // Show a snackbar
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item added')));
          Navigator.of(context).pop();
        }).onError((error, stackTrace) {
          debugPrint('Error adding item: $error');
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to add item')));
        });
      }
    }
  }

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
            Form(
              key: form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.inventory),
                      labelText: 'Item name',
                      hintText: 'Enter item name',
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Name is required' : null,
                    onSaved: (value) {
                      name = value as String;
                    },
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(expiryDate == null
                            ? 'No Expiry Date Chosen'
                            : 'Expiry Date: ${DateFormat.yMd().format(expiryDate!)}'),
                        TextButton(
                            child: const Text('Choose date',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            onPressed: () {
                              presentExpiryDatePicker(context); // Choose date
                            })
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(purchaseDate == null
                            ? 'No Purchase Date Chosen'
                            : 'Purchase Date: ${DateFormat.yMd().format(purchaseDate!)}'),
                        TextButton(
                            child: const Text('Choose date',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            onPressed: () {
                              presentPurchaseDatePicker(context); // Choose date
                            })
                      ]),
                ],
              ),
            ),
            const SizedBox(height: 70),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      saveForm();
                    },
                    child: const Text('Add item'))),
          ]),
        )));
  }
}
