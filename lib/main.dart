import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:techblog/Constants/my_colors.dart';
import 'package:techblog/view/splash_screen.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: SolidColors.statusBarColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: SolidColors.systemNavigationBarColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TechBlog",
      // Localization-Farsi //
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa', ''), // Parsian (Farsi)
      ],
      theme: ThemeData(
        fontFamily: "Dana",
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontFamily: "Dana",
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            color: SolidColors.postertitle,
          ),
          titleMedium: TextStyle(
            fontFamily: "Dana",
            fontSize: 14.0,
            fontWeight: FontWeight.w300,
            color: SolidColors.postersubtitle,
          ),
          bodyLarge: TextStyle(fontFamily: "Dana", fontSize: 13.0, fontWeight: FontWeight.w300),
          displayMedium: TextStyle(
            fontFamily: "Dana",
            fontSize: 14.0,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          displaySmall: TextStyle(
            fontFamily: "Dana",
            fontSize: 14.0,
            color: SolidColors.seeMore,
            fontWeight: FontWeight.w700,
          ),
          headlineMedium: TextStyle(
            fontFamily: "Dana",
            fontSize: 14.0,
            color: Colors.green,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}

