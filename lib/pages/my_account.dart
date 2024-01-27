import 'package:flutter/material.dart';
import '../assets/colors.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        title: Text(
          'Аккаунт',
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
              'Мой аккаунт',
              style: TextStyle(
                color: Color(0xFF0098EE),
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/icon.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'apollo@gmail.com',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF7D7D7D),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 48,
                    width: 359,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13),
                        topRight: Radius.circular(13),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Имя',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF4C4C4C),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 359,
                height: 1,
                color: Color(0xFFC6C6C8),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 48,
                    width: 359,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Фамилия',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF4C4C4C),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 359,
                height: 1,
                color: Color(0xFFC6C6C8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
