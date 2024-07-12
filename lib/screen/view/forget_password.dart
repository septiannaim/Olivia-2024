// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guardiantap/screen/view/login_screen.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ), // Ubah warna panah kembali menjadi putih
          onPressed: () {
            Navigator.of(context)
                .pop(); // Navigasi kembali ke halaman sebelumnya
          },
        ),
        title: Text(
          "Reset Password",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7A0202), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Text(
                  'An email with the reset\n link will be sent to you',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextFormField(
                    controller: emailTextController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 16.0),
                      filled: true,
                      fillColor: const Color.fromARGB(218, 255, 255, 255),
                      labelStyle: const TextStyle(
                        color: Colors.blueGrey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          'assets/icon_email.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB45858),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(
                              email: emailTextController.text)
                          .then(
                            (value) => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const SignInScreen(),
                              ),
                            ),
                          );
                    },
                    child: Text(
                      'Send',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // reusableTextField("Enter Email", Icons.person_outline, false,
                //     _emailTextController),
                // const SizedBox(
                //   height: 20,
                // ),
                // firebaseButton(
                //   context,
                //   "Reset Password",
                //   () {
                //     FirebaseAuth.instance
                //         .sendPasswordResetEmail(email: _emailTextController.text)
                //         .then(
                //           (value) => Navigator.of(context).pushReplacement(
                //             MaterialPageRoute(
                //               builder: (context) => const SignInScreen(),
                //             ),
                //           ),
                //         );
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
