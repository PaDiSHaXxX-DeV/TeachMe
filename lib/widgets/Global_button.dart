import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  final double width;
  final double height;
  final String buttonTitle;
  final VoidCallback onTap;
  GlobalButton(
      {super.key,
        required VoidCallback this.onTap,
        required double this.width,
        required double this.height,
        required String this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shadowColor: const Color(0xFF1A434E),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.orange),
        onPressed: onTap,
        child: Text(
          buttonTitle,
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}