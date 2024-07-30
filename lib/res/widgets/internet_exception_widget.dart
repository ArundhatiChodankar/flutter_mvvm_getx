import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/res/colors/app_colors.dart';
import 'package:flutter_mvvm_getx/res/strings/app_strings.dart';
import 'package:flutter_mvvm_getx/res/widgets/round_button.dart';

class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({super.key, required this.onPress,});

  @override
  State<InternetExceptionWidget> createState() => _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.cloud_off_rounded, color: Colors.red,size: 30,),
        const SizedBox(height: 50),
        Text(AppStrings.noInternetText, style: TextStyle(color: AppColors.textColor, fontSize: 18),),
        const SizedBox(height: 50),
        RoundButton(title: AppStrings.retry, onPress: (){
          widget.onPress;
        }, height: 50, width: 100)

      ],
    );
  }
}
