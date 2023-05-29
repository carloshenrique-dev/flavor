import 'package:flutter/material.dart';

class LoginProviderButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final ImageProvider image;
  final bool isLeftButton;
  const LoginProviderButton({
    super.key,
    required this.color,
    required this.onPressed,
    required this.image,
    this.isLeftButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(200),
            topRight: const Radius.circular(200),
            bottomLeft: isLeftButton ? const Radius.circular(200) : Radius.zero,
            bottomRight:
                !isLeftButton ? const Radius.circular(200) : Radius.zero,
          ),
        ),
        padding: const EdgeInsets.all(30),
        height: 100,
        width: 100,
        child: Image(
          image: image,
        ),
      ),
    );
  }
}
