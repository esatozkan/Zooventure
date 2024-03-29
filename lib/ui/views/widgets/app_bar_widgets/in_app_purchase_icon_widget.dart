// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '/data/constants/constants.dart';

class InAppPurchaseIconWidget extends StatelessWidget {
  final String image;
  final String text;
  final Function() onTap;
  const InAppPurchaseIconWidget({
    Key? key,
    required this.image,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
                color: bottomAppBarBgColor,
                fontSize:MediaQuery.of(context).size.width < 800? 13:23,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
