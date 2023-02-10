import '../../constants/constants.dart';

enum PricingPlan {
  free("Free", 0, freeList),
  basic("Basic", 35, basicList),
  premium("Premium", 80, premiumList);

  const PricingPlan(this.title, this.price, this.list);
  final String title;
  final int price;
  final List<String> list;
}
