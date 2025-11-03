import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.titleButton,
    required this.onTap,
    this.width = 300,
    this.height = 60,
  });
  final String titleButton;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.5),
              offset: Offset(2, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(30),
          color: Colors.blueAccent,
        ),
        child: Center(
          child: Text(
            titleButton,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
