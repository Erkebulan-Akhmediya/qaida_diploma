import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/providers/template.provider.dart';

class ReviewPlaceListItemImage extends StatelessWidget {
  final String url;

  const ReviewPlaceListItemImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 70,
      child: FutureBuilder(
        future: context.read<TemplateProvider>().isValidImgUrl(url),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return snapshot.data!
                ? Image.network(
                    url,
                    fit: BoxFit.cover,
                  )
                : const Center(child: Icon(Icons.image_outlined));
          }
        },
      ),
    );
  }
}
