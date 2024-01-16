import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '/data/constants/constants.dart';
import '/data/services/text_service.dart';
import 'in_app_purchase_icon_widget.dart';

class InAppPurchaseWidget extends StatelessWidget {
  const InAppPurchaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<InAppPurchaseIconWidget> iconList = [
      InAppPurchaseIconWidget(
        image: "assets/in_app_purchase_icon/play_console_logo.jpg",
        text: texts[11],
        onTap: () async {
          final Uri uri = Uri.parse(
              "https://play.google.com/store/apps/dev?id=8206297146535463722");
          if (await launchUrl(uri)) {
            await launchUrl(uri);
          }
        },
      ),
      InAppPurchaseIconWidget(
        image: "assets/in_app_purchase_icon/play_console_logo.jpg",
        text: texts[11],
        onTap: () async {
          const url =
              "https://play.google.com/store/apps/details?id=com.oyunakademisi.zooventure";
          if (await canLaunch(url)) {
            await launch(url);
          }
        },
      ),
      InAppPurchaseIconWidget(
        image: "assets/in_app_purchase_icon/play_console_logo.jpg",
        text: texts[11],
        onTap: () async {
          const url =
              "https://play.google.com/store/apps/details?id=com.oyunakademisi.zooventure";
          if (await canLaunch(url)) {
            await launch(url);
          }
        },
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          texts[10],
          style: TextStyle(
              color: bottomAppBarBgColor, fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 22,
            color: bottomAppBarBgColor,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(40),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: .8,
        ),
        itemCount: 3,
        itemBuilder: (context, index) => iconList[index],
      ),
    );
  }
}
