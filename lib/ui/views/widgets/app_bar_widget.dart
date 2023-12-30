import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '/data/constants/constants.dart';
import '/data/services/text_service.dart';
import '/ui/providers/page_change_provider.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GestureDetector(
              onTap: () async {
                const url =
                    "https://play.google.com/store/apps/details?id=com.oyunakademisi.zooventure";
                // ignore: deprecated_member_use
                if (await canLaunch(url)) {
                  // ignore: deprecated_member_use
                  await launch(url);
                }
              },
              child: Image.asset(
                "assets/zooventure_pro.gif",
                height: MediaQuery.of(context).size.width < 800 ? 60 : 80,
                width: MediaQuery.of(context).size.width < 800 ? 60 : 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
      title: Consumer<PageChangeProvider>(
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
              fontFamily: "fontFamily"),
        ),
      ),
    );
  }
}
