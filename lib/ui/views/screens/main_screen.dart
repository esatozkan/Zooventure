import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/ui/views/screens/games/know_what_hear_screen.dart';
import '/ui/views/screens/games/know_what_real_animal_screen.dart';
import '/ui/views/screens/games/know_what_type_animal_screen.dart';
import '/ui/views/screens/games/know_what_virtual_animal_screen.dart';
import '/ui/providers/page_change_provider.dart';
import '/ui/views/screens/game_screen.dart';
import '/ui/views/screens/listening_animal_sounds_screen.dart';
import '/ui/views/screens/listening_animal_type_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = const [
      ListeningAnimalTypeScreen(),
      ListeningAnimalSoundsScreen(),
      GameScreen(),
      KnowWhatHearScreen(),
      KnowWhatRealAnimalScreen(),
      KnowWhatTypeAnimalScreen(),
      KnowWhatVirtualAnimalScreen(),
    ];
    PageChangeProvider pageChangeProvider =
        Provider.of<PageChangeProvider>(context);
    return pages[pageChangeProvider.getPage];
  }
}
