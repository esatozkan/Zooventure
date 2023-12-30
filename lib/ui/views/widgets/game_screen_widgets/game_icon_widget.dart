// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/ui/providers/page_change_provider.dart';
import '/data/constants/constants.dart';

class GameIconWidget extends StatelessWidget {
  final String icon;
  final String text;
  final String whichFunction;
  const GameIconWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.whichFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageChangeProvider pageChangeProvider =
        Provider.of<PageChangeProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        if (whichFunction == "knowWhatTypeAnimalGame") {
          pageChangeProvider.setPage(5);
        } else if (whichFunction == "knowWhatRealImage") {
          pageChangeProvider.setPage(4);
        } else if (whichFunction == "knowWhatVirtualImage") {
          pageChangeProvider.setPage(6);
        } else if (whichFunction == "knowWhatHearGame") {
          pageChangeProvider.setPage(3);
        }
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              icon,
              height: MediaQuery.of(context).size.width < 800 ? 120 : 180,
              width: MediaQuery.of(context).size.width < 800 ? 120 : 180,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              text,
              style: TextStyle(
                fontFamily: "fontFamily",
                fontSize: MediaQuery.of(context).size.width < 800 ? 16 : 22,
                color: bottomAppBarBgColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
