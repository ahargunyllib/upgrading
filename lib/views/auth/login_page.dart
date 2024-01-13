import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrading/services/auth_service.dart';
import 'package:upgrading/services/user_service.dart';

import '../../core/helper.dart';
import '../../widgets/custom_snack_bar.dart';
import '../home/home_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/login";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.primaryColor,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Center(
                        child: Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Image.asset("assets/images/logo-icon.png")),
                      ),
                      _buildWelcomeTexts(),
                      const SizedBox(height: 48),
                      _buildForm(size, theme, context),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildWelcomeTexts() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 77.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Welcome back to',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Image.asset("assets/images/logo-text.png"),
          const SizedBox(height: 8),
          Text(
            'Silakan masukkan Email dan Password Anda',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm(Size size, ThemeData theme, BuildContext context) {
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
                _buildEmailFormWidget(),
                const SizedBox(height: 16),
                _buildPasswordFormWidget(),
                const SizedBox(height: 16),
                _buildForgotPasswordButton(theme),
                const SizedBox(height: 16),
                _buildLogInButton(theme),
                const SizedBox(height: 16),
                _buildOrSeparator(),
                const SizedBox(height: 16),
                _buildGoogleSignUpButton(theme),
                const SizedBox(height: 16),
                _buildSignUpPrompt(theme, context),
                const SizedBox(height: 69),
              ],
            ),
          ),
        ),
      )
    ]);
  }

  Widget _buildEmailFormWidget() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFAAC0CD),
          ),
        ),
        child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Email",
              hintStyle: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF9E9E9E),
              ),
              contentPadding: const EdgeInsets.only(left: 16),
            ),
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0A0A0A)),
            ),
            obscureText: false,
            enableSuggestions: true,
            autocorrect: true,
            onChanged: (val) {
              setState(() {
                email = val;
              });
            },
            validator: (val) {
              return RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(val!)
                  ? null
                  : "Please enter a valid email";
            }));
  }

  Widget _buildPasswordFormWidget() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFAAC0CD),
          ),
        ),
        child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Password",
              hintStyle: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF9E9E9E),
              ),
              contentPadding: const EdgeInsets.only(left: 16),
            ),
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0A0A0A)),
            ),
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            onChanged: (val) {
              setState(() {
                password = val;
              });
            },
            validator: (val) {
              if (val!.length < 6) {
                return "Password must be at least 6 characters";
              } else {
                return null;
              }
            }));
  }

  Widget _buildLogInButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: ElevatedButton(
        onPressed: () {
          login();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: theme.primaryColor,
        ),
        child: Text(
          "Log In",
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
        onPressed: () {
          loginWithGoogle();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/google-icon.png"),
            const SizedBox(width: 8),
            Text(
              "Log In with Google",
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

  Widget _buildSignUpPrompt(ThemeData theme, BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account? ",
            style: GoogleFonts.poppins(
              color: theme.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            child: Text(
              "Sign up",
              style: GoogleFonts.poppins(
                color: theme.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, "/register");
            },
          ),
        ],
      ),
    );
  }

  _buildForgotPasswordButton(ThemeData theme) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        child: Text(
          "Forgot Password?",
          style: GoogleFonts.poppins(
            color: theme.primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        onTap: () {},
      ),
    );
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService.logIn(email, password).then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await UserService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingUserData(email);
          await Helper.saveUserLoggedInStatus(true);
          await Helper.saveUserEmail(email);
          await Helper.saveUserName(snapshot.docs[0]['fullName']);
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, HomePage.routeName);
        } else {
          showSnackBar(context, Colors.red, value.toString());
          setState(() => _isLoading = false);
        }
      });
    }
  }

  loginWithGoogle() async {
    setState(() {
      _isLoading = true;
    });
    await authService.logInWithGoogle().then((value) async {
      if (value == true) {
        User user = FirebaseAuth.instance.currentUser!;
        QuerySnapshot snapshot =
            await UserService(uid: user.uid).gettingUserData(user.email!);
        await Helper.saveUserLoggedInStatus(true);
        await Helper.saveUserEmail(user.email!);
        await Helper.saveUserName(snapshot.docs[0]['fullName']);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      } else {
        showSnackBar(context, Colors.red, value.toString());
        setState(() => _isLoading = false);
      }
    });
  }
}
