import 'package:flutter/material.dart';
import 'package:test_pt/assets/colors.dart';
import 'package:test_pt/ui/pages/my_projects.dart';

class MyName extends StatefulWidget {
  const MyName({super.key, required this.hintText});

  final String hintText;

  @override
  State<MyName> createState() => _MyNameState();
}

class _MyNameState extends State<MyName> {
  int _selectedIndex = 1;
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        title: Text(
          widget.hintText,
          style: const TextStyle(
              color: Color(0xFF4C4C4C),
              fontSize: 17,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF6F6F6),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 48,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
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
                    hintText: widget.hintText,
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFC6C6C8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed:
                    name.isEmpty ? null : () => Navigator.pop(context, name),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shadowColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(285, 53),
                ),
                child: const Text(
                  'Cохранить',
                  style: TextStyle(
                      color: Color(0xFF0098EE),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
