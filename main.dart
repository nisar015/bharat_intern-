// import 'dart:js_util';
import 'package:calc_op/buttons.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
// import 'dart:ui' as ui;
import 'package:audioplayers/audioplayers.dart';
// import 'package:audioplayers/audio_cache.dart'; 

void main() => runApp(MyApp());
// {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  //  final player=AudioCache();

  
  // const MyApp({super.key});// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
 
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

var userquetion='';
var useranswer='';
var play;
// final myTextStyle = TextStyle(fontSize: 40, color: Colors.cyan[700]);

final List<String> butto = 
[
 'C','DEL','%','/',
 '7','8','9','x',
 '4','5','6','-',
 '1','2','3','+',
 '.','0','ANS','=',
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      body:Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Container(
                    padding:EdgeInsets.all(15),
                    alignment: Alignment.centerRight,
                    child:Text(userquetion,style: TextStyle(fontSize:20),),
                  ),
                  Container(
                    padding:EdgeInsets.all(15),
                    alignment: Alignment.centerRight,
                    child: Text(useranswer,style: TextStyle(fontSize:20 ),),
                  )
                ],
              ),
              ),
              ),
            
            // ),
            Expanded(
              flex: 2,
              child:Container(
                // color: Colors.deepPurple[200],
                // child: Center()
                  child: GridView.builder(
                    itemCount: butto.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), 
                    itemBuilder: (BuildContext context,int index){
                      if(index==0){
                        return button( 
                       buttonTapped: () {
                        // final player=AudioPlayer()
                        // player.play('music4.wav');
                        setState(() {
                          userquetion = '';
                          useranswer = '';
                        });
                       },
                       buttontext: butto[index],
                       color: Colors.green,
                       textcolor: Colors.white,
                        );
                      }
                      else if(index==1){
                       return button(
                        buttonTapped: () {
                          // final player=AudioCache();
                         
                          setState(() {
                            userquetion = userquetion.substring(
                              0, userquetion.length - 1);
                            
                            });

                        },
                      
                       buttontext: butto[index],
                       color: Colors.red,
                       textcolor: Colors.white, 
                        );
                      }
                       else if(index == butto.length-1){
                        return button(
                          buttonTapped: () {
                          setState(() {
                            equalpressed();
                        
                            });

                        },
                      
                       buttontext: butto[index],
                       color: Colors.blueGrey[700],
                       textcolor: Colors.white, 
                        );
                       }
                      else{
                      return button(
                        buttonTapped: (){ 
                          // 0player.play('music4.wav');
                          setState(() {
                            userquetion += butto[index];
                          });
                        },
                        buttontext: butto[index],
                        color: isoperator(butto[index]) ? Colors.cyan[700]: Colors.purple[50],
                        textcolor:isoperator(butto[index]) ? Colors.white : Colors.black,
                      );
                      }
                  
                  },
                  ),
                  // child: button(
                  // color: Colors.black54,
                  // textcolor: Colors.white,
                  // buttontext: '0',
                  // ),
                ),
              // child: Text('sadf'),
              
            ),
              // ),
          ],
        ),
    );
  }
    bool isoperator(String x){
      if(x=="+"|| x=="-"||x=="%"|| x=="/" || x=="x" || x=="="){
        return true;
      }
      return false;
    }

    void equalpressed(){
      String finalquestion=userquetion;
      finalquestion = finalquestion.replaceAll('x', '*');

      Parser p = Parser();
      Expression exp = p.parse(finalquestion);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      useranswer=eval.toString();
    }
  }
