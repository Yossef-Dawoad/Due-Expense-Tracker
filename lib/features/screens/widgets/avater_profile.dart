import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:flutter/material.dart';

class AvaterInformationWidget extends StatelessWidget {
  const AvaterInformationWidget({
    super.key,
    this.backgroundColor,
    this.title,
    this.subtitle,
    required this.image,
  });

  final Color? backgroundColor;
  final String? title;
  final String? subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.amber,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: AssetImage(image),
            ),
          ),
        ),
        const SizedBox(width: 10),
        if (title != null && subtitle != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title!, style: f14greyRegularText),
              Text(subtitle!, style: f18BlackBold)
            ],
          )
      ],
    );
  }
}
