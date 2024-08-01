import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/res/colors/app_colors.dart';
import 'package:flutter_mvvm_getx/res/widgets/round_button.dart';
import 'package:get/get.dart';

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
        const Icon(Icons.cloud_off_rounded, color: Colors.red,size: 50,),
        const SizedBox(height: 50),
        Center(child: Text('noInternetText'.tr, style: TextStyle(color: AppColors.blackColor),)),
        const SizedBox(height: 50),
        RoundButton(title: 'retry'.tr, onPress: (){
          widget.onPress;
        }, )

      ],
    );
  }
}
