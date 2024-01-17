import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/data/services/text_service.dart';
import '/ui/views/widgets/show_information_snackbar.dart';
import '../../../providers/in_app_purchase_provider.dart';

Future<dynamic> showModalBottomSheetWidget(
    BuildContext context, int productIndex) {
  InAppPurchaseProvider inAppPurchaseProvider =
      Provider.of(context, listen: false);
  return showModalBottomSheet(
    backgroundColor: const Color(0xfff6e2fe),
    context: context,
    builder: (_) {
      return SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height * 2) / 3,
            child: ListView.builder(
              itemCount: inAppPurchaseProvider.getProductsDetails.length ~/ 3,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  if (productIndex == 0) {
                    Navigator.of(context).pop();
                    if (!inAppPurchaseProvider.getIsRemoveAdSubscribed) {
                      inAppPurchaseProvider.getIApEngine.handlePurchase(
                          inAppPurchaseProvider
                              .getProductsDetails[index + productIndex],
                          inAppPurchaseProvider.getProductIds);
                    } else {
                      showInformationSnackbar(context, texts[15]);
                    }
                  }
                  if (productIndex == 3) {
                    Navigator.of(context).pop();
                    if (!inAppPurchaseProvider.getIsLanguageSubscribed) {
                      inAppPurchaseProvider.getIApEngine.handlePurchase(
                          inAppPurchaseProvider
                              .getProductsDetails[index + productIndex],
                          inAppPurchaseProvider.getProductIds);
                    } else {
                      showInformationSnackbar(context, texts[15]);
                    }
                  }
                  if (productIndex == 6) {
                    Navigator.of(context).pop();
                    if (!inAppPurchaseProvider.getIsPremiumSubscribed) {
                      inAppPurchaseProvider.getIApEngine.handlePurchase(
                          inAppPurchaseProvider
                              .getProductsDetails[index + productIndex],
                          inAppPurchaseProvider.getProductIds);
                    } else {
                      showInformationSnackbar(context, texts[15]);
                    }
                  }
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: ListTile(
                    title: Text(inAppPurchaseProvider
                        .getProductsDetails[index + productIndex].description),
                    subtitle: productIndex == 0
                        ? const Text("Remove Ads")
                        : productIndex == 3
                            ? const Text("Language Options Available")
                            : const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Remove Ads"),
                                  Text("Language Options Available")
                                ],
                              ),
                    trailing: Text(
                      inAppPurchaseProvider
                          .getProductsDetails[index + productIndex].price,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width < 800
                              ? 20
                              : 35),
                    ),
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
