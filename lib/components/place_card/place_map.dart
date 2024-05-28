import 'package:dgis_map_kit/dgis_map_kit.dart';
import 'package:flutter/material.dart';

class PlaceMap extends StatelessWidget {
  const PlaceMap({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: double.infinity,
      child: DGisMap(
        token: '1da1a3a7-a804-43d8-92d9-c4ad7ae50848',
        initialCameraPosition: CameraPosition(
          position: const Position(
            lat: 51.166600,
            long: 71.450000,
          ),
          zoom: 20,
        ),
      ),
    );
  }
}