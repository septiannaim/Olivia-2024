import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login_screen.dart'; // Pastikan import halaman LoginScreen yang benar

class OnBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/images/onboard.svg', // Gambar SVG untuk on board
              height: 300.0,
              width: 300.0,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome To\nGuardian Tap',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'we\'re here to provide immediate assistance with just a tap.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()), // Navigasi ke LoginScreen
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8B0000), // Use primary for background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
              ),
              child: Text(
                'Get Started',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
