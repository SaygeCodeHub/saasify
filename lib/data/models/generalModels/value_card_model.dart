class ValueCardModel {
  final String cardHeading;
  final String? value;
  final String iconPath;
  final bool? isMobile;
  final String routeName;

  const ValueCardModel({
    this.routeName = '',
    required this.cardHeading,
    this.value = '',
    required this.iconPath,
    this.isMobile = false,
  });
}
