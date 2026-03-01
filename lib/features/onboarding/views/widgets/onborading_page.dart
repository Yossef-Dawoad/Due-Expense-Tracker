import 'package:expancetracker/core/constants/spaces.dart';
import 'package:expancetracker/core/utils/extensions/context_ext.dart';
import 'package:expancetracker/features/onboarding/domain/models/page_content.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.pageContent});
  final OnBoardingPageContent pageContent;

  @override
  Widget build(BuildContext context) {
    final (title, subTitle, image) = pageContent.entriesRecord();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(Spaces.medium),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Image(
            image: AssetImage(image),
            width: screenWidth * 0.8,
            height: screenHeight * 0.6,
          ),
          Text(
            title,
            style: context.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Spaces.spBetweenItem),
          Text(
            subTitle,
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
