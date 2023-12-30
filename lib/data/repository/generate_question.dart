import 'dart:math';
import 'package:provider/provider.dart';
import '/ui/providers/question_game_provider.dart';
import '/data/services/add_question.dart';
import '/data/services/animal_service.dart';

import '/data/models/question_model.dart';

List<QuestionModel> question = [];

void generateQuestion(context) {
  for (int i = 0; i < animals.length; i++) {
    question.add(addQuestion(i));
  }

  question.shuffle(Random());
  question.removeRange(
      Provider.of<QuestionGameProvider>(context, listen: false).getNumberOfQuestion + 1,
      question.length);
}

void clearQuestion() {
  question.clear();
}
