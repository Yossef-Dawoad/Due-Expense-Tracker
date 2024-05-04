import 'package:expancetracker/core/constants/images.dart';
import 'package:expancetracker/core/constants/text_strings.dart';

class OnBoardingPageContent {
  final String title;
  final String subTitle;
  final String image;

  const OnBoardingPageContent({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

const List<OnBoardingPageContent> onBoardingPages = [
  OnBoardingPageContent(
    image: Images.onBoardingImage1,
    title: Texts.onBoardingTitle1,
    subTitle: Texts.onBoardingSubTitle1,
  ),
  OnBoardingPageContent(
    image: Images.onBoardingImage2,
    title: Texts.onBoardingTitle2,
    subTitle: Texts.onBoardingSubTitle2,
  ),
];
