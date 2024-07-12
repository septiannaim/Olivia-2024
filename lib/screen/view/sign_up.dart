// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // TextEditingController nameTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController passwordVerivicationTextController =
      TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  bool _isPasswordVisible = false;
  bool _isPasswordVerificationVisible = false;

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: Text(
                    'SIGN UP',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
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
                    controller: nameTextController,
                    decoration: InputDecoration(
                      hintText: "Name",
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
                          'assets/person.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                // reusableTextField(
                //   "Enter Name",
                //   Icons.person_outline,
                //   false,
                //   nameTextController,
                // ),
                const SizedBox(
                  height: 10,
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
                    controller: _emailTextController,
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
                          'assets/profile.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                // reusableTextField(
                //   "Enter Email",
                //   Icons.mail,
                //   false,
                //   _emailTextController,
                // ),
                const SizedBox(
                  height: 10,
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
                    controller: passwordTextController,
                    obscureText: _isPasswordVisible,
                    decoration: InputDecoration(
                      hintText: "Password",
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
                          'assets/password.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.blueGrey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                // reusableTextField(
                //   "Enter Password",
                //   Icons.lock_outlined,
                //   true,
                //   passwordTextController,
                //   _isPasswordVisible,
                //   () {
                //     setState(() {
                //       _isPasswordVisible = !_isPasswordVisible;
                //     });
                //   },
                // ),
                const SizedBox(
                  height: 10,
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
                    controller: passwordVerivicationTextController,
                    obscureText: _isPasswordVerificationVisible,
                    decoration: InputDecoration(
                      hintText: "Verify Password",
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
                          'assets/password.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVerificationVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.blueGrey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVerificationVisible =
                                !_isPasswordVerificationVisible;
                          });
                        },
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                // reusableTextField(
                //   "Verification Password",
                //   Icons.lock_outlined,
                //   true,
                //   passwordVerivicationTextController,
                //   _isPasswordVerificationVisible,
                //   () {
                //     setState(() {
                //       _isPasswordVerificationVisible =
                //           !_isPasswordVerificationVisible;
                //     });
                //   },
                // ),
                const SizedBox(
                  height: 10,
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
                    controller: addressTextController,
                    decoration: InputDecoration(
                      hintText: "Address",
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
                          'assets/address.svg',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                // reusableTextField(
                //   "Address",
                //   Icons.mail,
                //   false,
                //   addressTextController,
                // ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(159, 217, 171, 171),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      if (passwordTextController.text !=
                          passwordVerivicationTextController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Password dan verifikasi password tidak sama',
                            ),
                          ),
                        );
                        return;
                      }
                      try {
                        UserCredential userCredential =
                            await _auth.createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: passwordTextController.text,
                        );

                        User? user = userCredential.user;
                        if (user != null) {
                          await _database
                              .child(
                            'users/${nameTextController.text}',
                          )
                              .set({
                            'id': user.uid,
                            'name': nameTextController.text,
                            'email': user.email,
                            'address': addressTextController.text,
                            'foto_profile': "",
                            'phone': "",
                            'gender': "",
                            // 'password': passwordTextController.text,
                          });

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()),
                            (route) => false,
                          );
                        }
                      } catch (error) {
                        print('Registration failed: ${error.toString()}');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              // 'Registration failed: Harap lengkapi data di atas',
                              'Registration failed: ${error.toString()}',
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // firebaseButton(
                //   context,
                //   "Sign Up",
                //   () async {
                //     if (passwordTextController.text !=
                //         passwordVerivicationTextController.text) {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(
                //           content: Text(
                //             'Password dan verifikasi password tidak sama',
                //           ),
                //         ),
                //       );
                //       return;
                //     }
                //     try {
                //       UserCredential userCredential =
                //           await _auth.createUserWithEmailAndPassword(
                //         email: _emailTextController.text,
                //         password: passwordTextController.text,
                //       );

                //       User? user = userCredential.user;
                //       if (user != null) {
                //         await _database
                //             .child(
                //           'users/${nameTextController.text}',
                //         )
                //             .set({
                //           'id': user.uid,
                //           'name': nameTextController.text,
                //           'email': user.email,
                //           'address': addressTextController.text,
                //           // 'password': passwordTextController.text,
                //         });

                //         Navigator.pushAndRemoveUntil(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => const SignInScreen()),
                //           (route) => false,
                //         );
                //       }
                //     } catch (error) {
                //       print('Registration failed: ${error.toString()}');
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(
                //           content: Text(
                //             // 'Registration failed: Harap lengkapi data di atas',
                //             'Registration failed: ${error.toString()}',
                //           ),
                //         ),
                //       );
                //     }
                //   },
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Login here.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF546DF1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have account?",
            style: TextStyle(color: Color(0xFF8692F8))),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInScreen(),
              ),
            );
          },
          child: const Text(
            " Login",
            style: TextStyle(
                color: Color(0xFF8692F8), fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
