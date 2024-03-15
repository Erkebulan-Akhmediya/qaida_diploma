import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/interests/interests.dart';
import 'package:qaida/providers/interests.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: context.read<InterestsProvider>().fetchInterests(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text('error');
          } else {
            return const Interests();
          }
        },
      ),
    );
  }
}