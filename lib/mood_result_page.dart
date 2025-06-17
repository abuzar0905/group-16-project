import 'package:flutter/material.dart';

class MoodResultPage extends StatelessWidget {
  final int score;

  MoodResultPage({required this.score});

  @override
  Widget build(BuildContext context) {
    String mood;
    String suggestion;
    Color backgroundColor;

    if (score <= 12) {
      mood = "Low Mood";
      suggestion = "It’s okay to feel down. Talk to someone, take breaks, and be kind to yourself.";
      backgroundColor = Colors.blueGrey.shade700;
    } else if (score <= 22) {
      mood = "Moderate Mood";
      suggestion = "You're doing alright. Try adding some relaxing or joyful activities.";
      backgroundColor = Colors.orange.shade300;
    } else {
      mood = "Positive Mood";
      suggestion = "Great job! Maintain your healthy habits and keep shining.";
      backgroundColor = Colors.green.shade400;
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Your Mood Today"),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Total Score: $score",
                  style: TextStyle(fontSize: 24, color: Colors.white)),
              SizedBox(height: 16),
              Text("Mood Status: $mood",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
              SizedBox(height: 20),
              Text(
                suggestion,
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Go Back", style: TextStyle(color: backgroundColor)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
