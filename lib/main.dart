import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import '/ui/providers/google_ads_provider.dart';
import '/ui/providers/question_game_provider.dart';
import '/data/repository/generate_text.dart';
import '/data/repository/generate_animal.dart';
import '/ui/providers/page_change_provider.dart';
import '/ui/views/screens/main_screen.dart';

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
        ListenableProvider(
          create: (_) => GoogleAdsProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

//version numarası 10 olacak

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    generateAnimal();
    generateText();
    print(Platform.localeName.split("_")[0]);
    print("***************");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
