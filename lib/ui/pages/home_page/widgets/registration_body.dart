import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test_pt/assets/colors.dart';

import 'package:url_launcher/url_launcher.dart';

class RegistrationBody extends StatelessWidget {
  const RegistrationBody({
    super.key,
    this.onChanged,
    this.onSMSButtonPressed,
    required this.mask,
  });

  final ValueChanged<String>? onChanged;
  final VoidCallback? onSMSButtonPressed;
  final MaskTextInputFormatter mask;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Регистрация',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: AppColors.grey_1,
          ),
        ),
        const SizedBox(height: 24),
        const SizedBox(
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
        const SizedBox(height: 38),
        const Align(
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
        const SizedBox(height: 5),
        TextField(
          decoration: const InputDecoration(hintText: "+7"),
          onChanged: onChanged,
          keyboardType: TextInputType.number,
          inputFormatters: [mask],
        ),
        const SizedBox(height: 120),
        _SmsButton(onPressed: onSMSButtonPressed),
        const SizedBox(height: 8),
        const _AcceptTermsText(),
      ],
    );
  }
}

class _SmsButton extends StatelessWidget {
  const _SmsButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.yellow,
        shadowColor: Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(285, 53),
      ),
      child: const Text(
        'Отправить смс-код',
        style: TextStyle(
            color: Color(0xFF4E4E4E),
            fontSize: 16,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}

class _AcceptTermsText extends StatelessWidget {
  const _AcceptTermsText();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: RichText(
        text: const TextSpan(
          text: "Нажимая на данную кнопку, вы даете согласие на обработку ",
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
    );
  }
}
