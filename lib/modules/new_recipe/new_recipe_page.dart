import 'package:flavor/core/services/dependency_injection.dart';
import 'package:flavor/modules/new_recipe/cubit/new_recipe_cubit.dart';
import 'package:flavor/modules/new_recipe/widgets/ingredient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/fields.dart';

class NewRecipePage extends StatefulWidget {
  const NewRecipePage({super.key});

  @override
  State<NewRecipePage> createState() => _NewRecipePageState();
}

class _NewRecipePageState extends State<NewRecipePage> {
  final nameController = TextEditingController();
  final preparationController = TextEditingController();
  final timeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var isFormValid = false;

  List<Ingrediente> ingredients = [];

  void addIngredient() {
    setState(() {
      ingredients.add(const Ingrediente());
    });
  }

  void removeIngredient(int index) {
    setState(() {
      ingredients.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<NewRecipeCubit>(),
      child: Form(
        key: _formKey,
        onChanged: () {
          setState(() {
            isFormValid = _formKey.currentState?.validate() ?? false;
          });
        },
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 20,
            ),
            Field(
              fieldName: 'Nome',
              hintText: 'Digite aqui o nome',
              controller: nameController,
            ),
            const SizedBox(
              height: 20,
            ),
            Field(
              fieldName: 'Modo de preparo',
              hintText: 'Digite aqui o modo de preparo',
              controller: preparationController,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Ingredientes",
                    style: GoogleFonts.poppins(),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: addIngredient,
                    icon: const Icon(Icons.add),
                  )
                ],
              ),
            ),
            Visibility(
              visible: ingredients.isNotEmpty,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: ingredients.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) => removeIngredient(index),
                    background: Container(color: Colors.red),
                    child: ingredients[index],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Field(
              fieldName: 'Tempo de preparo',
              hintText: 'Digite aqui o tempo de preparo',
              controller: timeController,
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<NewRecipeCubit, NewRecipeState>(
              builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isFormValid ? Colors.green : Colors.grey,
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await context.read<NewRecipeCubit>().add();
                    }
                  },
                  child: const Text(
                    'Salvar',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
