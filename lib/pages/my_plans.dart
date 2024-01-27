import 'package:flutter/material.dart';
import '../assets/colors.dart';

class MyPlans extends StatefulWidget {
  const MyPlans({super.key});

  @override
  State<MyPlans> createState() => _MyPlansState();
}

class _MyPlansState extends State<MyPlans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF6F6F6),
        elevation: 0.3,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
