import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/text_form_widget.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = "/register";

  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00416A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 77),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Welcome to',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Upgrading',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Let\'s create an account first!',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Stack(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 48),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            const TextFormWidget(
                                hintText: "Email",
                                autoCorrect: true,
                                enableSuggestions: true,
                                obscureText: false),
                            const SizedBox(height: 16),
                            const TextFormWidget(
                              hintText: "Password (8 or more characters)",
                              autoCorrect: false,
                              enableSuggestions: false,
                              obscureText: true,
                            ),
                            const SizedBox(height: 16),
                            const TextFormWidget(
                              hintText: "Confirm Password",
                              autoCorrect: false,
                              enableSuggestions: false,
                              obscureText: true,
                            ),
                            const SizedBox(height: 16),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    value: false,
                                    onChanged: (value) {},
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "I agree with the ",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF0A0A0A),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  GestureDetector(
                                      child: Text(
                                        "terms of service",
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xFF00416A),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      onTap: () {}),
                                  Text(
                                    " and ",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF0A0A0A),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  GestureDetector(
                                      child: Text(
                                        "privacy policy",
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xFF00416A),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      onTap: () {}),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              height: 46,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    backgroundColor: const Color(0xFF00416A)),
                                child: Text(
                                  "Sign Up",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Center(
                              child: Text(
                                'or',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFF9E9E9E),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              height: 46,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    backgroundColor: Colors.white),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const FaIcon(FontAwesomeIcons.google,
                                        color: Color(0xFF00416A)),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Sign Up with Google",
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFF00416A),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Center(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already have an account? ",
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFF00416A),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    GestureDetector(
                                        child: Text(
                                          "Log in",
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xFF002035),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, "/login");
                                        }),
                                  ]),
                            ),
                            const SizedBox(height: 69),
                          ],
                        ),
                      ),
                    ))
              ])
            ],
          ),
        ),
      ),
    );
  }
}
