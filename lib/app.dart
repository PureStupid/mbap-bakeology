import 'package:bakeology/common/theme/theme.dart';
import 'package:bakeology/features/authentication/screens/login_screen.dart';
import 'package:bakeology/features/authentication/screens/signup_screen.dart';
import 'package:bakeology/features/items/screens/add_item_manual_screen.dart';
import 'package:bakeology/features/items/screens/add_item_scan_screen.dart';
import 'package:bakeology/features/items/screens/edit_item_screen.dart';
import 'package:bakeology/features/items/screens/item_details_screen.dart';
import 'package:bakeology/features/items/screens/items_list_screen.dart';
import 'package:bakeology/features/more/screens/more_screen.dart';
import 'package:bakeology/features/store/screens/store_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      home: const LoginScreen(),
      routes: {
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        ItemsListScreen.routeName: (context) => const ItemsListScreen(),
        ItemDetailsScreen.routeName: (context) => const ItemDetailsScreen(),
        AddItemManualScreen.routeName: (context) => const AddItemManualScreen(),
        AddItemScanScreen.routeName: (context) => const AddItemScanScreen(),
        EditItemScreen.routeName: (context) => const EditItemScreen(),
        StoreScreen.routeName: (context) => const StoreScreen(),
        MoreScreen.routeName: (context) => const MoreScreen(),
      },
    );
  }
}
