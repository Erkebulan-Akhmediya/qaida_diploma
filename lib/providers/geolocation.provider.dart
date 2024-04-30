import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:socket_io_client/socket_io_client.dart';

class GeolocationProvider extends ChangeNotifier {
  Socket? socket;

  Future getLocation() async {
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

  void connect() {
    if (socket == null) {
      socket = io(
        'http://10.0.2.2:8080/geolocation',
        OptionBuilder().setTransports(['websocket']).build(),
      );
      socket?.onConnect((data) {
        print('connected');
      });
      socket?.on('spot', (data) {
        print(data);
      });
      print('listenning to spot events');
    } else {
      print('already connected');
    }
  }

  void sendLocation(String userId, double lat, double lon) {
    final socket = this.socket;
    if (socket != null) {
      socket.emit('send-location', {
        "location": {
          "lat": lat,
          "lon": lon,
        },
        "user_id": userId,
      });
      print('sent location');
    }
  }

  void close() {
    final socket = this.socket;
    if (socket != null) {
      socket.destroy();
    }
  }
}