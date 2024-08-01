import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/res/colors/app_colors.dart';
import 'package:flutter_mvvm_getx/res/widgets/round_button.dart';
import 'package:get/get.dart';

class GeneralExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const GeneralExceptionWidget({super.key, required this.onPress,});

  @override
  State<GeneralExceptionWidget> createState() => _GeneralExceptionWidgetState();
}

class _GeneralExceptionWidgetState extends State<GeneralExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.warning, color: Colors.red,size: 50,),
        const SizedBox(height: 50),
        Center(child: Text('generalErrorText'.tr, style: TextStyle(color: AppColors.blackColor),)),
        const SizedBox(height: 50),
        RoundButton(title: 'retry'.tr, onPress: (){
          widget.onPress;
        }, )

      ],
    );
  }
}
