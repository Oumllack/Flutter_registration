import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:test_pt/assets/colors.dart';
import 'my_projects.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({
    super.key,
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String newVerificationId = '';

  @override
  void initState() {
    super.initState();
    loginWithPhone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: const IconButton(
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
              const SizedBox(height: 24),
              Text(
                'Подтверждение',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: AppColors.grey_1,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 295,
                child: Text(
                  'Введите код, который мы отправили в SMS на ${widget.phoneNumber}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey_1,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55.0),
                child: PinCodeTextField(
                  backgroundColor: Color(0xFFFBFBFB),
                  appContext: context,
                  length: 6,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.none,
                  cursorColor: Colors.black,
                  onChanged: (value) {},
                  pinTheme: PinTheme(
                    inactiveColor: AppColors.grey_1,
                    activeColor: AppColors.grey_1,
                  ),
                  onCompleted: (value) {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                      verificationId: newVerificationId,
                      smsCode: value,
                    );
                    auth
                        .signInWithCredential(credential)
                        .then((value) => _pushToMainPage());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyProjects(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 44),
              const _SendCodeTimer(),
            ],
          ),
        ),
      ),
    );
  }

  void _pushToMainPage() => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MyProjects(),
        ),
      );

  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then(
              (value) => _pushToMainPage(),
            );
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        newVerificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}

class _SendCodeTimer extends StatefulWidget {
  const _SendCodeTimer({super.key});

  @override
  State<_SendCodeTimer> createState() => _SendCodeTimerState();
}

class _SendCodeTimerState extends State<_SendCodeTimer> {
  Timer? _timer;
  int remainingTime = 60;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer ??= Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          remainingTime--;
        });
        if (remainingTime == 0) {
          timer.cancel();
          _timer = null;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return remainingTime == 0
        ? CupertinoButton(
            child: const Text(
              'Отправить код еще раз',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color(0xFFFFB700),
              ),
            ),
            onPressed: () {
              remainingTime = 60;
              startTimer();
            },
          )
        : SizedBox(
            width: 250,
            child: Text(
              '$remainingTime сек до повтора отправки кода',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.grey_1,
              ),
            ),
          );
  }
}
