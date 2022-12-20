import 'package:first_application/app/app_prefs.dart';
import 'package:first_application/app/di.dart';
import 'package:first_application/presentation/onboarding/onboarding_viewmodel.dart';
import 'package:first_application/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController _pageController = PageController(initialPage: 0);
  OnBoardingViewModel _viewModel = OnBoardingViewModel();
  
  final AppPreferences _appPreferences = instance<AppPreferences>();
  




  _bind() {
    _viewModel.start();
    _appPreferences.setOnboardingScreenViewed();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primary,
        body: StreamBuilder<OnboardingObject>(
          stream: _viewModel.outputOnboardingObject,
          builder: (context, snapshot) {
            return _getContentWidget(snapshot.data);
          },
        ));
  }

  Widget _getContentWidget(OnboardingObject? onboardingObject) {
    if (onboardingObject == null) {
      return const SizedBox.shrink();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: PageView.builder(
            itemCount: onboardingObject.numberOfSlide,
            controller: _pageController,
            onPageChanged: (value) async {
              const Duration(milliseconds: 0);
              _viewModel.onPageChanged(value);
            },
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: Text(onboardingObject.sliderObject.title)),
                  Expanded(
                    child: Image(
                      height: MediaQuery.of(context).size.height / 2.5,
                      width: MediaQuery.of(context).size.width / 1.15,
                      image: AssetImage(onboardingObject.sliderObject.imageUrl),
                    ),
                  ),
                  Expanded(child: Text(onboardingObject.sliderObject.subtitle))
                ],
              );
            },
          ),
        ),
      );
    }
  }
}
