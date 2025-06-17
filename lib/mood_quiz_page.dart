import 'package:flutter/material.dart';
import 'mood_questions.dart';
import 'mood_result_page.dart';

class MoodQuizPage extends StatefulWidget {
  @override
  _MoodQuizPageState createState() => _MoodQuizPageState();
}

class _MoodQuizPageState extends State<MoodQuizPage> {
  int currentQuestion = 0;
  List<int> answers = [];

  void _nextQuestion(int score) {
    setState(() {
      answers.add(score);
      if (currentQuestion < moodQuestions.length - 1) {
        currentQuestion++;
      } else {
        int totalScore = answers.reduce((a, b) => a + b);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => MoodResultPage(score: totalScore),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = moodQuestions[currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: Text('Mood Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${currentQuestion + 1} of ${moodQuestions.length}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            Text(
              question['question'],
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            ...List.generate(question['options'].length, (index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 6),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () => _nextQuestion(question['scores'][index]),
                  child: Text(
                    question['options'][index],
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
