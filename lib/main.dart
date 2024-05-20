import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/providers/auth.provider.dart';
import 'package:qaida/providers/category.provider.dart';
import 'package:qaida/providers/geolocation.provider.dart';
import 'package:qaida/providers/interests.provider.dart';
import 'package:qaida/providers/login.provider.dart';
import 'package:qaida/providers/place.provider.dart';
import 'package:qaida/providers/recommendation.provider.dart';
import 'package:qaida/providers/registration.provider.dart';
import 'package:qaida/providers/review.provider.dart';
import 'package:qaida/providers/template.provider.dart';
import 'package:qaida/providers/theme.provider.dart';
import 'package:qaida/providers/user.provider.dart';
import 'package:qaida/template.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => TemplateProvider()),
        ChangeNotifierProvider(create: (_) => InterestsProvider()),
        ChangeNotifierProvider(create: (_) => RegistrationProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => GeolocationProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ReviewProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => RecommendationProvider()),
        ChangeNotifierProvider(create: (_) => PlaceProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qaida',
      theme: ThemeData(
        scaffoldBackgroundColor: context.watch<ThemeProvider>().darkWhite,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: context.watch<ThemeProvider>().darkWhite,
          unselectedItemColor: const Color(0x66000000),
          selectedItemColor: const Color(0x66000000),
        ),
      ),
      home: const Template(),
    );
  }
}
