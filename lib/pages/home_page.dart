import 'package:flutter/material.dart';
import '../assets/colors.dart';
import 'confirmation_page.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isButtonActive = true;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
    controller.addListener(() {
      final isButtonActive = controller.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.grey_1,
            size: 27,
          ),
          onPressed: null,
        ),
        backgroundColor: Colors.white.withOpacity(0),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 36,
                    width: 36,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF4E4E4E),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFFFB800),
                        ),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(36),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 44,
                    child: Container(
                      height: 1,
                      color: Color(0xFFD9D9D9),
                    ),
                  ),
                  Container(
                    height: 36,
                    width: 36,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '2',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF4E4E4E),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFECECEC),
                        ),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(36),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 44,
                    child: Container(
                      height: 1,
                      color: Color(0xFFD9D9D9),
                    ),
                  ),
                  Container(
                    height: 36,
                    width: 36,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '3',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF4E4E4E),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFECECEC),
                        ),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(36),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Регистрация',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: AppColors.grey_1,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                width: 200,
                child: Text(
                  'Введите номер телефона для регистрации',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey_1,
                  ),
                ),
              ),
              SizedBox(
                height: 38,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Номер телефона',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xFFFFB800),
                      width: 1,
                    ),
                  ),
                  filled: true,
                  hintStyle: TextStyle(
                      color: Color(0xFF4E4E4E),
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                  hintText: "+7",
                  fillColor: Colors.white70,
                ),
                controller: controller,
                keyboardType: TextInputType.number,
                inputFormatters: [MaskedInputFormatter('+7(###) ###-##-##')],
              ),
              SizedBox(
                height: 120,
              ),
              ElevatedButton(
                onPressed: isButtonActive
                    ? () {
                        setState(() => isButtonActive = false);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmtaionPage(),
                          ),
                        );
                      }
                    : null,
                child: Text(
                  'Отправить смс-код',
                  style: TextStyle(
                      color: Color(0xFF4E4E4E),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFFB800),
                  shadowColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(285, 53),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 220,
                child: RichText(
                  text: TextSpan(
                    text:
                        "Нажимая на данную кнопку, вы даете согласие на обработку ",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFA7A7A7),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'персональных данных',
                        style: TextStyle(color: Colors.yellow),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
