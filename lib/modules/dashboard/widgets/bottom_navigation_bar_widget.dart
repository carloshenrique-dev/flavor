import 'package:flavor/modules/dashboard/widgets/bottom_navigation_item_widget.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int index;
  final Function(int)? onChanged;

  const BottomNavigationBarWidget({
    super.key,
    required this.index,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      currentIndex: index,
      onTap: onChanged,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.white,
          activeIcon: BottomNavigationContainer(icon: Icons.home),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
          backgroundColor: Colors.white,
          activeIcon: BottomNavigationContainer(icon: Icons.search),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Add',
          backgroundColor: Colors.white,
          activeIcon: BottomNavigationContainer(icon: Icons.add),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Collection',
          backgroundColor: Colors.white,
          activeIcon: BottomNavigationContainer(icon: Icons.favorite),
        ),
      ],
    );
  }
}
