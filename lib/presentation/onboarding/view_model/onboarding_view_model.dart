import 'dart:async';

import 'package:tut_app/domain/models/models.dart';
import 'package:tut_app/presentation/base/base_view_model.dart';
import 'package:tut_app/utils/assets_manger.dart';
import 'package:tut_app/utils/strings_manger.dart';

class OnboardingViewModel extends BaseViewModel
    implements OnboardingViewModelInputs, OnboardingViewModelOutputs {
  final StreamController<SliderViewObject> _streamController =
      StreamController<SliderViewObject>();

  late List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    _currentIndex = (_currentIndex + 1) % _list.length;
    _postDataToView();
    return _currentIndex;
  }

  @override
  int goPrevious() {
    _currentIndex = (_currentIndex - 1 + _list.length) % _list.length;
    _postDataToView();
    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream;

  void _postDataToView() {
    if (_list.isNotEmpty) {
      inputSliderViewObject.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex),
      );
    }
  }

  List<SliderObject> _getSliderData() => [
    SliderObject(
      AppStrings.onBoardingTitle1,
      AppStrings.onBoardingSubTitle1,
      ImageAssets.onboardinglogo1,
    ),
    SliderObject(
      AppStrings.onBoardingTitle2,
      AppStrings.onBoardingSubTitle2,
      ImageAssets.onboardinglogo2,
    ),
    SliderObject(
      AppStrings.onBoardingTitle3,
      AppStrings.onBoardingSubTitle3,
      ImageAssets.onboardinglogo3,
    ),
    SliderObject(
      AppStrings.onBoardingTitle4,
      AppStrings.onBoardingSubTitle4,
      ImageAssets.onboardinglogo4,
    ),
  ];
}

abstract class OnboardingViewModelInputs {
  int goNext();
  int goPrevious();
  void onPageChanged(int index);

  Sink get inputSliderViewObject;
}

abstract class OnboardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}
