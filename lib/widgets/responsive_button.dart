import 'package:flutter/material.dart';
import 'package:flutter_cubit/pages/navpages/main_page.dart';

import '../misc/colors.dart';
import '../pages/home_page.dart';
import 'app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;

  ResponsiveButton({Key? key, this.width = 120, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      // Flexible widgets require constraints so that they can allocate space
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainPage()), // Replace 'HomePage' with your actual home page class
          );
        },
        child: Container(
            width: isResponsive == true ? double.maxFinite : width,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.mainColor,
            ),
            child: Row(
              mainAxisAlignment: isResponsive == true
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                isResponsive == true
                    ? Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: const AppText(
                      text: "Book a Trip",
                      colour: Colors.white,
                    ))
                    : Container(),
                Image.asset("img/button-one.png"),
              ],
            )),
      ),
    );
  }
}