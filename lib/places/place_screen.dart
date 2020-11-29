import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:travel/providers/places_provider.dart';

class PlaceScreen extends StatefulWidget {
  @override
  _PlaceScreenState createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  ScrollController _controller;
  bool _expanded = true;
  double _height;

  void _scrollListener() {
    if (_expanded == true && _controller.offset > _height / 2) {
      setState(() {
        _expanded = false;
      });
    } else if (_expanded == false && _controller.offset < _height / 2) {
      setState(() {
        _expanded = true;
      });
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller..addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller..removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final place = Provider.of<Places>(context).place(id);
    _height = MediaQuery.of(context).size.height * 0.45;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverAppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: _expanded
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20, left: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(200, 200, 200, 0.2),
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 20),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.grey,
                      ),
                    ),
            ),
            backgroundColor: _expanded ? Colors.white : Colors.white,
            elevation: _expanded ? 2 : 0,
            expandedHeight: _height,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: place.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.network(
                    place.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              centerTitle: true,
              title: (_expanded)
                  ? Padding(
                      padding: const EdgeInsets.only(left: 24.0, bottom: 13),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for (int i = 1; i <= 5; i++)
                            Icon(
                              Icons.star,
                              color: (place.rating >= i)
                                  ? Color.fromRGBO(255, 210, 0, 1)
                                  : Color.fromRGBO(255, 255, 255, 0.6),
                              size: 14,
                            ),
                          SizedBox(width: 10),
                          Text(
                            place.rating.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )
                  : null,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                  children: [
                    Text(
                      place.name,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        color: Color.fromRGBO(55, 55, 55, 1),
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      place.description,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: Color.fromRGBO(150, 150, 150, 1),
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Availaible',
                          style: GoogleFonts.roboto(
                            color: Color.fromRGBO(150, 150, 150, 1),
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '10:00 - 18:00',
                          style: GoogleFonts.roboto(
                            color: Color.fromRGBO(90, 90, 90, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
