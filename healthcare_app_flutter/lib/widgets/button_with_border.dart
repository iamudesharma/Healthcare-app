import 'package:flutter/material.dart';

class ButtonWithBorder extends StatelessWidget {
  const ButtonWithBorder({
    Key? key,
    required this.borderColor,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final Color borderColor;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
