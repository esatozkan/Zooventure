import 'package:flutter/material.dart';
import '/data/services/text_service.dart';
import '/ui/views/widgets/game_screen_widgets/game_icon_widget.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/bottom_nav_bar_widget.dart';

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
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/bottom_nav_bar/game_icon.png",
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              color: Colors.grey.shade400,
            ),
          ),
          GridView.builder(
            padding: const EdgeInsets.only(top: 50),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: games.length,
            itemBuilder: (context, index) => games[index],
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
