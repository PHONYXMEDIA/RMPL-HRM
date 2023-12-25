import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late Position _currentPosition;
  late StreamSubscription<Position> _positionStream;

  @override
  void initState() {
    super.initState();
    _currentPosition = Position(
      latitude: 0,
      longitude: 0,
      accuracy: 0,
      altitude: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 0,
      timestamp: DateTime.now(),
      altitudeAccuracy: 0,
      headingAccuracy: 0,
    );
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await _requestLocationPermission();
    } else if (permission == LocationPermission.deniedForever) {
      print('Location permission is permanently denied');
    } else {
      _startLocationUpdates();
    }
  }

  Future<void> _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      print('Location permission denied');
    } else if (permission == LocationPermission.deniedForever) {
      print('Location permission permanently denied');
    } else {
      _startLocationUpdates();
    }
  }

  void _startLocationUpdates() async {
  

    _positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10, 
      ),
    ).listen((Position position) {
      setState(() {
        _currentPosition = position;
      });

 

      print('Live Latitude: ${_currentPosition.latitude}');
      print('Live Longitude: ${_currentPosition.longitude}');
    }, onError: (dynamic error) {
      print('Error obtaining location: $error');
    });
  }

  @override
  void dispose() {
    _positionStream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Live Latitude: ${_currentPosition.latitude}'),
            Text('Live Longitude: ${_currentPosition.longitude}'),
          ],
        ),
      ),
    );
  }
}
