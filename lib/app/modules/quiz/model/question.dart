class Question {
  final String question;
  final String image;
  final List<String> answers;
  final int correctAnswerIndex;

  Question(
      {required this.question,
      required this.image,
      required this.answers,
      required this.correctAnswerIndex});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      image: json['image'],
      answers: List<String>.from(json['answers']),
      correctAnswerIndex: json['correctAnswerIndex'],
    );
  }
}
