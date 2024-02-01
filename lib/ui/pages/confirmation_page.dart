import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:test_pt/assets/colors.dart';
import 'my_projects.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
              ),
              const SizedBox(height: 44),
              const _SendCodeTimer(),
            ],
          ),
        ),
      ),
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

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({Key? key}) : super(key: key);

  @override
  _LoginWithPhoneState createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  TextEditingController phoneController =
      TextEditingController(text: "+923028997122");
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  bool otpVisibility = false;

  String verificationID = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login With Phone"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: "Phone number"),
              keyboardType: TextInputType.phone,
            ),
            Visibility(
              child: TextField(
                controller: otpController,
                decoration: InputDecoration(),
                keyboardType: TextInputType.number,
              ),
              visible: otpVisibility,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  if (otpVisibility) {
                    verifyOTP();
                  } else {
                    loginWithPhone();
                  }
                },
                child: Text(otpVisibility ? "Verify" : "Login")),
          ],
        ),
      ),
    );
  }

  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then((value) {
      print("You are logged in successfully");
      Fluttertoast.showToast(
          msg: "You are logged in successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }
}
