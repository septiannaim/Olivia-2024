import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guardiantap/screen/view/setting.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          centerTitle: true,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              Text(
                'Guardian Tap',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Tap to Record Video',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/Group-483553.svg',
              width: 500,
              height: 500,
            ),
          ),
          Positioned(
            bottom: 16,
            left: 25,
            child: GestureDetector(
              onTap: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingScreen(),
                      ),
                    );
              },
              child: SvgPicture.asset(
                'assets/setting.svg',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
