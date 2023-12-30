import 'dart:io';
import '/data/services/text_service.dart';

void generateText() {
  Platform.localeName.split("_")[0] == "tr"
      ? texts.addAll(textTr)
      : Platform.localeName.split("_")[0] == "hi"
          ? texts.addAll(textHi)
          : Platform.localeName.split("_")[0] == "de"
              ? texts.addAll(textDe)
              : Platform.localeName.split("_")[0] == "it"
                  ? texts.addAll(textIt)
                  : Platform.localeName.split("_")[0] == "id"
                      ? texts.addAll(textId)
                      : Platform.localeName.split("_")[0] == "pt"
                          ? texts.addAll(textPt)
                          : Platform.localeName.split("_")[0] == "ru"
                              ? texts.addAll(textRu)
                              : texts.addAll(textEn);
}
