// screens/exercise_details_screen.dart

import 'package:flutter/material.dart';
import '../models/exercise.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDetailsScreen({required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          exercise.name,
          style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        ),
        backgroundColor: Colors.green[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/exercise_details_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    exercise.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(
                          Icons.broken_image,
                          size: 50,
                          color: const Color.fromARGB(255, 137, 26, 26),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                exercise.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 56, 13, 13),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Muscle Groups: ${exercise.muscleGroups.join(', ')}",
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 8, 18, 108),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Description:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 67, 4, 4),
                ),
              ),
              SizedBox(height: 8),
              Text(
                exercise.description,
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 17, 13, 116),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
