import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopRecipesWidget extends StatelessWidget {
  const TopRecipesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.05),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              'https://ogimg.infoglobo.com.br/in/25091733-abd-cc0/FT1086A/WhatsApp-Image-2021-07-05-at-14.23.35.jpeg.jpg',
              //width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Receita de batatinhadsadsaasdasdadsads',
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.orange,
                  elevation: 0,
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_right_sharp,
                  color: Colors.white,
                ),
                label: Text(
                  'Ver',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text('15 mins'),
            ],
          )
        ],
      ),
    );
  }
}
