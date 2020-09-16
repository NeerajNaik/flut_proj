
// import 'package:flutter/material.dart';
// import 'package:audioplayers/audio_cache.dart';

// void main() {
//   runApp(FirstApp());
// }


// class FirstApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//           body: SafeArea(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Expanded(
//                   child: FlatButton(
//                       color: Colors.indigo[300],
//                       onPressed: () {
//                         final p = AudioCache();
//                         p.play("note1.wav");
//                       },
//                       child: Text("Btn 1")),
//                 ),
//                 Expanded(
//                   child: FlatButton(
//                       color: Colors.blue[900],
//                       onPressed: () {
//                         final p = AudioCache();
//                         p.play("note2.wav");
//                       },
//                       child: Text("Btn 2")),
//                 ),
//                 Expanded(
//                   child: FlatButton(
//                       color: Colors.blue,
//                       onPressed: () {
//                         final p = AudioCache();
//                         p.play("note3.wav");
//                       },
//                       child: Text("Btn 3")),
//                 ),
//                 Expanded(
//                   child: FlatButton(
//                       color: Colors.green,
//                       onPressed: () {
//                         final p = AudioCache();
//                         p.play("note4.wav");
//                       },
//                       child: Text("Btn 4")),
//                 ),
//                 Expanded(
//                   child: FlatButton(
//                       color: Colors.yellow,
//                       onPressed: () {
//                         final p = AudioCache();
//                         p.play("note5.wav");
//                       },
//                       child: Text("Btn 5")),
//                 ),
//                 Expanded(
//                   child: FlatButton(
//                       color: Colors.orange,
//                       onPressed: () {
//                         final p = AudioCache();
//                         p.play("note6.wav");
//                       },
//                       child: Text("Btn 6")),
//                 ),
//                 Expanded(
//                   child: FlatButton(
//                       color: Colors.red,
//                       onPressed: () {
//                         final p = AudioCache();
//                         p.play("note7.wav");
//                       },
//                       child: Text("Btn 7")),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:musical_app/quizBrain.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizLogic.dart';
import 'QnA.dart';


QuizLogic q=QuizLogic();
void main() {
  runApp(Quiz());
}
class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[100],
        appBar: AppBar(
          title :  Text(
                'Quizzzz!',
                style: TextStyle(
                  fontSize: 25.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.white),
        ),),
        body: SafeArea(
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizApp(),),
        ),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Widget> score=[];
  List<bool> ans=[true,false,true];


  void check(bool yourAns){
    bool correctAns=q.getAnswer();
    setState(() {
      if(q.isOver()==true){
        Alert(
          context: context,
          title: 'Done!',
          desc: 'End of the quiz.',
        ).show();
        q.reset();
        score = [];
      }
      else{
      if (yourAns==correctAns) {
        score.add(Icon(
          Icons.check, color: Colors.lightGreen,
        )
        );
      }else{
        score.add(
          Icon(
            Icons.close,color: Colors.redAccent,
          ),
        );
      }
      q.nextquest();
    }});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 5,
          child:Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                q.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.white),),
            ),
          ),
        ),
        Expanded(
          child:Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(color: Colors.green,
              child: Text("True",textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0,fontStyle: FontStyle.italic,color: Colors.white),
              ),
              onPressed: (){
              check(true);
              },
            ),
          ),
        ),
        Expanded(
          child:Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              color: Colors.red,
              child: Text("False",
                textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0,fontStyle: FontStyle.italic,color: Colors.white),
              ),
              onPressed: (){
                check(false);
              },
            ),
          ),
        ),
        Row(

          children: score,
        )
      ],
    );
  }
}