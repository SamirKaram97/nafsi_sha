class TestModel
{
  final String title;
  final String imagePath;
  final String description;
  final List<String> questions;
  final List<String> answers;
  final List<TestScoreModel> scores;
  late List<int>? qScore;

  TestModel({required this.title, required this.questions, required this.answers, required this.scores,required this.description,required this.imagePath});
}

class TestScoreModel
{
  final String name;
  final String analysis;
  final List<String> suggestions;

  TestScoreModel({required this.name, required this.analysis, required this.suggestions});
}

