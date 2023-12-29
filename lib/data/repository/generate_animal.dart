import 'dart:io';
import 'dart:math';
import '/data/models/animal_model.dart';
import '/data/services/animal_service.dart';

void generateAnimal() {
  for (int i = 0; i < animalVirtualImages.length; i++) {
    AnimalModel animalModel = AnimalModel(
      animalVirtualImage: animalVirtualImages[i],
      animalRealImage: animalRealImages[i],
      animalVoice: animalVoices[i],
      animalType: Platform.localeName.split("_")[0] == "tr"
          ? tr[i]
          : Platform.localeName.split("_")[0] == "id"
              ? id[i]
              : Platform.localeName.split("_")[0] == "hi"
                  ? hi[i]
                  : Platform.localeName.split("_")[0] == "it"
                      ? it[i]
                      : Platform.localeName.split("_")[0] == "de"
                          ? de[i]
                          : en[i],
    );
    animals.add(animalModel);
  }
  animals.shuffle(Random());
}
