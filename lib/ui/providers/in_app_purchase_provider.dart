import 'dart:convert';
import 'dart:io';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
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

  bool isRemoveAdSubscribed = OnePref.getRemoveAds() ?? false;
  bool isLanguageSubscribed = OnePref.getBool("isLanguageSubscribed") ?? false;
  bool isPremiumSubscribed = OnePref.getPremium() ?? false;

  IApEngine iApEngine = IApEngine();

  List<ProductDetails> get getProductsDetails => _products;
  List<ProductId> get getProductIds => _productIds;

  bool get getIsRemoveAdSubscribed => isRemoveAdSubscribed;
  bool get getIsLanguageSubscribed => isLanguageSubscribed;
  bool get getIsPremiumSubscribed => isPremiumSubscribed;

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
        });
      }
    });
  }

  Future<void> listenPurchases(List<PurchaseDetails> list) async {
    List<String> removeAdProducts = [
      "remove_ad_weekly",
      "remove_ad_monthly",
      "remove_ad_yearly",
    ];
    List<String> languageProducts = [
      "language_weekly",
      "language_monthly",
      "language_yearly",
    ];

    for (PurchaseDetails purchaseDetails in list) {
      if (removeAdProducts.contains(purchaseDetails.productID)) {
        if (list.isNotEmpty) {
          if (purchaseDetails.status == PurchaseStatus.restored ||
              purchaseDetails.status == PurchaseStatus.purchased) {
            Map purchaseData = json
                .decode(purchaseDetails.verificationData.localVerificationData);

            if (purchaseData["acknowledged"]) {
              //restore purchase
              isRemoveAdSubscribed = true;
              OnePref.setRemoveAds(isRemoveAdSubscribed);
            } else {
              //first time purchase
              if (Platform.isAndroid) {
                final InAppPurchaseAndroidPlatformAddition androidAddition =
                    iApEngine.inAppPurchase.getPlatformAddition<
                        InAppPurchaseAndroidPlatformAddition>();
                await androidAddition
                    .consumePurchase(purchaseDetails)
                    .then((value) {
                  updateIsRemoveAdSubscription(true);
                });
              }

              //complete purchase
              if (purchaseDetails.pendingCompletePurchase) {
                await iApEngine.inAppPurchase
                    .completePurchase(purchaseDetails)
                    .then((value) {
                  updateIsRemoveAdSubscription(true);
                });
              }
            }
          }
        } else {
          updateIsRemoveAdSubscription(false);
        }
      } else if (languageProducts.contains(purchaseDetails.productID)) {
        if (list.isNotEmpty) {
          if (purchaseDetails.status == PurchaseStatus.restored ||
              purchaseDetails.status == PurchaseStatus.purchased) {
            Map purchaseData = json
                .decode(purchaseDetails.verificationData.localVerificationData);

            if (purchaseData["acknowledged"]) {
              //restore purchase
              isLanguageSubscribed = true;
              OnePref.setBool("isLanguageSubscribed", isLanguageSubscribed);
            } else {
              //first time purchase
              if (Platform.isAndroid) {
                final InAppPurchaseAndroidPlatformAddition androidAddition =
                    iApEngine.inAppPurchase.getPlatformAddition<
                        InAppPurchaseAndroidPlatformAddition>();
                await androidAddition
                    .consumePurchase(purchaseDetails)
                    .then((value) {
                  updateIsLanguageSubscription(true);
                });
              }

              //complete purchase
              if (purchaseDetails.pendingCompletePurchase) {
                await iApEngine.inAppPurchase
                    .completePurchase(purchaseDetails)
                    .then((value) {
                  updateIsLanguageSubscription(true);
                });
              }
            }
          }
        } else {
          updateIsLanguageSubscription(false);
        }
      } else {
        if (list.isNotEmpty) {
          if (purchaseDetails.status == PurchaseStatus.restored ||
              purchaseDetails.status == PurchaseStatus.purchased) {
            Map purchaseData = json
                .decode(purchaseDetails.verificationData.localVerificationData);

            if (purchaseData["acknowledged"]) {
              //restore purchase
              isPremiumSubscribed = true;
              OnePref.setPremium(isPremiumSubscribed);
            } else {
              //first time purchase
              if (Platform.isAndroid) {
                final InAppPurchaseAndroidPlatformAddition androidAddition =
                    iApEngine.inAppPurchase.getPlatformAddition<
                        InAppPurchaseAndroidPlatformAddition>();
                await androidAddition
                    .consumePurchase(purchaseDetails)
                    .then((value) {
                  updateIsPremiumSubscription(true);
                });
              }

              //complete purchase
              if (purchaseDetails.pendingCompletePurchase) {
                await iApEngine.inAppPurchase
                    .completePurchase(purchaseDetails)
                    .then((value) {
                  updateIsPremiumSubscription(true);
                });
              }
            }
          }
        } else {
          updateIsPremiumSubscription(false);
        }
      }
    }
  }

  void updateIsRemoveAdSubscription(bool value) {
    isRemoveAdSubscribed = value;
    OnePref.setRemoveAds(isRemoveAdSubscribed);
    notifyListeners();
  }

  void updateIsLanguageSubscription(bool value) {
    isLanguageSubscribed = value;
    OnePref.setBool("isLanguageSubscribed", isLanguageSubscribed);
    notifyListeners();
  }

  void updateIsPremiumSubscription(bool value) {
    isPremiumSubscribed = value;
    OnePref.setPremium(isPremiumSubscribed);
    notifyListeners();
  }

  void restoreSubscription() {
    iApEngine.inAppPurchase.restorePurchases();
  }
}
