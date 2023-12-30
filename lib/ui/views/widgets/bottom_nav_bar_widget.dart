import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/ui/views/screens/main_screen.dart';
import '/ui/providers/page_change_provider.dart';
import '/data/constants/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    PageChangeProvider pageChangeProvider =
        Provider.of<PageChangeProvider>(context);
    return Container(
      width: width,
      height: 60,
      color: bottomAppBarBgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              pageChangeProvider.setPage(0);
              googleAdsProvider.showInterstitialAd();
            },
            child: Opacity(
              opacity: pageChangeProvider.getPage == 0 ? 1 : 0.5,
              child: Image.asset(
                "assets/bottom_nav_bar/listening_animal_types_icon.png",
                height: 40,
                width: 40,
                color: Colors.white,
                fit: BoxFit.cover,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              pageChangeProvider.setPage(1);
              googleAdsProvider.showInterstitialAd();
            },
            child: Opacity(
              opacity: pageChangeProvider.getPage == 1 ? 1 : 0.5,
              child: Image.asset(
                "assets/bottom_nav_bar/listening_animal_sounds_icon.png",
                height: 40,
                width: 40,
                color: Colors.white,
                fit: BoxFit.cover,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              pageChangeProvider.setPage(2);
              googleAdsProvider.showInterstitialAd();
            },
            child: Opacity(
              opacity: pageChangeProvider.getPage == 2 ? 1 : 0.5,
              child: Image.asset(
                "assets/bottom_nav_bar/game_icon.png",
                height: 40,
                width: 40,
                color: Colors.white,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
