import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../data/constants/constants.dart';
import '../../../../data/services/text_service.dart';
import '../../../providers/parent_control_provider.dart';
import 'in_app_purchase_widget.dart';

Future<dynamic> parentControlWidget(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) => Center(
      child: Container(
        width: (MediaQuery.of(context).size.width / 5) * 4,
        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: itemColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: bottomAppBarBgColor, width: 2)),
        child: Consumer<ParentControlProvider>(
            builder: (context, parentControlProvider, _) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                    child: CircleAvatar(
                        radius: 22,
                        backgroundColor: bottomAppBarBgColor,
                        foregroundImage:
                            const AssetImage("assets/parent_control.png")),
                  ),
                  Text(
                    texts[9],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: bottomAppBarBgColor),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 20, bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Image.asset(
                        "assets/close.png",
                        color: bottomAppBarBgColor,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              Consumer<ParentControlProvider>(
                builder: (context, parentControlProvider, _) => Center(
                  child: Text(
                    "${parentControlProvider.getFirstNumber} + ${parentControlProvider.getSecondNumber}",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SizedBox(
                  width: (MediaQuery.of(context).size.width / 5) * 4,
                  height: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20),
                    itemCount: 9,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        if (index + 1 == parentControlProvider.getResult) {
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const InAppPurchaseWidget(),
                            ),
                          );
                        } else {
                          parentControlProvider.generateProcess();
                          Navigator.of(context).pop();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: bottomAppBarBgColor,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(
                                fontSize: 22, color: bottomAppBarBgColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    ),
  );
}
