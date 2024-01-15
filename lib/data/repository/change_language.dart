import '../services/animal_service.dart';
import '../services/text_service.dart';

void changeLanguage(int index) {
  texts.clear();
  print(animals.length);
  print("*************");
  if (index == 0) {
    texts.addAll(textDe);
    for (int i = 0; i < animals.length; i++) {
      animals[i].animalType = de[i];
    }
  } else if (index == 1) {
    texts.addAll(textEn);
    for (int i = 0; i < animals.length; i++) {
      animals[i].animalType = en[i];
    }
  } else if (index == 2) {
    texts.addAll(textHi);
    for (int i = 0; i < animals.length; i++) {
      animals[i].animalType = hi[i];
    }
  } else if (index == 3) {
    texts.addAll(textId);
    for (int i = 0; i < animals.length; i++) {
      animals[i].animalType = id[i];
    }
  } else if (index == 4) {
    texts.addAll(textIt);
    for (int i = 0; i < animals.length; i++) {
      animals[i].animalType = it[i];
    }
  } else if (index == 5) {
    texts.addAll(textPt);
    for (int i = 0; i < animals.length; i++) {
      animals[i].animalType = pt[i];
    }
  } else if (index == 6) {
    texts.addAll(textRu);
    for (int i = 0; i < animals.length; i++) {
      animals[i].animalType = ru[i];
    }
  } else if (index == 7) {
    texts.addAll(textTr);
    for (int i = 0; i < animals.length; i++) {
      animals[i].animalType = tr[i];
    }
  } else {
    texts.addAll(textEn);
    for (int i = 0; i < animals.length; i++) {
      animals[i].animalType = en[i];
    }
  }
}
