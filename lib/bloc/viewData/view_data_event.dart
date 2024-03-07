abstract class ViewDataEvents {}

class FetchData extends ViewDataEvents {
  final String endpoint;
  final bool isMobile;

  FetchData({required this.endpoint, required this.isMobile});
}
