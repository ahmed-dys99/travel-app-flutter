import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GettingStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(206, 108, 252, 1),
              Color.fromRGBO(82, 121, 238, 1),
            ],
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Travel App',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 28,
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  'Find and try a new experience with just a few clicks',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
