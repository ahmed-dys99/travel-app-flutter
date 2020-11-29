import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/boiler_screen.dart';
import 'package:travel/places/place_screen.dart';
import 'package:travel/providers/locations_provider.dart';
import 'package:travel/providers/places_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Locations()),
        ChangeNotifierProvider(create: (ctx) => Places()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BiolerScreen(),
        routes: {
          '/place': (ctx) => PlaceScreen(),
        },
      ),
    );
  }
}
