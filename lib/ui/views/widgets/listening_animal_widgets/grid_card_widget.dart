import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../screens/main_screen.dart';
import '/ui/providers/page_change_provider.dart';
import '/data/services/animal_service.dart';

class GridCardWidget extends StatelessWidget {
  const GridCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AudioPlayer voicePlayer = AudioPlayer();
    PageChangeProvider pageChangeProvider =
        Provider.of<PageChangeProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
        left: 10,
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width < 800 ? 3 : 4,
          crossAxisSpacing: 15,
          mainAxisSpacing: 10,
          childAspectRatio: .7,
        ),
        itemCount: animals.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () async {
            pageChangeProvider.getPage == 0
                ? await voicePlayer
                    .play(
                      AssetSource(
                        animals[index].animalType,
                      ),
                    )
                    .then(
                      (value) => googleAdsProvider.showInterstitialAd(context),
                    )
                : await voicePlayer
                    .play(
                      AssetSource(
                        animals[index].animalVoice,
                      ),
                    )
                    .then(
                      (value) => googleAdsProvider.showInterstitialAd(context),
                    );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              animals[index].animalVirtualImage,
            ),
          ),
        ),
      ),
    );
  }
}
