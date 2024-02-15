import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:qaida/providers/interests.dart';

class Interests extends StatefulWidget {
  const Interests({super.key});

  @override
  State<StatefulWidget> createState() => _InterestState();
}

class _InterestState extends State<Interests> {
  late Future<List> _interests;

  @override
  void initState() {
    super.initState();
    _interests = context.read<InterestsProvider>().fetchInterests();
  }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder<List>(
    //   future: _interests,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const CircularProgressIndicator();
    //     } else if (snapshot.hasError) {
    //       return const Text('Ошибка :(');
    //     } else {
    //       return Scaffold(
    //         body: Text(snapshot.data.toString()),
    //       );
    //     }
    //   },
    // );
    return Scaffold(
      body: FutureBuilder<List>(
        future: _interests,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text('Ошибка :(');
          } else {
            final interests = snapshot.data;
            return ListView.builder(
              itemCount: interests?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(interests![index].toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}