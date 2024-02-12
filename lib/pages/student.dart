import 'package:flutter/material.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A434E),
        leading: IconButton(
          color: Colors.white,
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: const Text(
          "Student Page",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF1A434E),

    );
  }
}
