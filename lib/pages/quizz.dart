import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  List<String> _questions = [    'What is the capital of France?',    'Who invented the telephone?',    'What is the largest organ in the human body?'  ];
  List<List<String>> _options = [    ['Paris', 'London', 'Berlin', 'Rome'],
    ['Thomas Edison', 'Alexander Graham Bell', 'Nikola Tesla', 'Guglielmo Marconi'],
    ['Heart', 'Skin', 'Brain', 'Liver']
  ];
  List<int> _answers = [0, 1, 1];
  List<bool> _userAnswers = List<bool>.generate(3, (_) => false);

  void _handleAnswerSelected(int questionIndex, int answerIndex) {
    setState(() {
      _userAnswers[questionIndex] = (answerIndex == _answers[questionIndex]);
      if (questionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      }
    });
  }

  void _handleReset() {
    setState(() {
      _currentQuestionIndex = 0;
      _userAnswers = List<bool>.generate(3, (_) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Question ${_currentQuestionIndex + 1} of ${_questions.length}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              _questions[_currentQuestionIndex],
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Column(
              children: _options[_currentQuestionIndex]
                  .asMap()
                  .entries
                  .map(
                    (entry) {
                      int index = entry.key;
                      String option = entry.value;
                      return GestureDetector(
                        onTap: () => _handleAnswerSelected(_currentQuestionIndex, index),
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ],
                            border: Border.all(
                              color: _userAnswers[_currentQuestionIndex] ? Colors.green : Colors.grey[400]!,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            option,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      );
                    },
                  )
                  .toList(),
            ),
            SizedBox(height: 20),
            _currentQuestionIndex < _questions.length - 1
                ? SizedBox.shrink()
                : ElevatedButton(
                    onPressed: _handleReset,
                    child: Text('Start Over'),
                  )
          ],
        ),
      ),
    );
  }
}
