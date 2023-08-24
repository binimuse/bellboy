import 'package:get/get.dart';

import '../model/question.dart';

class QuizController extends GetxController {
  late RxInt currentQuestionIndex = 0.obs;
  late RxInt currentIndex = 0.obs;
  late RxInt questionNumber = 1.obs;
  RxInt selectedAnswerIndex = RxInt(-1);

  RxList<Question> questions = List<Question>.of([]).obs;
  final RxBool isquestionsFeched = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchQuestions().then((fetchedQuestions) {
      questions.value = fetchedQuestions;
      update();
    });
  }

  void answerQuestion(int index) {
    if (currentIndex < questions.length - 1) {
      // Proceed to the next question

      currentIndex++;
      questionNumber++; // Increment the question number
      selectedAnswerIndex.value = -1;
    } else {
      // Reached the end of the quiz
      // Handle end of quiz logic here
      // For example, show a dialog with the quiz results
    }
  }

  Future<List<Question>> fetchQuestions() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate network delay

    // This is the dummy data
    const data = [
      {
        "question": "Choose the correct one from the following?",
        "image":
            "https://cdn.pixabay.com/photo/2014/10/10/21/58/earth-483978_1280.png",
        "answers": ["Sydney", "Melbourne", "Canberra", "Perth"],
        "correctAnswerIndex": 2
      },
      {
        "question": "Choose the correct one from the following?",
        "image":
            "https://cdn.pixabay.com/photo/2013/01/29/00/47/magnifying-glass-76520_1280.png",
        "answers": ["New York", "Los Angeles", "Washington D.C.", "Chicago"],
        "correctAnswerIndex": 2
      },
      {
        "question": "Choose the correct one from the following?",
        "image":
            "https://cdn.pixabay.com/photo/2013/01/29/00/47/magnifying-glass-76520_1280.png",
        "answers": ["New ", "Los ", "Washington .", "Chio"],
        "correctAnswerIndex": 2
      },
      // Add more questions here
    ];
    isquestionsFeched(true);

    return data.map((item) => Question.fromJson(item)).toList();
  }
}
