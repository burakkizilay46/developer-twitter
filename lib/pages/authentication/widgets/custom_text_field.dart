import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String customHintText;

  const CustomTextFormField({Key? key, required this.customHintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        style: GoogleFonts.aBeeZee(),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.person,
            color: Colors.cyan,
            size: 30,
          ),
          hintText: customHintText,
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(
                color: Colors.cyan,
              )),
          focusedBorder: const OutlineInputBorder(
              borderSide:  BorderSide(),
              borderRadius:  BorderRadius.all(Radius.circular(50))),
        ),
      ),
    );
  }
}
