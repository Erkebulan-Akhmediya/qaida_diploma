import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class GeolocationProvider extends ChangeNotifier {
  late WebSocketChannel channel;

  getLocation() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      status = await Permission.location.request();
      if (!status.isGranted) {
        return Future.error('Location permissions are denied');
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return {
      "lat": position.latitude,
      "lon": position.longitude,
    };
  }

  Future<void> connect() async {
    channel = WebSocketChannel.connect(
      Uri.parse('ws://10.0.2.2:8080/geolocation'),
    );
    await channel.ready;
    channel.stream.listen((event) {
      print(event);
    });
  }

  void sendLocation(String userId, double lat, double lon) {
    channel.sink.add({
      "location": {
        "lat": lat,
        "lon": lon,
      },
      "user_id": userId,
    });
  }

  Future<void> close() async {
    await channel.sink.close();
  }
}