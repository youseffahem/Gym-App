//models/exercise
class Exercise {
  final String name;
  final String description;
  final String imageUrl;
  final List<String> muscleGroups;

  Exercise({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.muscleGroups,
  });
}
