import 'package:flutter/material.dart';
import '/data/services/text_service.dart';
import '/ui/views/widgets/game_screen_widgets/game_icon_widget.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<GameIconWidget> games = [
      GameIconWidget(
        icon: "assets/game_icons/know_what_type_animal_game_logo.png",
        text: texts[5],
        whichFunction: "knowWhatTypeAnimalGame",
      ),
      GameIconWidget(
        icon: "assets/game_icons/know_what_real_image_logo.png",
        text: texts[3],
        whichFunction: "knowWhatRealImage",
      ),
      GameIconWidget(
        icon: "assets/game_icons/know_what_virtual_image_logo.png",
        text: texts[4],
        whichFunction: "knowWhatVirtualImage",
      ),
      GameIconWidget(
        icon: "assets/game_icons/know_what_hear_game_logo.png",
        text: texts[6],
        whichFunction: "knowWhatHearGame",
      ),
    ];
    return GridView.builder(
      padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: games.length,
      itemBuilder: (context, index) => games[index],
    );
  }
}
