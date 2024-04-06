import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Field extends StatelessWidget {
  final String fieldName;
  final String hintText;
  final TextEditingController controller;

  const Field({
    super.key,
    required this.fieldName,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: GoogleFonts.poppins(),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 50,
          child: Center(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: hintText,
              ),
              controller: controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }
}
