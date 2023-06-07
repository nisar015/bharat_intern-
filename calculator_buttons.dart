import 'package:flutter/material.dart';
// import 'package:flutter/butt';
class button extends StatelessWidget {
  // const button({super.key});
  final color;
  final textcolor;
  final String buttontext;
  final buttonTapped;
  
  button({this.color,this.textcolor,required this.buttontext, required this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          // child: Padding(
          //   padding: const EdgeInsets.all(8.0),
            child: Container(
              color: color,
              child: Center(
                child: Text(buttontext,style: TextStyle(color: textcolor),
                ),
              ),
            ),
          ),
      ),
    );
  }
}