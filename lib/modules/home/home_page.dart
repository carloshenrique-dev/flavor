import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/top_recipes_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'Receitas mais favoritadas',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 270,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const TopRecipesWidget(),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: 3,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Receitas mais vistas',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 270,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const TopRecipesWidget(),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: 3,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Receitas recentemente adicionadas',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 270,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const TopRecipesWidget(),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: 3,
          ),
        ),
      ],
    );
  }
}
