import 'package:flutter/material.dart';
import '/ui/views/widgets/listening_animal_widgets/grid_card_widget.dart';
import '/ui/views/widgets/app_bar_widget.dart';
import '../widgets/bottom_nav_bar_widget.dart';

class ListeningAnimalSoundsScreen extends StatelessWidget {
  const ListeningAnimalSoundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/bottom_nav_bar/listening_animal_sounds_icon.png",
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 2,
              fit: BoxFit.cover,
              color: Colors.grey.shade400,
            ),
          ),
          const GridCardWidget(),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
