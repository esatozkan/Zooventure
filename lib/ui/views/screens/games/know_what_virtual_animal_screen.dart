import 'package:flutter/material.dart';
import '/ui/views/widgets/game_screen_widgets/question_game_widget.dart';

class KnowWhatVirtualAnimalScreen extends StatelessWidget {
  const KnowWhatVirtualAnimalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionGameWidget(whichQuestion: "knowWhatVirtualImage");
  }
}
