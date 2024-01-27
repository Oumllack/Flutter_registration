import 'package:flutter/material.dart';
import 'package:test_pt/main.dart';
import '../assets/colors.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'my_projects.dart';
import 'my_account.dart';

class ConfirmtaionPage extends StatefulWidget {
  const ConfirmtaionPage({super.key});

  @override
  State<ConfirmtaionPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmtaionPage> {
  late TextEditingController controller;

  final String requiredNumber = '12345';

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
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
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                        ),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(36),
                      ),
                      border: Border.all(
                        color: Color(0xFF39A314),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 44,
                    child: Container(
                      height: 1,
                      color: Color(0xFFD9D9D9),
                      child: Row(
                        children: [
                          Expanded(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.check,
                                size: 20,
                                color: Color(0xFFD9D9D9),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                'Подтверждение',
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
                width: 295,
                child: Text(
                  'Введите код, который мы отправили в SMS на +7(966) 666 66 66',
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
              SizedBox(
                height: 5,
              ),
              PinCodeTextField(
                appContext: context,
                length: 5,
                keyboardType: TextInputType.number,
                animationType: AnimationType.none,
                cursorColor: Colors.black,
                controller: TextEditingController(),
                onChanged: (value) {},
                pinTheme: PinTheme(
                  inactiveColor: AppColors.grey_1,
                  activeColor: AppColors.grey_1,
                ),
                onCompleted: (value) {
                  if (value == requiredNumber) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyProjects(),
                      ),
                    );
                  } else {
                    print('invalid pin');
                  }
                },
              ),
              SizedBox(
                height: 62,
              ),
              SizedBox(
                width: 250,
                child: Text(
                  '60 сек до повтора отправки кода',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey_1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
