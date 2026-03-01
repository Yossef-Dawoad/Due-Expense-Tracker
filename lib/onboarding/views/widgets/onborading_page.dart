import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/onboarding/domain/models/page_content.dart';
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
      padding: EdgeInsets.all(context.spacing.s2),
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
            style: context.textStyles.displayMD.copyWith(
              color: context.kitColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.spacing.s4),
          Text(
            subTitle,
            style: context.textStyles.bodyMD.copyWith(
              color: context.kitColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
