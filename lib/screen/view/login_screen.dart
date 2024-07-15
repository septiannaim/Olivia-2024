// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guardiantap/screen/view/forget_password.dart';

import 'home.dart';
import 'sign_up.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SvgPicture.asset(
                    'assets/Logo-GD.svg',
                    height: 300,
                    width: 300,
                  ),
                ),
                Center(
                  child: Text(
                    'LOGIN',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
                          'assets/person.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(
                  height: 5,
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
                    obscureText: _obscureText,
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
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.blueGrey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ),
            
                const SizedBox(
                  height: 10,
                ),
          
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResetPassword(),
                      ),
                    );
                  },
                  child: Text(
                    'Forgot your password ?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
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
                    onPressed: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: emailTextController.text,
                              password: passwordTextController.text)
                          .then((value) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (route) => false,
                        );
                      }).onError(
                        (error, stackTrace) {
                          print("Error ${error.toString()}");
                        },
                      );
                    },
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account? ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign up here.',
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

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account? ',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpScreen(),
              ),
            );
          },
          child: Text(
            'Sign up here.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: const Color(0xFF546DF1),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }

  Row forgetPasswordOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ResetPassword(),
              ),
            );
          },
          child: const Text(
            "Forget password",
            style: TextStyle(
                color: Color(0xFF8692F8), fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
