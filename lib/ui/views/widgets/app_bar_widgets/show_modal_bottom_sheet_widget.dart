import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/in_app_purchase_provider.dart';

Future<dynamic> showModalBottomSheetWidget(
    BuildContext context, int productIndex) {
  InAppPurchaseProvider inAppPurchaseProvider =
      Provider.of(context, listen: false);
  return showModalBottomSheet(
    backgroundColor: Colors.red,
    context: context,
    builder: (_) {
      return SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            child: ListView.builder(
              itemCount: inAppPurchaseProvider.getProductsDetails.length ~/ 3,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => {
                  Navigator.of(context).pop(),
                  inAppPurchaseProvider.getIApEngine.handlePurchase(
                      inAppPurchaseProvider
                          .getProductsDetails[index + productIndex],
                      inAppPurchaseProvider.getProductIds)
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: ListTile(
                    title: Text(inAppPurchaseProvider
                        .getProductsDetails[index + productIndex].title),
                    subtitle: Text(inAppPurchaseProvider
                        .getProductsDetails[index + productIndex].description),
                    trailing: Text(inAppPurchaseProvider
                        .getProductsDetails[index + productIndex].price),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
