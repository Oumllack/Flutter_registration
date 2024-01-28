import 'package:flutter/material.dart';
import 'package:test_pt/assets/colors.dart';

class MyName extends StatefulWidget {
  const MyName({super.key});

  @override
  State<MyName> createState() => _MyNameState();
}

class _MyNameState extends State<MyName> {
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
            Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xFF0098EE),
              size: 20,
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
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    hintText: "Ваше Имя",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
