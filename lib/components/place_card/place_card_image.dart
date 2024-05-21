import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/providers/template.provider.dart';

class PlaceCardImage extends StatelessWidget {
  final Map? place;

  const PlaceCardImage({super.key, this.place});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: context.read<TemplateProvider>().isValidImgUrl(place?['image']),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            width: 200,
            height: 90,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return Container(
          width: 200,
          height: 90,
          decoration:
              place == null || place!['image'] == null || !snapshot.data!
                  ? null
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(place!['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
          child: place == null || place!['image'] == null || !snapshot.data!
              ? const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Center(child: Icon(Icons.image_outlined, size: 50)),
                )
              : null,
        );
      },
    );
  }
}
