class SliderObject {
  String title, subTitle, image;
  SliderObject(this.title, this.subTitle, this.image);
}
class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}