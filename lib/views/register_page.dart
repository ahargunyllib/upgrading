import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/text_form_widget.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = "/register";

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 77),
              _buildWelcomeTexts(),
              const SizedBox(height: 48),
              _buildForm(size, theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeTexts() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Welcome to',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Upgrading',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Let\'s create an account first!',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm(Size size, ThemeData theme) {
    return Stack(children: [
      Container(
        width: size.width,
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
                _buildTextFormWidget("Email", true, true, false),
                const SizedBox(height: 16),
                _buildTextFormWidget(
                    "Password (8 or more characters)", false, false, true),
                const SizedBox(height: 16),
                _buildTextFormWidget("Confirm Password", false, false, true),
                const SizedBox(height: 16),
                _buildAgreementRow(theme),
                const SizedBox(height: 16),
                _buildSignUpButton(theme),
                const SizedBox(height: 16),
                _buildOrSeparator(),
                const SizedBox(height: 16),
                _buildGoogleSignUpButton(theme),
                const SizedBox(height: 16),
                _buildLoginPrompt(theme),
                const SizedBox(height: 69),
              ],
            ),
          ),
        ),
      )
    ]);
  }

  Widget _buildTextFormWidget(String hintText, bool autoCorrect,
      bool enableSuggestions, bool obscureText) {
    return TextFormWidget(
        hintText: hintText,
        autoCorrect: autoCorrect,
        enableSuggestions: enableSuggestions,
        obscureText: obscureText);
  }

  Widget _buildAgreementRow(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: agreeToTerms,
          onChanged: (value) {
            setState(() {
              agreeToTerms = value!;
            });
          },
        ),
        const SizedBox(width: 8),
        Text(
          "I agree with the terms of service and privacy policy",
          style: GoogleFonts.poppins(
            color: theme.primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: theme.primaryColor,
        ),
        child: Text(
          "Sign Up",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildOrSeparator() {
    return Center(
      child: Text(
        'or',
        style: GoogleFonts.poppins(
          color: const Color(0xFF9E9E9E),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildGoogleSignUpButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(FontAwesomeIcons.google, color: theme.primaryColor),
            const SizedBox(width: 8),
            Text(
              "Sign Up with Google",
              style: GoogleFonts.poppins(
                color: theme.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginPrompt(ThemeData theme) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account? ",
            style: GoogleFonts.poppins(
              color: theme.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            child: Text(
              "Log in",
              style: GoogleFonts.poppins(
                color: theme.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, "/login");
            },
          ),
        ],
      ),
    );
  }
}
