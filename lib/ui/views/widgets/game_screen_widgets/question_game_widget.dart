// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import '/ui/views/screens/main_screen.dart';
import '/ui/views/widgets/game_screen_widgets/question_game_over_widget.dart';
import '/data/repository/generate_question.dart';
import '/ui/providers/page_change_provider.dart';
import '/ui/providers/question_game_provider.dart';

// ignore: must_be_immutable
class QuestionGameWidget extends StatelessWidget {
  QuestionGameWidget({
    Key? key,
    required this.whichQuestion,
  }) : super(key: key);
  late String whichQuestion;

  @override
  Widget build(BuildContext context) {
    AudioPlayer audioPlayer = AudioPlayer();

    return Consumer<PageChangeProvider>(
      builder: (context, pageChangeProvider, _) {
        Provider.of<QuestionGameProvider>(context, listen: false).resetGame();
        generateQuestion(context);
        if (whichQuestion == "knowWhatAnimalTypeScreen") {
          audioPlayer.play(
            AssetSource(
              question[Provider.of<QuestionGameProvider>(context, listen: false)
                      .getQuestionIndex]
                  .question
                  .animalType,
            ),
          );
        } else if (whichQuestion == "knowWhatHearAnimalScreen") {
          audioPlayer.play(
            AssetSource(
              question[Provider.of<QuestionGameProvider>(context, listen: false)
                      .getQuestionIndex]
                  .question
                  .animalVoice,
            ),
          );
        } else {
          googleAdsProvider.showInterstitialAd();
        }

        return SafeArea(
          child: Consumer<QuestionGameProvider>(
            builder: (context, questionGameProvider, _) => Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                ),
                Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: GestureDetector(
                            onTap: () {
                              pageChangeProvider.setPage(2);
                            },
                            child: Image.asset(
                              "assets/games/back_icon.png",
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: whichQuestion == "knowWhatVirtualImage" ||
                                  whichQuestion == "knowWhatRealImage"
                              ? Image.asset(
                                  whichQuestion == "knowWhatVirtualImage"
                                      ? question[questionGameProvider
                                              .getQuestionIndex]
                                          .question
                                          .animalRealImage
                                      : question[questionGameProvider
                                              .getQuestionIndex]
                                          .question
                                          .animalVirtualImage,
                                  fit: BoxFit.cover,
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      decoration: const BoxDecoration(
                                          color: Colors.green),
                                      child: GestureDetector(
                                        onTap: () {
                                          if (whichQuestion ==
                                              "knowWhatAnimalTypeScreen") {
                                            audioPlayer.play(
                                              AssetSource(
                                                question[questionGameProvider
                                                        .getQuestionIndex]
                                                    .question
                                                    .animalType,
                                              ),
                                            );
                                          } else {
                                            audioPlayer.play(
                                              AssetSource(
                                                question[questionGameProvider
                                                        .getQuestionIndex]
                                                    .question
                                                    .animalVoice,
                                              ),
                                            );
                                          }
                                        },
                                        child: const Icon(
                                          Icons.hearing,
                                          size: 60,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                        itemCount: 4,
                        padding: const EdgeInsets.all(20),
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  if (questionGameProvider.getOnTap &&
                                      questionGameProvider.getQuestionIndex !=
                                          questionGameProvider
                                              .getNumberOfQuestion) {
                                    questionGameProvider.setIsVisibleListItem(
                                        index, true);
                                    if (whichQuestion ==
                                            "knowWhatVirtualImage" ||
                                        whichQuestion == "knowWhatRealImage") {
                                      await questionGameProvider
                                          .nextQuestion(index);
                                    } else {
                                      if (whichQuestion ==
                                          "knowWhatAnimalTypeScreen") {
                                        await questionGameProvider.nextQuestion(
                                            index,
                                            isVoice:
                                                "knowWhatAnimalTypeScreen");
                                      } else {
                                        await questionGameProvider.nextQuestion(
                                            index,
                                            isVoice:
                                                "knowWhatHearAnimalScreen");
                                      }
                                    }
                                  }
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.asset(
                                    whichQuestion == "knowWhatVirtualImage" ||
                                            whichQuestion ==
                                                "knowWhatAnimalTypeScreen"
                                        ? question[questionGameProvider
                                                .getQuestionIndex]
                                            .option
                                            .keys
                                            .toList()[index]
                                            .animalVirtualImage
                                        : question[questionGameProvider
                                                .getQuestionIndex]
                                            .option
                                            .keys
                                            .toList()[index]
                                            .animalRealImage,
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: questionGameProvider
                                    .getIsVisibleList[index],
                                child: Image.asset(
                                  question[questionGameProvider
                                                  .getQuestionIndex]
                                              .option
                                              .values
                                              .toList()[index] ==
                                          true
                                      ? "assets/games/correct_answer.png"
                                      : "assets/games/wrong_answer.png",
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    googleAdsProvider.bannerAd != null
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: SafeArea(
                                child: SizedBox(
                              width: googleAdsProvider.bannerAd!.size.width
                                  .toDouble(),
                              height: googleAdsProvider.bannerAd!.size.height
                                  .toDouble(),
                              child: AdWidget(ad: googleAdsProvider.bannerAd!),
                            )),
                          )
                        : Container(),
                  ],
                ),
                QuestionGameOverWidget(whichQuestion: whichQuestion),
              ],
            ),
          ),
        );
      },
    );
  }
}
