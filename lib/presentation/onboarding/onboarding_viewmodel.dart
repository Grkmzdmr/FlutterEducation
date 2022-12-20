import 'dart:async';

import 'package:first_application/domain/model/slider_object.dart';
import 'package:first_application/presentation/base/base_viewmodel.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnboardingViewModelInputs, OnboardingViewModelOutputs {
  final StreamController _streamController =
      StreamController<OnboardingObject>();

  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToOnboardingView();
  }

  List<SliderObject> _getSliderData() => [
        SliderObject("132132.Sayfa", "assets/images/78.jpg", "1. sayfa açıklaması"),
        SliderObject("2.Sayfa", "assets/images/79.jpg", "2. sayfa açıklaması"),
        SliderObject("3.Sayfa", "assets/images/79.jpg", "3.sayfa açıklaması"),
      ];


     
      


      
  

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToOnboardingView();
  }

  @override
  Stream<OnboardingObject> get outputOnboardingObject =>
      _streamController.stream.map((OnboardingObject) => OnboardingObject);

  @override
  Sink get inputOnboardingObject => _streamController.sink;

  _postDataToOnboardingView() {
    inputOnboardingObject.add(
        OnboardingObject(_currentIndex, _list.length, _list[_currentIndex]));
  }
}

abstract class OnboardingViewModelInputs {

  void onPageChanged(int index);

  Sink get inputOnboardingObject;
}

abstract class OnboardingViewModelOutputs {
  Stream<OnboardingObject> get outputOnboardingObject;
  
}

class OnboardingObject {
  SliderObject sliderObject;
  int numberOfSlide;
  int currentIndex;

  OnboardingObject(this.currentIndex, this.numberOfSlide, this.sliderObject);
}
