import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAdsProvider with ChangeNotifier {
  InterstitialAd? interstitialAd;
  BannerAd? bannerAd;
  int interstitialAdIndex = 0;
  int showInterstitialAdIndex = 3;
  bool isVoice = false;
  final String _loadInterstitialAdId = "ca-app-pub-3940256099942544/1033173712";
  final String _loadBannerAdId = "ca-app-pub-3940256099942544/6300978111";

  void loadInterstitialAd({bool showAfterLoad = false}) {
    InterstitialAd.load(
        adUnitId: _loadInterstitialAdId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            interstitialAd = ad;
            if (showAfterLoad) {
              showInterstitialAd();
            }
          },
          onAdFailedToLoad: (LoadAdError error) {},
        ));
  }

  void showInterstitialAd() {
    if (interstitialAd != null &&
        interstitialAdIndex == showInterstitialAdIndex - 1) {
      interstitialAd!.show();
      interstitialAdIndex = 0;
      loadInterstitialAd();
    } else {
      interstitialAdIndex++;
    }

    notifyListeners();
  }

  void loadBannerAd() {
    bannerAd = BannerAd(
      adUnitId: _loadBannerAdId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd = ad as BannerAd;
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    )..load();
  }

  void setIsVoice(bool val) {
    isVoice = val;
    notifyListeners();
  }
}