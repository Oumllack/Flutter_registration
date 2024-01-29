import 'package:flutter/material.dart';
import 'package:test_pt/assets/colors.dart';
import 'package:test_pt/ui/pages/my_account.dart';
import 'package:test_pt/ui/pages/my_plans.dart';
import 'package:test_pt/ui/pages/my_projects.dart';

class MyFamilyName extends StatefulWidget {
  const MyFamilyName({super.key});

  @override
  State<MyFamilyName> createState() => _MyFamilyNameState();
}

class _MyFamilyNameState extends State<MyFamilyName> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        title: Text(
          'Ваше Имя',
          style: TextStyle(
              color: Color(0xFF4C4C4C),
              fontSize: 17,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFF6F6F6),
        elevation: 0.3,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyProjects(),
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color(0xFF0098EE),
                size: 20,
              ),
            ),
            Text(
              'Аккаунт',
              style: TextStyle(
                color: Color(0xFF0098EE),
              ),
            )
          ],
        ),
      ),
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
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 24,
              ),
              child: SizedBox(
                width: 359,
                height: 48,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(
                        13,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 0.3,
                        color: Color(0xFFC6C6C8),
                      ),
                    ),
                    hintText: "Ваша Фамилия",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFC6C6C8),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
