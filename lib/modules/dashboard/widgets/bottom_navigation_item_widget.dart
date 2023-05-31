import 'package:flutter/material.dart';

class BottomNavigationContainer extends StatelessWidget {
  final IconData icon;

  const BottomNavigationContainer({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
