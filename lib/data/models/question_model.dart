// ignore_for_file: public_member_api_docs, sort_constructors_first
import '/data/models/animal_model.dart';

class QuestionModel {
  final AnimalModel question;
  final Map<AnimalModel, bool> option;

  QuestionModel({
    required this.question,
    required this.option,
  });
}
