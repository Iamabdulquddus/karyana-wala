import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/location_provider.dart';

class DeliveryMap extends StatelessWidget {
  const DeliveryMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationData = Provider.of<LocationProvider>(context);
    return Center(
      child: Text('${locationData.longitude} :: ${locationData.latitude} '),

    );
  }
}
