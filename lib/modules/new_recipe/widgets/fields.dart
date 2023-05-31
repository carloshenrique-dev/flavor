import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Field extends StatelessWidget {
  final String fieldName;
  final String hintText;

  const Field({
    super.key,
    required this.fieldName,
    required this.hintText,
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
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle:
                    GoogleFonts.poppins(color: Colors.grey, fontSize: 14),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
