import 'package:flutter/material.dart';
import 'package:quizapp/answer_view.dart';
import 'package:quizapp/question_view.dart';
import 'question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Lake App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Quiz Lake App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int curr = 0;
  int sum = 0;
  bool showQuiz = true;
  bool showResult = false;
  var quiz = [
    Question('Michigan lake is located in', '🇷🇺 Russia', '🇨🇦 Canda',
        '🇺🇸 United States', '🇮🇷 Iran', 3),
    Question('Baikal lake is located in', '🇿🇲 Zambia', '🇹🇷 Turkey',
        '🇷🇺 Russia', '🇨🇳 China', 3),
    Question('Create Bear Lake is located in', '🇨🇦 Canda', '🇨🇳 China',
        '🇷🇺 Russia', '🇹🇷 Turkey', 1),
    Question('Bangweula lake is located in', '🇮🇷 Iran', '🇺🇸 United States',
        '🇹🇷 Turkey', '🇿🇲 Zambia', 4),
    Question('Urmia lake is located in', '🇯🇵 Japan', '🇮🇳 India',
        '🇮🇷 Iran', '🇨🇦 Canda', 3),
    Question('Vanern lake is located in', '🇸🇪 Sweden', '🇨🇦 Canda',
        '🇪🇸 Spain', '🇮🇷 Iran', 1),
    Question('Poyang lake is located in', '🇮🇳 India', '🇨🇦 Canda',
        '🇺🇸 United States', '🇨🇳 China', 4),
    Question('Van lake is located in', '🇧🇷 Brazil', '🇹🇷 Turkey',
        '🇯🇵 Japan', '🇮🇹 Italy', 2)
  ];

  void checkAnswer(int correct) {
    if (quiz[curr].correct == correct) {
      sum += 1;
    }
    if (curr == quiz.length - 1) {
      showQuiz = false;
      showResult = true;
    } else {
      curr++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
                visible: showQuiz,
                child: Column(
                  children: [
                    QuestionView(quiz[curr].question),
                    AnswerView(quiz[curr].answer1, () {
                      setState(() {
                        checkAnswer(1);
                      });
                    }),
                    AnswerView(quiz[curr].answer2, () {
                      setState(() {
                        checkAnswer(2);
                      });
                    }),
                    AnswerView(quiz[curr].answer3, () {
                      setState(() {
                        checkAnswer(3);
                      });
                    }),
                    AnswerView(quiz[curr].answer4, () {
                      setState(() {
                        checkAnswer(4);
                      });
                    })
                  ],
                )),
            Visibility(
                visible: showResult,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your score is $sum of ${quiz.length}',
                        style: TextStyle(
                          fontSize: 33,
                          color: Colors.green,
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            showQuiz = true;
                            showResult = false;
                            sum = 0;
                            curr = 0;
                          });
                        },
                        padding: EdgeInsets.all(8.5),
                        color: Colors.pink,
                        child: Text(
                          'Try again',
                          style: TextStyle(fontSize: 33, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
