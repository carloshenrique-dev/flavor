import 'package:flavor/core/consts.dart';
import 'package:flavor/core/services/dependency_injection.dart';
import 'package:flavor/design_system/widgets/recipe_widget.dart';
import 'package:flavor/modules/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = di<SearchCubit>();
        cubit.getRecentRecipes();
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
              return screen();
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
          'Qual receita você esta procurando hoje?',
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
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
                hintText: 'Procurar receita',
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      child: RiveAnimation.asset(
                        'assets/animations/loading_search.riv',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Text(
                      'Estamos procurando sua receita...',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              );
            }
            if (state.status == ScreenStatus.initial) {
              return const SizedBox.shrink();
            }
            if (state.status == ScreenStatus.completed &&
                state.recipes.isEmpty) {
              return const Expanded(
                child: Center(
                  child: Text(
                    'Nenhuma receita encontrada :(',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
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
