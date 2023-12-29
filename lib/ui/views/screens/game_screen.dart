import 'package:flutter/material.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/bottom_nav_bar_widget.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Center(
        child: Text(
          "Game Screen",
          style: TextStyle(color: Colors.black),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
