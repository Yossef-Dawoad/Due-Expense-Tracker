import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class AppSliverPageBody extends StatelessWidget {
  const AppSliverPageBody({
    super.key,
    required this.children,
    this.horizontalPadding,
    this.topSpacing,
    this.controller,
    this.physics,
  });

  final List<Widget> children;
  final double? horizontalPadding;
  final double? topSpacing;
  final ScrollController? controller;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return CustomScrollView(
      controller: controller,
      physics: physics,
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? spacing.screenHorizontalPadding,
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: topSpacing ?? spacing.screenTopPadding),
              ...children,
            ]),
          ),
        ),
      ],
    );
  }
}
