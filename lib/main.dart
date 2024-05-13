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
import 'package:qaida/providers/user.provider.dart';
import 'package:qaida/template.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => TemplateProvider()),
        ChangeNotifierProvider(create: (context) => InterestsProvider()),
        ChangeNotifierProvider(create: (context) => RegistrationProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => GeolocationProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ReviewProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => RecommendationProvider()),
        ChangeNotifierProvider(create: (context) => PlaceProvider()),
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qaida',
      home: Template(),
    );
  }
}
