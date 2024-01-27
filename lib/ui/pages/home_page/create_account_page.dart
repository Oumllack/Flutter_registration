import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test_pt/assets/colors.dart';
import 'package:test_pt/ui/pages/home_page/widgets/registration_body.dart';
import 'package:test_pt/ui/widgets/setps_widget.dart';
import '../confirmation_page.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool isButtonActive = false;
  int currentStep = 0;

  final mask = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  void initState() {
    super.initState();
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
              const StepsRow(),
              const SizedBox(height: 24),
              RegistrationBody(
                onSMSButtonPressed: isButtonActive
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmationPage(
                              phoneNumber: mask.getMaskedText(),
                            ),
                          ),
                        );
                      }
                    : null,
                onChanged: (value) {
                  bool activateButton = mask.getUnmaskedText().length > 9;
                  if (activateButton != isButtonActive) {
                    setState(() {
                      isButtonActive = activateButton;
                    });
                  }
                },
                mask: mask,
              )
            ],
          ),
        ),
      ),
    );
  }
}
