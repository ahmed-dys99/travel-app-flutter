import 'package:flutter/material.dart';
import 'package:travel/home/home_screen.dart';

class BiolerScreen extends StatefulWidget {
  @override
  _BiolerScreenState createState() => _BiolerScreenState();
}

class _BiolerScreenState extends State<BiolerScreen> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0,
        backgroundColor: Colors.white,
        leading: Container(
          padding: EdgeInsets.only(top: 10, left: 20),
          child: Image.asset(
            'images/menu.png',
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 10,
              ),
            ],
          ),
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: (_pageIndex == 0) ? Color.fromRGBO(45, 132, 236, 1) : Color.fromRGBO(180, 180, 180, 1),
                ),
                onPressed: () {
                  if (_pageIndex != 0) {
                    setState(() {
                      _pageIndex = 0;
                    });
                  }
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: (_pageIndex == 1) ? Color.fromRGBO(45, 132, 236, 1) : Color.fromRGBO(180, 180, 180, 1),
                ),
                onPressed: () {
                  if (_pageIndex != 1) {
                    setState(() {
                      _pageIndex = 1;
                    });
                  }
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: (_pageIndex == 2) ? Color.fromRGBO(45, 132, 236, 1) : Color.fromRGBO(180, 180, 180, 1),
                ),
                onPressed: () {
                  if (_pageIndex != 2) {
                    setState(() {
                      _pageIndex = 2;
                    });
                  }
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.person_outline,
                  color: (_pageIndex == 3) ? Color.fromRGBO(45, 132, 236, 1) : Color.fromRGBO(180, 180, 180, 1),
                ),
                onPressed: () {
                  if (_pageIndex != 3) {
                    setState(() {
                      _pageIndex = 3;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
      body: (_pageIndex == 0) ? Home() : Container(),
    );
  }
}
