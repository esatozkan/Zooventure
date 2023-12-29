import 'package:flutter/material.dart';
import '/ui/views/widgets/listening_animal_widgets/grid_card_widget.dart';
import '/ui/views/widgets/app_bar_widget.dart';
import '../widgets/bottom_nav_bar_widget.dart';

class ListeningAnimalTypeScreen extends StatelessWidget {
  const ListeningAnimalTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(),
      body: GridCardWidget(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
