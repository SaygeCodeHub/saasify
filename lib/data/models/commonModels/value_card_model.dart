class ValueCard {
  final String cardHeading;
  final String? value;
  final String iconPath;
  final bool? isMobile;

  const ValueCard({
    required this.cardHeading,
    this.value = '',
    required this.iconPath,
    this.isMobile = false,
  });
}
