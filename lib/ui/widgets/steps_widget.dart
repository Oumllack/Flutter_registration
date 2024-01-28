import 'package:flutter/cupertino.dart';
import 'package:test_pt/assets/colors.dart';

final divider = SizedBox(
  width: 44,
  child: Container(
    height: 1,
    color: const Color(0xFFD9D9D9),
  ),
);

class StepsRow extends StatelessWidget {
  const StepsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _StepCount(value: '1', isActive: true),
        divider,
        const _StepCount(value: '2'),
        divider,
        const _StepCount(value: '3'),
      ],
    );
  }
}

class _StepCount extends StatelessWidget {
  const _StepCount({
    super.key,
    required this.value,
    this.isActive = false,
  });

  final String value;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isActive ? AppColors.yellow : AppColors.lightGrey,
        shape: BoxShape.circle,
      ),
      child: Text(
        value,
        style: const TextStyle(
          color: Color(0xFF4E4E4E),
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}