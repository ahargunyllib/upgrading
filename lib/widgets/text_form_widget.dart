import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// *  textInputType - The type of information for which to optimize the text input control.
/// *  hintText - Text that suggests what sort of input the field accepts.
/// *  prefixIcon - Pass Icon if required
/// *  defaultText - If there is predefined value is there for a text field
/// *  focusNode - Currently focus node
/// *  obscureText - Is Password field?
/// *  controller - Text controller
/// *  functionValidate - Validation function(currently I have used to check empty field)
/// *  parametersValidate - Value to validate
/// *  actionKeyboard - Keyboard action eg. next, done, search, etc
/// *  onSubmitField - Done click action
/// *  onFieldTap - On focus on TextField

class TextFormWidget extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autoCorrect;

  const TextFormWidget(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.enableSuggestions,
      required this.autoCorrect});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFAAC0CD),
          ),
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
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
          obscureText: obscureText,
          enableSuggestions: enableSuggestions,
          autocorrect: autoCorrect,
        ));
  }
}
