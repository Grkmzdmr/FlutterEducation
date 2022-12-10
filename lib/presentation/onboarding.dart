import 'package:first_application/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Column(children: [
        Spacer(
          flex: 1,
        ),
        const Expanded(
          flex: 2,
          child: Text(
            "Karavapp'e Hoşgeldin",
            style: TextStyle(fontSize: 35),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                image: DecorationImage(
                    image: AssetImage("assets/images/78.jpg"),
                    fit: BoxFit.fill)),
          ),
        ),
        Text(
            "Bütün karavan servislerine ulaşabileceğiniz, servis hizmeti alabileceğiniz, aldığınız hizmetlerin takibini sağlayabileceğiniz Karavapp'e hoşgeldiniz."),
        Spacer(
          flex: 8,
        )
      ]),
    );
  }
}
