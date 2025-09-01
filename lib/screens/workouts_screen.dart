// screens/workouts_screen.dart
import 'package:flutter/material.dart';
import '../models/workout.dart';
import 'workout_details_screen.dart';

class WorkoutsScreen extends StatefulWidget {
  @override
  _WorkoutsScreenState createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  List<Workout> _workouts = [
    Workout(
      name: "Full Body Strength",
      description: "A workout targeting all major muscle groups.",
      imageUrl: "assets/images/Full Body Strength.png",
      exercises: ["Squats", "Push-ups", "Deadlifts"],
    ),
    Workout(
      name: "Cardio Blast",
      description: "A high-intensity cardio workout.",
      imageUrl: "assets/images/Cardio Blast.png",
      exercises: ["Running", "Jumping Jacks", "Burpees"],
    ),
  ];

  List<Workout> _filteredWorkouts = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredWorkouts = List.from(_workouts);
  }

  void _filterWorkouts(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredWorkouts = List.from(_workouts);
      } else {
        _filteredWorkouts =
            _workouts
                .where(
                  (workout) =>
                      workout.name.toLowerCase().contains(query.toLowerCase()),
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
          'Workouts',
          style: TextStyle(color: const Color.fromARGB(255, 91, 4, 4)),
        ),
        backgroundColor: Colors.purple,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterWorkouts,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Search workouts...',
                hintStyle: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                fillColor: const Color.fromARGB(255, 12, 1, 1),
                filled: true,
                prefixIcon: Icon(
                  Icons.search,
                  color: const Color.fromARGB(255, 39, 6, 6),
                ),
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
            image: AssetImage("assets/images/workouts_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: _filteredWorkouts.length,
          itemBuilder: (context, index) {
            final workout = _filteredWorkouts[index];
            return Card(
              color: Colors.purple.withOpacity(0.8),
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder:
                          (_, __, ___) =>
                              WorkoutDetailsScreen(workout: workout),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
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
                            workout.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Icon(
                                  Icons.broken_image,
                                  color: const Color.fromARGB(255, 45, 4, 4),
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
                              workout.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 9, 0, 0),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Includes: ${workout.exercises.take(2).join(', ')}...",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 36, 4, 4),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: const Color.fromARGB(179, 50, 14, 14),
                      ),
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
