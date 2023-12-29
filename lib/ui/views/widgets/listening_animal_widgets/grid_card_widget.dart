import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 10,
          childAspectRatio: .7,
        ),
        itemCount: animals.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () async {
            pageChangeProvider.getPage == 0
                ? await voicePlayer.play(
                    AssetSource(
                      animals[index].animalType,
                    ),
                  )
                : await voicePlayer.play(
                    AssetSource(
                      animals[index].animalVoice,
                    ),
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
