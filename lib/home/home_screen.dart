import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';
import './sights_widget.dart';
import 'package:travel/providers/locations_provider.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _value = 1;
  List<Location> _items;
  bool _isLoading = true;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      _items = Provider.of<Locations>(context, listen: false).items;
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Discover',
                      style: GoogleFonts.roboto(
                        color: Color.fromRGBO(80, 80, 80, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(width: 12),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        elevation: 1,
                        dropdownColor: Colors.white,
                        value: _value,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Color.fromRGBO(150, 150, 150, 1),
                        ),
                        items: _items.map((item) {
                          return DropdownMenuItem(
                            child: (_value == item.id)
                                ? DottedBorder(
                                    dashPattern: [5, 5],
                                    color: Color.fromRGBO(210, 210, 210, 1),
                                    customPath: (size) {
                                      return Path()
                                        ..moveTo(0, size.height)
                                        ..lineTo(size.width + 3, size.height);
                                    },
                                    child: Text(
                                      item.name,
                                      style: GoogleFonts.roboto(
                                        color: Color.fromRGBO(58, 140, 237, 1),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22,
                                      ),
                                    ),
                                  )
                                : Text(
                                    item.name,
                                    style: GoogleFonts.roboto(
                                      color: Color.fromRGBO(90, 90, 90, 1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                            value: item.id,
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          print(newVal);
                          setState(() {
                            _value = newVal;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                MyNavigation(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular categories',
                            style: GoogleFonts.roboto(
                              color: Color.fromRGBO(55, 55, 55, 1),
                              fontSize: 15.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'more',
                            style: GoogleFonts.roboto(
                              color: Color.fromRGBO(58, 140, 237, 1),
                              fontSize: 15.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromRGBO(245, 245, 245, 1),
                                ),
                                padding: EdgeInsets.all(18),
                                child: Icon(
                                  FontAwesome5.building,
                                  size: 20,
                                  color: Color.fromRGBO(54, 54, 54, 1),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Hotel',
                                style: TextStyle(color: Color.fromRGBO(110, 110, 110, 1)),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromRGBO(245, 245, 245, 1),
                                ),
                                padding: EdgeInsets.all(18),
                                child: Icon(
                                  Ionicons.ios_car,
                                  size: 20,
                                  color: Color.fromRGBO(54, 54, 54, 1),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Car',
                                style: TextStyle(color: Color.fromRGBO(110, 110, 110, 1)),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromRGBO(245, 245, 245, 1),
                                ),
                                padding: EdgeInsets.all(18),
                                child: Icon(
                                  Feather.activity,
                                  size: 20,
                                  color: Color.fromRGBO(54, 54, 54, 1),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Activity',
                                style: TextStyle(color: Color.fromRGBO(110, 110, 110, 1)),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromRGBO(245, 245, 245, 1),
                                ),
                                padding: EdgeInsets.all(18),
                                child: Icon(
                                  Ionicons.md_boat,
                                  size: 20,
                                  color: Color.fromRGBO(54, 54, 54, 1),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Boat',
                                style: TextStyle(color: Color.fromRGBO(110, 110, 110, 1)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Useful information',
                              style: GoogleFonts.roboto(
                                color: Color.fromRGBO(55, 55, 55, 1),
                                fontSize: 15.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'more',
                              style: GoogleFonts.roboto(
                                color: Color.fromRGBO(58, 140, 237, 1),
                                fontSize: 15.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 22),
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            'https://atalayar.com/sites/default/files/styles/foto_/public/noticias/Atalayar_Qatar%20Airways%20Despidos%20Coronavirus%20%282%29.jpg',
                            fit: BoxFit.cover,
                            width: 55,
                            height: 55,
                          ),
                        ),
                        title: Text('Qatar Airways'),
                        subtitle: Text('is offering 30 percent discounts to our customers'),
                      ),
                      SizedBox(height: 15),
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            'https://pix10.agoda.net/geo/city/14932/1_14932_02.jpg',
                            fit: BoxFit.cover,
                            width: 55,
                            height: 55,
                          ),
                        ),
                        title: Text('Turkish visa'),
                        subtitle: Text('restrictions have been relaxed for muslim countries'),
                      ),
                      SizedBox(height: 15),
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            'https://en.as.com/en/imagenes/2020/04/23/other_sports/1587598017_262518_1587598135_noticia_normal_recorte1.jpg',
                            fit: BoxFit.cover,
                            width: 55,
                            height: 55,
                          ),
                        ),
                        title: Text('Newyork'),
                        subtitle: Text('flooded with covid cases. Unsafe to travel to'),
                      ),
                      SizedBox(height: 15),
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/9f/bc/57/hunza-serena-inn.jpg?w=900&h=-1&s=1',
                            fit: BoxFit.cover,
                            width: 55,
                            height: 55,
                          ),
                        ),
                        title: Text('Hunza in Pakistan'),
                        subtitle: Text('declared as the best travel destination by Frobes'),
                      ),
                      SizedBox(height: 100),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}

class MyNavigation extends StatefulWidget {
  @override
  _MyNavigationState createState() => _MyNavigationState();
}

class _MyNavigationState extends State<MyNavigation> {
  int _buttonNum = 0;
  final _buttons = [
    [0, 'Sights'],
    [1, 'Tours'],
    [2, 'Experience'],
    [3, 'News'],
  ];

  void changeState(int val) {
    if (val != _buttonNum) {
      setState(() {
        _buttonNum = val;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _buttons.map((button) {
              return GestureDetector(
                child: (_buttonNum == button[0])
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color.fromRGBO(240, 240, 240, 1)),
                          borderRadius: BorderRadius.circular(16),
                          color: Color.fromRGBO(242, 244, 255, 1),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 23, vertical: 8),
                        child: Text(
                          button[1],
                          style: GoogleFonts.roboto(
                            color: Color.fromRGBO(58, 140, 237, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          button[1],
                          style: GoogleFonts.roboto(
                            color: Color.fromRGBO(180, 180, 180, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                onTap: () => changeState(button[0]),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 18),
        if (_buttonNum == 0) Sights(),
      ],
    );
  }
}
