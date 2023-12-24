import 'package:flutter/material.dart';
import 'package:rmpl_hrm/features/geolocation/view/geo_location_view.dart';

class LocationPage extends StatelessWidget {
  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const LocationPage(),
      );

  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LocationScreen();
  }
}
