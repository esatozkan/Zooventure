import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      backgroundColor: Colors.transparent,
      title: Consumer<PageChangeProvider>(
        builder: (context, pageChangeProvider, _) => Center(
          child: Text(
            pageChangeProvider.getPage == 0
                ? texts[0]
                : pageChangeProvider.getPage == 1
                    ? texts[1]
                    : texts[2],
            style: TextStyle(
              color: bottomAppBarBgColor,
              fontSize: 35,
              fontWeight: FontWeight.w600,
              fontFamily: "fontFamily"
            ),
          ),
        ),
      ),
    );
  }
}
