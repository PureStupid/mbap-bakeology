import "package:bakeology/features/items/screens/items_list_screen.dart";
import "package:bakeology/features/more/screens/more_screen.dart";
import "package:bakeology/features/store/screens/store_screen.dart";
import "package:flutter/material.dart";

class NavigationMenu extends StatefulWidget {
  final Widget content;
  final int selectedIndex;

  const NavigationMenu(
      {super.key, required this.content, required this.selectedIndex});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  late int _selectedIndex;
  final List<Widget> _screens = [
    const ItemsListScreen(),
    const StoreScreen(),
    const MoreScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => _screens[index]),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.content,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Items',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }
}

// class NavigationController extends GetxController {
//   final RxInt selectedIndex = 0.obs;
//   final screens = [
//     const ItemsListScreen(),
//     const StoreScreen(),
//     const MoreScreen(),
//   ];
// }
