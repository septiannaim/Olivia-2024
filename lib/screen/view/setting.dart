// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SettingScreen extends StatelessWidget {
//   const SettingScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text(
//           "Setting",
//           style: GoogleFonts.poppins(
//             color: Colors.white,
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         leading: Row(
//           children: [
//             IconButton(
//               icon: const Icon(
//                 Icons.arrow_back_ios,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 16.0),
//             child: SvgPicture.asset(
//               'assets/indonesia.svg',
//               height: 24,
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF7A0202), Colors.white],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 100,
//                 ),
//                 Container(
//                   height: 350.0,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [
//                         Color.fromARGB(255, 123, 120, 120),
//                         Colors.white
//                       ],
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                     ),
//                     borderRadius: const BorderRadius.all(
//                       Radius.circular(12.0),
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.2),
//                         spreadRadius: 1,
//                         blurRadius: 4,
//                         offset: Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 35),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 SvgPicture.asset(
//                                   'assets/kontak.svg',
//                                   width: 24,
//                                   height: 24,
//                                 ),
//                                 const SizedBox(
//                                   width: 15,
//                                 ),
//                                 Text(
//                                   "Profil",
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const Icon(
//                               Icons.arrow_forward_ios,
//                               size: 18.0,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 25,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 10),
//                                   child: SvgPicture.asset(
//                                     'assets/address-book.svg',
//                                     width: 30,
//                                     height: 30,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 15,
//                                 ),
//                                 Text(
//                                   "Kontak Darurat",
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const Icon(
//                               Icons.arrow_forward_ios,
//                               size: 18.0,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 25,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 SvgPicture.asset(
//                                   'assets/person.svg',
//                                   width: 24,
//                                   height: 24,
//                                 ),
//                                 const SizedBox(
//                                   width: 15,
//                                 ),
//                                 Text(
//                                   "Riwayat Kesehatan",
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const Icon(
//                               Icons.arrow_forward_ios,
//                               size: 18.0,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 25,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 SvgPicture.asset(
//                                   'assets/person.svg',
//                                   width: 24,
//                                   height: 24,
//                                 ),
//                                 const SizedBox(
//                                   width: 15,
//                                 ),
//                                 Text(
//                                   "Berlangganan",
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const Icon(
//                               Icons.arrow_forward_ios,
//                               size: 18.0,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 25,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 SvgPicture.asset(
//                                   'assets/person.svg',
//                                   width: 24,
//                                   height: 24,
//                                 ),
//                                 const SizedBox(
//                                   width: 15,
//                                 ),
//                                 Text(
//                                   "Riwayat Laporan",
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const Icon(
//                               Icons.arrow_forward_ios,
//                               size: 18.0,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 25,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 SvgPicture.asset(
//                                   'assets/person.svg',
//                                   width: 24,
//                                   height: 24,
//                                 ),
//                                 const SizedBox(
//                                   width: 15,
//                                 ),
//                                 Text(
//                                   "FAQ?",
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const Icon(
//                               Icons.arrow_forward_ios,
//                               size: 18.0,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Setting",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              "assets/indo.png",
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(200, 122, 2, 2), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    Container(
                      height: 350.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 198, 192, 192),
                            Colors.white
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 35),
                        child: Column(
                          children: [
                            _buildSettingOption(
                              icon: 'assets/kontak.svg',
                              title: 'Profil',
                            ),
                            const SizedBox(height: 25),
                            _buildSettingOption(
                              icon: 'assets/address-book.svg',
                              title: 'Kontak Darurat',
                            ),
                            const SizedBox(height: 25),
                            _buildSettingOption(
                              icon: 'assets/medic.svg',
                              title: 'Riwayat Kesehatan',
                            ),
                            const SizedBox(height: 25),
                            _buildSettingOption(
                              icon: 'assets/Star.svg',
                              title: 'Berlangganan',
                            ),
                            const SizedBox(height: 25),
                            _buildSettingOption(
                              icon: 'assets/riwayat.svg',
                              title: 'Riwayat Laporan',
                            ),
                            const SizedBox(height: 25),
                            _buildSettingOption(
                              icon: 'assets/faq.svg',
                              title: 'FAQ?',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Peringatan"),
                        content: const Text(
                          "Anda Yakin Ingin Keluar?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Tidak"),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInScreen(),
                                ),
                                (route) => false,
                              );
                            },
                            child: const Text("Ya"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: SvgPicture.asset(
                  "assets/keluar.svg",
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingOption({
    required String icon,
    required String title,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 15),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const Icon(
          Icons.arrow_forward_ios,
          size: 18.0,
        ),
      ],
    );
  }
}
