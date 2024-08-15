class ShopItem {
  List<String> imagePath;
  String dealer; // will be User model instance
  String title;
  String? details;
  int cost;
  ShopItem(
      {required this.title,
      required this.cost,
      required this.dealer,
      required this.imagePath,
      this.details});
}
