import 'package:expancetracker/core/constants/spaces.dart';
import 'package:expancetracker/core/utils/device_utils/device_utilty.dart';
import 'package:expancetracker/core/utils/extensions/context_ext.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spaces.medium),
      child: Column(
        children: [
          SizedBox(height: 50),
          Image(
            image: AssetImage(image),
            width: DeviceUtils.screenWidth(context) * 0.8,
            height: DeviceUtils.screenHeight(context) * 0.6,
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
