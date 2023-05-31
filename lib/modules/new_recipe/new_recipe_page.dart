import 'package:flavor/core/services/dependency_injection.dart';
import 'package:flavor/modules/new_recipe/cubit/new_recipe_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/fields.dart';

class NewRecipePage extends StatelessWidget {
  const NewRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<NewRecipeCubit>(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 20,
            ),
            const Field(
              fieldName: 'Nome',
              hintText: 'Digite aqui o nome',
            ),
            const SizedBox(
              height: 20,
            ),
            const Field(
              fieldName: 'Modo de preparo',
              hintText: 'Digite aqui o modo de preparo',
            ),
            const SizedBox(
              height: 20,
            ),
            const Field(
              fieldName: 'Ingredientes',
              hintText: 'Digite aqui os ingredientes',
            ),
            const SizedBox(
              height: 20,
            ),
            const Field(
              fieldName: 'Tempo de preparo',
              hintText: 'Digite aqui o tempo de preparo',
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<NewRecipeCubit, NewRecipeState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () async {
                    await context.read<NewRecipeCubit>().add();
                  },
                  child: const Text('Salvar'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
