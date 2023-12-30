import 'package:flutter/material.dart';
import '/ui/views/widgets/game_screen_widgets/question_game_widget.dart';

class KnowWhatHearScreen extends StatelessWidget {
  const KnowWhatHearScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionGameWidget(whichQuestion: "knowWhatHearAnimalScreen");
  }
}
