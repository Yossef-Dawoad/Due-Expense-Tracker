class OnBoardingPageContent {
  final String title;
  final String subTitle;
  final String image;

  const OnBoardingPageContent({
    required this.title,
    required this.subTitle,
    required this.image,
  });

  /// Returns a tuple record containing the title, subtitle, and image for a page content entry.
  ///
  /// exmaple Usage:
  ///```dart
  /// final (title, subTitle, image) = pageContent.entriesRecord();
  ///```
  (String, String, String) entriesRecord() => (title, subTitle, image);
}

const List<OnBoardingPageContent> onBoardingPages = [
  // TODO: Add images and Data
  OnBoardingPageContent(image: "", title: "", subTitle: ""),
  OnBoardingPageContent(image: "", title: "", subTitle: ""),
];
