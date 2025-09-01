//models/workout
class Workout {
  final String name;
  final String description;
  final String imageUrl;
  final List<String> exercises;

  Workout({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.exercises,
  });
}
