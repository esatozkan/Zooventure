import 'package:flutter/material.dart';
import 'package:onepref/onepref.dart';
import 'package:provider/provider.dart';
import '/ui/providers/in_app_purchase_provider.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import '../widgets/app_bar_widgets/app_bar_widget.dart';
import '/ui/providers/google_ads_provider.dart';
import '/ui/views/screens/games/know_what_hear_screen.dart';
import '/ui/views/screens/games/know_what_real_animal_screen.dart';
import '/ui/views/screens/games/know_what_type_animal_screen.dart';
import '/ui/views/screens/games/know_what_virtual_animal_screen.dart';
import '/ui/providers/page_change_provider.dart';
import '/ui/views/screens/game_screen.dart';
import '/ui/views/screens/listening_animal_sounds_screen.dart';
import '/ui/views/screens/listening_animal_type_screen.dart';

GoogleAdsProvider googleAdsProvider = GoogleAdsProvider();

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    InAppPurchaseProvider inAppPurchaseProvider =
        Provider.of<InAppPurchaseProvider>(context, listen: false);

    inAppPurchaseProvider.restoreSubscription();

    inAppPurchaseProvider.getIApEngine.inAppPurchase.purchaseStream
        .listen((list) {
      if (list.isNotEmpty) {
        // restore subscription
        for (var element in list) {
          if (element.productID.contains("remove_ad_")) {
            OnePref.setRemoveAds(true);
          }
          if (element.productID.contains("premium_")) {
            OnePref.setPremium(true);
          }
          if (element.productID.contains("language_")) {
            OnePref.setBool("isLanguageSubscribed", true);
          }
        }
      } else {
        // do nothing or deactivate the subscription if the user is premium
        OnePref.setPremium(false);
        OnePref.setRemoveAds(false);
        OnePref.setBool("isLanguageSubscribed", false);
      }
    });

    inAppPurchaseProvider.getProducts();
    inAppPurchaseProvider.getIApEngine.inAppPurchase.purchaseStream
        .listen((listOfPurchaseDetails) {
      inAppPurchaseProvider.listenPurchases(listOfPurchaseDetails);
    });
    googleAdsProvider.loadBannerAd();
    googleAdsProvider.loadInterstitialAd(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = const [
      ListeningAnimalTypeScreen(),
      ListeningAnimalSoundsScreen(),
      GameScreen(),
      KnowWhatHearScreen(),
      KnowWhatRealAnimalScreen(),
      KnowWhatTypeAnimalScreen(),
      KnowWhatVirtualAnimalScreen(),
    ];
    PageChangeProvider pageChangeProvider =
        Provider.of<PageChangeProvider>(context);

    return Scaffold(
      body: pageChangeProvider.getPage == 0 ||
              pageChangeProvider.getPage == 1 ||
              pageChangeProvider.getPage == 2
          ? Stack(
              children: [
                Center(
                  child: Image.asset(
                    pageChangeProvider.getPage == 0
                        ? "assets/bottom_nav_bar/listening_animal_types_icon.png"
                        : pageChangeProvider.getPage == 1
                            ? "assets/bottom_nav_bar/listening_animal_sounds_icon.png"
                            : "assets/bottom_nav_bar/game_icon.png",
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    color: Colors.grey.shade400,
                  ),
                ),
                const AppBarWidget(),
                Padding(
                    padding: const EdgeInsets.only(top: 120, bottom: 60),
                    child: pages[pageChangeProvider.getPage]),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: BottomNavBar(),
                )
              ],
            )
          : pages[pageChangeProvider.getPage],
    );
  }
}
