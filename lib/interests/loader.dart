import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/interests/interests.dart';
import 'package:qaida/providers/interests.dart';

class Loader extends StatefulWidget {
  const Loader({super.key});

  @override
  State<StatefulWidget> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  late Future<List> _interests;

  @override
  void initState() {
    super.initState();
    _interests = context.read<InterestsProvider>().fetchInterests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: _interests,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text('error');
          } else {
            return Interests(
              interest: snapshot.data!,
            );
          }
        },
      ),
    );
  }
}