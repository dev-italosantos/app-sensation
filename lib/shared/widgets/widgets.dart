import 'package:app_quiz/core/app_colors.dart';
import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return Center(
    child: RichText(
      text: const TextSpan(
        style: TextStyle(fontSize: 22.0),
        children: <TextSpan>[
          TextSpan(
            text: 'Quiz',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
          TextSpan(
            text: 'Sensation',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.button,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget Button({required BuildContext context, required String label, buttonWidth}) {
  return Container(
    color: AppColors.button,
    padding: const EdgeInsets.symmetric(vertical: 18),
    alignment: Alignment.center,
    width: buttonWidth != null ? buttonWidth : MediaQuery.of(context).size.width - 48,
    child: Text(
      label,
      style: const TextStyle(
        color: AppColors.white,
        fontSize: 16,
      ),
    ),
  );
}
