import 'package:flutter/material.dart';
import 'package:flutter_json_task/Custom%20Widget/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() ontap;
  const CustomButton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          gradient:
              LinearGradient(colors: [Color(0XFF8E2DE2), Color(0XFF4A00E0)],transform: GradientRotation(90)),
        ),
        child: CustomText(
          text: text,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          size: 16,
        ),
      ),
    );
  }
}
