import 'QnA.dart';

class QuizLogic{
  int _qnum=0;
  List <QnA>_questionBank=[
    QnA("Everything in Flutter is Widget",true),
    QnA("Flutter is based on Java Programming lang",false),
    QnA("Widgets in flutter are categorized as Stateful and Stateless",true),
  ];

  void nextquest(){
    if(_qnum<_questionBank.length-1){
      _qnum++;
    }
  }
bool isOver(){
    if(_qnum>=_questionBank.length-1){
      return true;
    }
    else{
      return false;
    }
}
  String getQuestion(){
    return _questionBank[_qnum].question;
  }
  bool getAnswer(){
    return _questionBank[_qnum].answer;
  }
  void reset() {
    _qnum = 0;
  }
}