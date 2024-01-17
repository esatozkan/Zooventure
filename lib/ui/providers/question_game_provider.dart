import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '/ui/views/screens/main_screen.dart';
import '/data/repository/generate_question.dart';

class QuestionGameProvider extends ChangeNotifier {
  int numberOfQuestion = 2;
  int questionIndex = 0;
  bool answerControl = false;
  bool onTap = false;
  List<bool> isVisibleList = List.filled(4, false);

  int get getNumberOfQuestion => numberOfQuestion;
  int get getQuestionIndex => questionIndex;
  bool get getAnswerControl => answerControl;
  bool get getOnTap => onTap;
  List<bool> get getIsVisibleList => isVisibleList;

  AudioPlayer audioPlayer = AudioPlayer();

  setIsVisibleListItem(int index, bool val) {
    isVisibleList[index] = val;
    notifyListeners();
  }

  setAnswerControl() {
    answerControl = !answerControl;
    notifyListeners();
  }

  Future<void> nextQuestion(int index,context, {String isVoice = ""}) async {
    answerControl = !answerControl;

    if (question[questionIndex].option.values.toList()[index] == false) {
      await audioPlayer.play(
        AssetSource(
          "games/incorrect.wav",
        ),
      );
      answerControl = !answerControl;
    } else {
      audioPlayer.play(
        AssetSource("games/correct.mp3"),
      );
      if (questionIndex != numberOfQuestion) {
        await Future.delayed(const Duration(milliseconds: 1500), () {
          setIsVisibleListItem(index, false);
          answerControl = !answerControl;
          isVisibleList = List.filled(4, false);
          questionIndex++;
          onTap = true;
          if (isVoice == "knowWhatAnimalTypeScreen" &&
              questionIndex != numberOfQuestion) {
            audioPlayer.play(
              AssetSource(question[questionIndex].question.animalType),
            );
          } else if (isVoice == "knowWhatHearAnimalScreen" &&
              questionIndex != numberOfQuestion) {
            audioPlayer.play(
              AssetSource(question[questionIndex].question.animalVoice),
            );
          } else {
            googleAdsProvider.showInterstitialAd(context);
          }
        });
      }
    }

    notifyListeners();
  }

  resetGame() {
    questionIndex = 0;
    answerControl = false;
    onTap = true;
  }
}
