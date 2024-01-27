import 'package:flutter/material.dart';
import 'package:test_pt/assets/colors.dart';
import 'my_account.dart';
import 'my_plans.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({super.key});

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  int _selectedIndex = 0;
  List<Widget> _screens = [
    MyPlans(),
    MyAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        selectedIconTheme: IconThemeData(
          size: 20,
        ),
        selectedLabelStyle: TextStyle(
          color: Colors.blue,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
        unselectedIconTheme: (IconThemeData(
          size: 20,
        )),
        unselectedLabelStyle: TextStyle(
          color: AppColors.grey_1,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.window_rounded,
            ),
            label: 'Мои проекты',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
            ),
            label: 'Мой аккаунт',
          ),
        ],
        onTap: (i) => setState(() => _selectedIndex = i),
        currentIndex: _selectedIndex,
      ),
    );
  }
}
