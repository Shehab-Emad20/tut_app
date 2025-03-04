import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tut_app/utils/assets_manger.dart';
import 'package:tut_app/utils/color_manger.dart';
import 'package:tut_app/utils/constants_manger.dart';
import 'package:tut_app/utils/routes_manager.dart';
import 'package:tut_app/utils/strings_manger.dart';
import 'package:tut_app/utils/values_manger.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController = PageController();

  int _currentIndex = 0;
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManger.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManger.white,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      backgroundColor: ColorManger.darkGrey,
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return OnboardingPage(_list[index]);
        },
      ),
      bottomSheet: Container(
        color: ColorManger.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                child: Text(
                  style: Theme.of(context).textTheme.titleMedium,
                  AppStrings.skip,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() => Container(
    color: ColorManger.primaryColor,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(
              width: AppSize.s20,
              height: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.leftarrowic),
            ),
            onTap: () {
              _pageController.animateToPage(
                _getPreviousIndex(),
                duration: const Duration(
                  milliseconds: AppConstants.sliderAnimation,
                ),
                curve: Curves.bounceInOut,
              );
            },
          ),
        ),
        Row(
          children: [
            for (int i = 0; i < _list.length; i++)
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: _getProperCircle(i),
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(
              width: AppSize.s20,
              height: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.rightarrowic),
            ),
            onTap: () {
              _pageController.animateToPage(
                _getNextIndex(),
                duration: const Duration(
                  milliseconds: AppConstants.sliderAnimation,
                ),
                curve: Curves.bounceInOut,
              );
            },
          ),
        ),
      ],
    ),
  );
  int _getPreviousIndex() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  int _getNextIndex() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length - 1) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  Widget _getProperCircle(int index) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowcirlceic);
    } else {
      return SvgPicture.asset(ImageAssets.solidcircleic);
    }
  }
}

class OnboardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  const OnboardingPage(this._sliderObject, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            textAlign: TextAlign.center,
            _sliderObject.title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            textAlign: TextAlign.center,
            _sliderObject.subTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(height: AppSize.s60),
        SvgPicture.asset(_sliderObject.image),
      ],
    );
  }
}

class SliderObject {
  String title, subTitle, image;
  SliderObject(this.title, this.subTitle, this.image);
}
