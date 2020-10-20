import 'package:easy_localization/easy_localization.dart';
enum DeliveryType {
  ChemicalWaste,
  DangerousGoods,
  LiquidNitrogen
}

extension DeliveryTypeExtension on DeliveryType{
    String get value {
    switch (this) {
      case DeliveryType.ChemicalWaste:
        return 'Chemical Waste'.tr();
      case DeliveryType.DangerousGoods:
        return 'Dangerous Goods'.tr();
      case DeliveryType.LiquidNitrogen:
        return 'Liquid Nitrogen'.tr();
      default:
        return null;
    }
  }
}