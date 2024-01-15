// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/ui/providers/page_change_provider.dart';
import '/data/services/text_service.dart';
import '/ui/providers/question_game_provider.dart';

// ignore: must_be_immutable
class QuestionGameOverWidget extends StatelessWidget {
  late String whichQuestion;
  QuestionGameOverWidget({
    Key? key,
    required this.whichQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageChangeProvider pageChangeProvider =
        Provider.of<PageChangeProvider>(context, listen: false);
    return Consumer<QuestionGameProvider>(
      builder: (context, questionGameProvider, _) => SingleChildScrollView(
        child: Visibility(
          visible: questionGameProvider.getQuestionIndex ==
                  questionGameProvider.getNumberOfQuestion
              ? true
              : false,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/games/game_over.gif",
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width/2,
                    fit: BoxFit.cover,
                  ),
                  TextButton(
                    onPressed: () {
                      if (whichQuestion == "knowWhatRealImage") {
                        pageChangeProvider.setPage(4);
                      } else if (whichQuestion == "knowWhatVirtualImage") {
                        pageChangeProvider.setPage(6);
                      } else if (whichQuestion == "knowWhatAnimalTypeScreen") {
                        pageChangeProvider.setPage(5);
                      } else if (whichQuestion == "knowWhatHearAnimalScreen") {
                        pageChangeProvider.setPage(3);
                      }
                    },
                    child: textButton(
                      texts[7],
                      40,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      pageChangeProvider.setPage(2);
                    },
                    child: textButton(texts[8], 60),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget textButton(String text, double horizontal) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: horizontal,
      vertical: 10,
    ),
    decoration: BoxDecoration(
      color: const Color(0xff01ddb3),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        width: 2,
        color: const Color(0xff01ddb3),
      ),
    ),
    child: Text(
      text,
      style: const TextStyle(
        color: Color(0xffeb92e5),
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
