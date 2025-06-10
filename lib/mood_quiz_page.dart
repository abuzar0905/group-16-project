import 'package:flutter/material.dart';
import 'mood_question.dart';
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
        Navigator.push(
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
      appBar: AppBar(title: Text('Mood Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              '${currentQuestion + 1}. ${question['question']}',
              style: TextStyle(fontSize: 20),
            ),
            ...question['options'].map<Widget>((option) {
              return ElevatedButton(
                onPressed: () => _nextQuestion(option),
                child: Text('$option'),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}