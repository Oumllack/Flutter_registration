import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_pt/assets/colors.dart';
import 'package:test_pt/ui/pages/home_page/create_account_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test App',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: AppColors.yellow,
              width: 1,
            ),
          ),
          hintStyle: const TextStyle(
            color: Color(0xFF4E4E4E),
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
          fillColor: Colors.white70,
          filled: true,
        ),
      ),
      home: const CreateAccountPage(),
    );
  }
}
