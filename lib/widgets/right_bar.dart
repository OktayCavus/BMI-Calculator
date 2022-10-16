import 'package:bmicalculator/constants/app_constants.dart';
import 'package:flutter/material.dart';

class RightBar extends StatelessWidget {
  const RightBar({Key? key, required this.barWidth}) : super(key: key);
  
  final double barWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,

      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              //KENARLARDAKİ SARI ŞEYLERİN CİRCULAR OLMASINI SAĞLIYOR
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
              color: accentHexColor ,
          ),
          
        )
      ],
    );
  }
}