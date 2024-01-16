import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import '/ui/providers/in_app_purchase_provider.dart';
import '/ui/providers/parent_control_provider.dart';
import '/ui/providers/google_ads_provider.dart';
import '/ui/providers/question_game_provider.dart';
import '/ui/providers/page_change_provider.dart';
import '/ui/views/screens/main_screen.dart';
import 'data/repository/generate_animal.dart';
import 'data/repository/generate_text.dart';
import 'data/repository/set_flag_image.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider(
          create: (_) => PageChangeProvider(),
        ),
        ListenableProvider(
          create: (_) => QuestionGameProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GoogleAdsProvider(),
        ),
        ListenableProvider(
          create: (_) => ParentControlProvider(),
        ),
        ListenableProvider(
          create: (_) => InAppPurchaseProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    generateAnimal();
    generateText();
    setFlagImage(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
