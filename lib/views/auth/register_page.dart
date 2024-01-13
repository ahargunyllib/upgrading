import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/helper.dart';
import '../../services/auth_service.dart';
import '../../services/user_service.dart';
import '../../widgets/custom_snack_bar.dart';
import '../home/home_page.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = "/register";

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool agreeToTerms = false;
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  String fullName = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: theme.primaryColor,
        resizeToAvoidBottomInset: false,
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.white))
            : SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child:
                                  Image.asset("assets/images/logo-icon.png")),
                        ),
                        const SizedBox(height: 77),
                        _buildWelcomeTexts(),
                        const SizedBox(height: 48),
                        _buildForm(size, theme),
                      ],
                    ),
                  ),
                ),
              ));
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
          const SizedBox(height: 8),
          Image.asset("assets/images/logo-text.png"),
          const SizedBox(height: 8),
          Text(
            'Pertama, mari buat akun Anda!',
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
                _buildFullNameFormWidget(),
                const SizedBox(height: 16),
                _buildEmailFormWidget(),
                const SizedBox(height: 16),
                _buildPasswordFormWidget(),
                const SizedBox(height: 16),
                _buildConfirmPasswordFormWidget(),
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

  Widget _buildFullNameFormWidget() {
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
            hintText: "Full Name",
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
              fullName = val;
            });
          },
        ));
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
              hintText: "Password (8 or more characters)",
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
              if (val!.length < 7) {
                return "Password must be at least 8 characters";
              } else {
                return null;
              }
            }));
  }

  Widget _buildConfirmPasswordFormWidget() {
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
              hintText: "Confirm Password",
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
              } else if (val != password) {
                return "Your password doesn't match";
              } else {
                return null;
              }
            }));
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
            fontSize: 10,
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
        onPressed: () {
          register();
        },
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

  register() async {
    if (formKey.currentState!.validate()) {
      if (agreeToTerms) {
        setState(() {
          _isLoading = true;
        });
        await authService.signUp(fullName, email, password).then((value) async {
          if (value == true) {
            await Helper.saveUserLoggedInStatus(true);
            await Helper.saveUserEmail(email);
            await Helper.saveUserName(fullName);
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, "/login");
          } else {
            showSnackBar(context, Colors.red, value);
            setState(() => _isLoading = false);
          }
        });
      } else {
        showSnackBar(context, Colors.red,
            "You need to agree with the terms of service and privacy policy");
      }
    } else {
      showSnackBar(context, Colors.red, "Your password does not match");
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
