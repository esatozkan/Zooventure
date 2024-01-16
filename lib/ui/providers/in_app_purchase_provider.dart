import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:onepref/onepref.dart';

class InAppPurchaseProvider extends ChangeNotifier {
  late final List<ProductDetails> _products = <ProductDetails>[];
  final List<ProductId> _productIds = <ProductId>[
    ProductId(id: "remove_ad_weekly", isConsumable: false),
    ProductId(id: "remove_ad_monthly", isConsumable: false),
    ProductId(id: "remove_ad_yearly", isConsumable: false),
    ProductId(id: "language_weekly", isConsumable: false),
    ProductId(id: "language_monthly", isConsumable: false),
    ProductId(id: "language_yearly", isConsumable: false),
    ProductId(id: "premium_weekly", isConsumable: false),
    ProductId(id: "premium_monthly", isConsumable: false),
    ProductId(id: "premium_yearly", isConsumable: false),
  ];
  bool isRemoveAdSubscribed = false;

  IApEngine iApEngine = IApEngine();

  List<ProductDetails> get getProductsDetails => _products;
  List<ProductId> get getProductIds => _productIds;

  bool get getIsRemoveAdSubscribed => isRemoveAdSubscribed;

  IApEngine get getIApEngine => iApEngine;

  void getProducts() async {
    await iApEngine.getIsAvailable().then((value) async {
      if (value) {
        await iApEngine.queryProducts(_productIds).then((res) {
          _products.clear();

          List<String> productOrder = [
            "remove_ad_weekly",
            "remove_ad_monthly",
            "remove_ad_yearly",
            "language_weekly",
            "language_monthly",
            "language_yearly",
            "premium_weekly",
            "premium_monthly",
            "premium_yearly",
          ];
          for (int i = 0; i < res.productDetails.length; i++) {
            int index = res.productDetails
                .indexWhere((element) => element.id == productOrder[i]);
            _products.add(res.productDetails[index]);
          }

          _products.forEach((element) {
            print(element.id);
          });
        });
      }
    });
  }
}

//17. dakika
