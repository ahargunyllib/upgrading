import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrading/core/constant.dart';

import '../../core/helper.dart';
import '../../services/auth_service.dart';
import '../../widgets/custom_snack_bar.dart';

class IdentityFormPage extends StatefulWidget {
  static const routeName = "/identity-form";

  const IdentityFormPage({super.key});

  @override
  State<IdentityFormPage> createState() => _IdentityFormPageState();
}

class _IdentityFormPageState extends State<IdentityFormPage> {
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  String fullName = '';
  String? university;
  String? major;
  String? classYear;
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    String email = (ModalRoute.of(context)!.settings.arguments!
        as Map<String, dynamic>)['email'] as String;
    String password = (ModalRoute.of(context)!.settings.arguments!
        as Map<String, dynamic>)['password'] as String;
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final height = size.height >= 550 ? size.height : 550.toDouble();

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
                    child: SizedBox(
                      height: height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Center(
                            child: Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child:
                                    Image.asset("assets/images/logo-icon.png")),
                          ),
                          const SizedBox(height: 16),
                          _buildWelcomeTexts(),
                          const SizedBox(height: 16),
                          _buildForm(size, theme, email, password),
                        ],
                      ),
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
            'Personal Identity',
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
            'Please fill in your personal data',
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

  Widget _buildForm(Size size, ThemeData theme, String email, String password) {
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
                _buildUniversityFormWidget(),
                const SizedBox(height: 16),
                _buildMajorFormWidget(),
                const SizedBox(height: 16),
                _buildClassFormWidget(),
                const SizedBox(height: 16),
                _buildConfirmButton(theme, email, password),
                const SizedBox(height: 16),
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

  Widget _buildUniversityFormWidget() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFAAC0CD), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFAAC0CD), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          fillColor: Colors.white,
          filled: true),
      items: universityItems,
      value: university,
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0A0A0A)),
      ),
      dropdownColor: Colors.white,
      focusColor: Colors.white,
      hint: Text(
        'Enter your university name',
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF9E9E9E),
        ),
      ),
      onChanged: (String? newValue) {
        setState(() {
          university = newValue!;
        });
      },
    );
  }

  Widget _buildMajorFormWidget() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFAAC0CD), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFAAC0CD), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          fillColor: Colors.white,
          filled: true),
      items: majorItems,
      value: major,
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0A0A0A)),
      ),
      dropdownColor: Colors.white,
      focusColor: Colors.white,
      hint: Text(
        'Enter the name of your major',
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF9E9E9E),
        ),
      ),
      onChanged: (String? newValue) {
        setState(() {
          major = newValue!;
        });
      },
    );
  }

  Widget _buildClassFormWidget() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFAAC0CD), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFAAC0CD), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          fillColor: Colors.white,
          filled: true),
      items: classItems,
      value: classYear,
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0A0A0A)),
      ),
      dropdownColor: Colors.white,
      focusColor: Colors.white,
      hint: Text(
        'Enter your class year',
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF9E9E9E),
        ),
      ),
      onChanged: (String? newValue) {
        setState(() {
          classYear = newValue!;
        });
      },
    );
  }

  Widget _buildConfirmButton(ThemeData theme, String email, String password) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: ElevatedButton(
        onPressed: () {
          register(fullName, email, password);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: theme.primaryColor,
        ),
        child: Text(
          "Confirm",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  register(fullName, email, password) async {
    await authService.signUp(fullName, email, password).then((value) async {
      if (value == true) {
        await Helper.saveUserLoggedInStatus(true);
        await Helper.saveUserEmail(email);
        await Helper.saveUserName(fullName);
        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: const Color(0xFF00416A),
                icon: Image.asset("assets/images/success-login-icon.png"),
                title: Text(
                  'Akun berhasil dibuat',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                actions: [
                  SizedBox(
                    width: double.infinity,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/login");
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF00416A),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            });
      } else {
        showSnackBar(context, Colors.red, value);
        setState(() => _isLoading = false);
      }
    });
  }
}
