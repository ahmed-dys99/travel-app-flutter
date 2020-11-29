import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/providers/places_provider.dart';

class Sights extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _places = Provider.of<Places>(context).items;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 30),
          ..._places.map((place) {
            return GestureDetector(
              child: Card(
                elevation: 4,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                margin: EdgeInsets.all(12),
                child: Stack(
                  children: [
                    Hero(
                      tag: place.id,
                      child: Image.network(
                        place.imageUrl,
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.width / 2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.width / 2,
                      color: Color.fromRGBO(0, 0, 80, 0.3),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.only(
                        left: 25,
                        bottom: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              place.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              for (int i = 1; i <= 5; i++)
                                Icon(
                                  Icons.star,
                                  color: (place.rating >= i)
                                      ? Color.fromRGBO(255, 210, 0, 1)
                                      : Color.fromRGBO(255, 255, 255, 0.5),
                                  size: 17,
                                ),
                              SizedBox(width: 10),
                              Text(
                                place.rating.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/place', arguments: place.id);
              },
            );
          }).toList(),
          SizedBox(width: 30),
        ],
      ),
    );
  }
}
