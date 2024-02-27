enum GeoFencingEnum {
  geoFencing(isGeoFencing: true),
  noGeoFencing(isGeoFencing: false);

  const GeoFencingEnum({required this.isGeoFencing});

  final bool isGeoFencing;
}