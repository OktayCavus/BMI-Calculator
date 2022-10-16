import 'package:bmicalculator/constants/app_constants.dart';
import 'package:bmicalculator/widgets/left_bar.dart';
import 'package:bmicalculator/widgets/right_bar.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => __HomeScreenState();
}

class __HomeScreenState extends State<HomeScreen> {

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = '';

  final textTitle = 'BMI CALCULATOR';
  final textCalculate = 'Calculate';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textTitle,
          style: TextStyle(
            color: accentHexColor,
            fontWeight: FontWeight.w300),
            ),
        backgroundColor: Colors.transparent,
        //shadow efekt olmamasını sağlıyor herhlade
        elevation: 0,
        centerTitle: true,
      ),

      backgroundColor: mainHexColor,

      body: SingleChildScrollView(
        child: Column(
          children : [
             SizedBoxHeight,
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _HeightTextField(heightController: _heightController),
                 _WeightTextField(weightController: _weightController)
              ],
            ),

            SizedBoxHeight,

             GestureDetector(
              onTap: calculateBMI,
               child: CalculateButton(textCalculate: textCalculate),
             ),

              SizedBoxHeight,

            Container(
              child: Text(_bmiResult.toStringAsFixed(2),style: TextStyle(fontSize: 90, color: accentHexColor),
              )
            ),
            SizedBox(height: 30,),

            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(_textResult,style: TextStyle(fontSize: 32,fontWeight: FontWeight.w400, color: accentHexColor),
                )
              ),
            ),

            SizedBox(height:10),
            LeftBar(barWidth: 40),
            SizedBox(height:20),
            LeftBar(barWidth: 70),
            SizedBox(height:20),
            LeftBar(barWidth: 40),
            RightBar(barWidth: 70),
            SizedBox(height:50),
            RightBar(barWidth: 70),
          ]
        ),
      )

    );
  }

  void calculateBMI(){
              double _h = double.parse(_heightController.text);
              double _w = double.parse(_weightController.text);
              setState(() {
                _bmiResult = _w/(_h*_h);
                if(_bmiResult>25){
                  _textResult = 'Over Weight';
                }else if (_bmiResult>=18.5 && _bmiResult <=25){
                  _textResult = 'normal Weight';
                }else{
                  _textResult = 'under Weight';
                }
              });
            }
}

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    Key? key,
    required this.textCalculate,
  }) : super(key: key);

  final String textCalculate;

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Text(
       textCalculate,
       style: TextStyle(
         fontSize: 22,
         fontWeight: FontWeight.bold,
         color: accentHexColor),
         ),
              );
  }
}

class _HeightTextField extends StatelessWidget {
  const _HeightTextField({
    Key? key,
    required TextEditingController heightController,
  }) : _heightController = heightController, super(key: key);

  final TextEditingController _heightController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      child: TextField(
        controller: _heightController,
        style: TextStyle(
          fontSize: 42,
          fontWeight: FontWeight.w300,
          color: accentHexColor
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Height',
          hintStyle: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w300,
            color: Colors.white.withOpacity(0.8)
          )
        ) ,
      ),
    );
  }
}

class _WeightTextField extends StatelessWidget {
  const _WeightTextField({
    Key? key,
    required TextEditingController weightController,
  }) : _weightController = weightController, super(key: key);

  final TextEditingController _weightController;

  @override
  Widget build(BuildContext context) {
    return Container(
     width: 130,
     child: TextField(
       controller: _weightController,
       style: TextStyle(
         fontSize: 42,
         fontWeight: FontWeight.w300,
         color: accentHexColor
       ),
       keyboardType: TextInputType.number,
       decoration: InputDecoration(
         border: InputBorder.none,
         hintText: 'Weight',
         hintStyle: TextStyle(
           fontSize: 42,
           fontWeight: FontWeight.w300,
           color: Colors.white.withOpacity(0.8)
         )
       ) ,
     ),
                );
  }
}