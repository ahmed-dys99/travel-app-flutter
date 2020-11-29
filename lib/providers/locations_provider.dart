import 'package:flutter/material.dart';

class Location {
  final int id;
  final String name;

  Location({this.id, this.name});
}

class Locations with ChangeNotifier {
  List<Location> _items = [
    Location(id: 1, name: 'Pakistan'),
    Location(id: 2, name: 'Canada'),
    Location(id: 3, name: 'Turkey'),
    Location(id: 4, name: 'China'),
  ];

  List<Location> get items {
    return [..._items];
  }
}
