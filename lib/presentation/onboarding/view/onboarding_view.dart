import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tut_app/domain/models/models.dart';
import 'package:tut_app/presentation/onboarding/view_model/onboarding_view_model.dart';
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
  final PageController _pageController = PageController();
  final OnboardingViewModel _viewModel = OnboardingViewModel();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,

      builder: (context, snapshot) => _getContenttWidget(snapshot.data),
    );
  }

  Widget _getContenttWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
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
          itemCount: sliderViewObject.numOfSlides,
          onPageChanged: (index) {
            _viewModel.onPageChanged(index);
          },
          itemBuilder: (context, index) {
            return OnboardingPage(sliderViewObject.sliderObject);
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
              _getBottomSheetWidget(sliderViewObject),
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) => Container(
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
                _viewModel.goPrevious(),
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
            for (int i = 0; i < sliderViewObject.numOfSlides; i++)
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: _getProperCircle(i, sliderViewObject.currentIndex),
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
                _viewModel.goNext(),
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

  Widget _getProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowcirlceic);
    } else {
      return SvgPicture.asset(ImageAssets.solidcircleic);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
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
