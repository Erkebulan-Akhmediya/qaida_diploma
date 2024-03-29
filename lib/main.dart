import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/providers/auth.dart';
import 'package:qaida/providers/geolocation.dart';
import 'package:qaida/providers/interests.dart';
import 'package:qaida/providers/login.dart';
import 'package:qaida/providers/registration.dart';
import 'package:qaida/providers/template.dart';
import 'package:qaida/providers/user.dart';
import 'package:qaida/template.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<TemplateProvider>(
          create: (context) => TemplateProvider(),
        ),
        ChangeNotifierProvider<InterestsProvider>(
          create: (context) => InterestsProvider(),
        ),
        ChangeNotifierProvider<RegistrationProvider>(
          create: (context) => RegistrationProvider(),
        ),
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider<GeolocationProvider>(
          create: (context) => GeolocationProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qaida',
      home: Template(),
    );
  }
}
