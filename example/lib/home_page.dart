import 'package:flutter/material.dart';
import 'package:galactic_compass/galactic_compass.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Galactic Compass Test'),
      ),
      body: Center(
        child: StreamBuilder<GalacticCompassData>(
          stream: GalacticCompass.getOrientation(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Sensors not available");
            }

            if (snapshot.hasData) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Angle degree: ${snapshot.data?.angle ?? 0.0}',
                  ),
                  Text(
                    'Angle radians: ${snapshot.data?.toRadians().angle ?? 0.0}',
                  ),
                ],
              );
            }

            return const SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
