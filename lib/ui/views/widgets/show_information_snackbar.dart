import 'package:flutter/material.dart';

import '../../../data/constants/constants.dart';

void showInformationSnackbar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: bottomAppBarBgColor,
      content: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 23, color: itemColor),
        ),
      ),
    ),
  );
}
