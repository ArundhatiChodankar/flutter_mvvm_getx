import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final bool loading;
  final double height;
  final double width;

  const RoundButton(
      {super.key,
      required this.title,
      required this.onPress,
      this.loading = false, required this.height, required this.width}
);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Ink(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.buttonColor),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : Center(
                child: Text(
                  title.toString(),
                  style:  TextStyle(color: AppColors.textColor),
                ),
              ),
      ),
    );
  }
}
