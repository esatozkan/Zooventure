import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/ui/providers/in_app_purchase_provider.dart';
import '/ui/providers/parent_control_provider.dart';
import '../../../../data/constants/constants.dart';
import '../../../../data/repository/change_language.dart';
import '../../../../data/services/text_service.dart';
import '../../../providers/page_change_provider.dart';
import 'parent_control_widget.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    ParentControlProvider parentControlProvider =
        Provider.of(context, listen: false);
    InAppPurchaseProvider inAppPurchaseProvider =
        Provider.of(context, listen: false);
    parentControlProvider.generateProcess();
    List<String> flags = [
      "assets/flags/de.png",
      "assets/flags/en.png",
      "assets/flags/hi.png",
      "assets/flags/id.png",
      "assets/flags/it.png",
      "assets/flags/pt.png",
      "assets/flags/ru.png",
      "assets/flags/tr.png",
    ];
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: GestureDetector(
                onTap: () async {
                  parentControlWidget(context);
                },
                child: Image.asset(
                  "assets/gift.gif",
                  height: MediaQuery.of(context).size.width < 800 ? 80 : 120,
                  width: MediaQuery.of(context).size.width < 800 ? 80 : 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Consumer<PageChangeProvider>(
              builder: (context, pageChangeProvider, _) => Text(
                pageChangeProvider.getPage == 0
                    ? texts[0]
                    : pageChangeProvider.getPage == 1
                        ? texts[1]
                        : texts[2],
                style: TextStyle(
                  color: bottomAppBarBgColor,
                  fontSize: MediaQuery.of(context).size.width < 800 ? 25 : 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Consumer<PageChangeProvider>(
              builder: (context, pageChangeProvider, _) {
                return pageChangeProvider.getPage != 2
                    ? GestureDetector(
                        onTap: () {
                          print(inAppPurchaseProvider.getIsLanguageSubscribed);
                          print(inAppPurchaseProvider.getIsPremiumSubscribed);
                          print(inAppPurchaseProvider.getIsRemoveAdSubscribed);
                          print("*****************");
                          showDialog(
                            context: context,
                            builder: (_) => SingleChildScrollView(
                              child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                color: Colors.transparent,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20, bottom: 50),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Image.asset(
                                                "assets/close.png",
                                                height: MediaQuery.of(context)
                                                            .size
                                                            .width <
                                                        800
                                                    ? 40
                                                    : 80,
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width <
                                                        800
                                                    ? 40
                                                    : 80,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.width,
                                        child: GridView.builder(
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            mainAxisSpacing: 10,
                                            crossAxisSpacing: 10,
                                            mainAxisExtent:
                                                MediaQuery.of(context)
                                                            .size
                                                            .width <
                                                        800
                                                    ? 100
                                                    : 200,
                                          ),
                                          itemCount: flags.length,
                                          itemBuilder: (context, index) =>
                                              GestureDetector(
                                            onTap: () {
                                              if (!inAppPurchaseProvider
                                                      .getIsPremiumSubscribed &&
                                                  !inAppPurchaseProvider
                                                      .getIsLanguageSubscribed) {
                                                Navigator.of(context).pop();
                                                parentControlWidget(context);
                                              } else {
                                                changeLanguage(index);
                                                pageChangeProvider
                                                    .setFlagIndex(index);
                                                Navigator.of(context).pop();
                                                setState(() {
                                                  texts[0] = texts[0];
                                                  texts[1] = texts[1];
                                                  texts[2] = texts[2];
                                                });
                                              }
                                            },
                                            child: CircleAvatar(
                                              backgroundImage:
                                                  AssetImage(flags[index]),
                                              foregroundImage: (!inAppPurchaseProvider
                                                          .getIsPremiumSubscribed &&
                                                      !inAppPurchaseProvider
                                                          .getIsLanguageSubscribed)
                                                  ? const AssetImage(
                                                      "assets/lock.png")
                                                  : null,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          height:
                              MediaQuery.of(context).size.width < 800 ? 50 : 80,
                          width:
                              MediaQuery.of(context).size.width < 800 ? 50 : 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width < 800
                                    ? 25
                                    : 40),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              flags[pageChangeProvider.getFlagIndex],
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        height:
                            MediaQuery.of(context).size.width < 800 ? 50 : 80,
                        width:
                            MediaQuery.of(context).size.width < 800 ? 50 : 80,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
