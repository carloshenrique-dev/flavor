import 'package:flavor/core/consts.dart';
import 'package:flavor/core/services/dependency_injection.dart';
import 'package:flavor/design_system/widgets/recipe_widget.dart';
import 'package:flavor/modules/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = di<SearchCubit>();
        cubit.search('');
        return cubit;
      },
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          switch (state.status) {
            case ScreenStatus.error:
              return const Text('Error');
            case ScreenStatus.completed:
              return screen();
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget screen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What recipe are you looking for today?',
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return TextFormField(
              cursorColor: Colors.black,
              onFieldSubmitted: (value) async {
                if (value.isNotEmpty) {
                  await context.read<SearchCubit>().search(value);
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[500],
                ),
                hintText: 'Search recipe',
                hintStyle: GoogleFonts.poppins(
                  color: Colors.grey[500],
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(60),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(60),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(60),
                  ),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(60),
                  ),
                ),
              ),
            );
          },
        ),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state.status == ScreenStatus.loading) {
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state.status == ScreenStatus.initial) {
              return const SizedBox.shrink();
            }
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.separated(
                  itemCount: state.recipes.length,
                  itemBuilder: (context, index) {
                    return RecipeWidget(recipe: state.recipes[index]);
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.grey[400],
                      height: 20,
                      thickness: .5,
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
