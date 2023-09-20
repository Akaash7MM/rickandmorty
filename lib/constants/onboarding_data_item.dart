class OnboardingDataItem {
  OnboardingDataItem({required this.id, required this.headingText, required this.bodyText});

  final logoSource = 'assets/logo_rick_morty.png';
  final id;
  final headingText;
  final bodyText;

  String get getImageSource => 'assets/ob_${id}_rick_morty.png';
}
