import 'package:flutter/material.dart';

class MoodResultPage extends StatelessWidget {
  final int score;

  MoodResultPage({required this.score});

  @override
  Widget build(BuildContext context) {
    String mood;
    String suggestion;
    Color backgroundColor;

    if (score <= 20) {
      mood = "Low";
      suggestion = "Try taking a walk, journaling, or talking to a friend.";
      backgroundColor = Colors.blueGrey.shade700;
    } else if (score <= 35) {
      mood = "Moderate";
      suggestion = "Keep your routine and stay connected with others.";
      backgroundColor = Colors.orange.shade300;
    } else {
      mood = "High";
      suggestion = "You’re doing great! Keep up your good habits.";
      backgroundColor = Colors.green.shade400;
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: Text("Your Mood")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Mood Score: $score", style: TextStyle(fontSize: 24, color: Colors.white)),
              SizedBox(height: 16),
              Text("Mood Level: $mood", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
              SizedBox(height: 20),
              Text(suggestion, style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}