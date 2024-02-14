import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/widgets/responsive_button.dart';

import '../misc/colors.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images=[
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (_, index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "img/"+images[index]
                ),fit: BoxFit.cover
              )
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150,left: 20,right: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Trips"),
                      AppText(text: "Mountain", size: 30),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: 250,
                          child: AppText(
                            text: "Mountain hikes to give you an incredible sense of freedom along with an endurance test.",
                            colour: AppColors.textColor2,
                            size: 14,
                          )
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ResponsiveButton(width: 120,)
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexPageDots) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: index == indexPageDots ? 25 : 8, // Height of the primary dot
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == indexPageDots ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
      }),
    );
  }
}
