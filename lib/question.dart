class Question {
  String _questionText;
  String _answer1;
  String _answer2;
  String _answer3;
  String _answer4;
  int _correct;

  set question(String question) {
    this._questionText = question;
  }

  String get question {
    return this._questionText;
  }

  set correct(int correct) {
    this._correct = correct;
  }

  int get correct {
    return this._correct;
  }

  String get answer1 {
    return this._answer1;
  }

  String get answer2 {
    return this._answer2;
  }

  String get answer3 {
    return this._answer3;
  }

  String get answer4 {
    return this._answer4;
  }

  Question(this._questionText, this._answer1, this._answer2, this._answer3,
      this._answer4, this._correct);
}
