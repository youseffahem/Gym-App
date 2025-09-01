// screens/exercises_screen.dart

import 'package:flutter/material.dart';
import '../models/exercise.dart';
import 'exercise_details_screen.dart';

class ExercisesScreen extends StatefulWidget {
  @override
  _ExercisesScreenState createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  List<Exercise> _exercises = [
    Exercise(
      name: "Push-ups",
      description: "A classic upper body exercise.",
      imageUrl: "assets/images/Push.png",
      muscleGroups: ["Chest", "Shoulders", "Triceps"],
    ),
    Exercise(
      name: "Squats",
      description: "A fundamental lower body exercise.",
      imageUrl: "assets/images/Squats.png",
      muscleGroups: ["Legs", "Glutes"],
    ),
    Exercise(
      name: "Pull-ups",
      description: "An excellent back and biceps exercise.",
      imageUrl: "assets/images/Pull.png",
      muscleGroups: ["Back", "Biceps"],
    ),
    Exercise(
      name: "Deadlifts",
      description: "A compound exercise for overall strength.",
      imageUrl: "assets/images/Deadlifts.png",
      muscleGroups: ["Back", "Legs", "Glutes"],
    ),
    Exercise(
      name: "Bench Press",
      description: "A key exercise for chest development.",
      imageUrl: "assets/images/Bench Press.png",
      muscleGroups: ["Chest", "Shoulders", "Triceps"],
    ),
  ];

  List<Exercise> _filteredExercises = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredExercises = List.from(_exercises);
  }

  void _filterExercises(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredExercises = List.from(_exercises);
      } else {
        _filteredExercises =
            _exercises
                .where(
                  (exercise) =>
                      exercise.name.toLowerCase().contains(query.toLowerCase()),
                )
                .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exercises',
          style: TextStyle(color: const Color.fromARGB(255, 72, 12, 12)),
        ),
        backgroundColor: Colors.green[700],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterExercises,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Search exercises...',
                hintStyle: TextStyle(color: Colors.grey[700]),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.search, color: Colors.grey[700]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/exercises_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: _filteredExercises.length,
          itemBuilder: (context, index) {
            final exercise = _filteredExercises[index];
            return Card(
              color: Colors.green.withOpacity(0.8),
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              ExerciseDetailsScreen(exercise: exercise),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            exercise.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Icon(
                                  Icons.broken_image,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              exercise.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Muscles: ${exercise.muscleGroups.join(', ')}",
                              style: TextStyle(color: Colors.grey[300]),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.white70),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
