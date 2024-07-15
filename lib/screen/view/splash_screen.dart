// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'on_board_screen.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Navigate to OnBoardScreen after 5 seconds
//     Future.delayed(const Duration(seconds: 5), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => OnBoardScreen(),
//         ),
//       );
//     });
//   }

// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:
//           const Color(0xFF8B0000), // Background color similar to your image
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SvgPicture.asset(
//               'assets/Logo-GD.svg', // Update this to the path of your SVG image
//               width: 500,
//               height: 500,
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'A Faithful Friends\nin Emergencies',
//               textAlign: TextAlign.center,
//               style: GoogleFonts.poppins(
//                 color: Colors.white,
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';
import 'on_board_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? hasSeenOnboarding = prefs.getBool('hasSeenOnboarding');

    if (hasSeenOnboarding ?? false) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => OnBoardScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF8B0000),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/Logo-GD.svg', // Update this to the path of your SVG image
              width: 500,
              height: 500,
            ),
            const SizedBox(height: 20),
            Text(
              'A Faithful Friends\nin Emergencies',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
