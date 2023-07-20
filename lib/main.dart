import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '/views/Onboarding.dart';

import 'cardHome/state.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppState(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
      
        home: Onboarding(),
      );
}
