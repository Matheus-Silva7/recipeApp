import 'package:flutter/material.dart';
import 'package:recipeapp/models/model_allrecipes.dart'; 

class AllRecipesScreen extends StatelessWidget {
  final List<Items>? recipes;

  const AllRecipesScreen({Key? key, this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todas as Receitas"),
      ),
      body: Center(
        child: recipes != null
            ? ListView.builder(
                itemCount: recipes!.length,
                itemBuilder: (context, index) {
                  final recipe = recipes![index];
                  return GestureDetector(
                    onTap: () {
                      // Aqui você pode adicionar a lógica para lidar com o toque em uma receita individual, se necessário
                    },
                    child: Card(
                      margin: EdgeInsets.all(8),
                      child: ListTile(
                        leading: Image.network(recipe.image ?? ''),
                        title: Text(recipe.name ?? ''),
                        subtitle: Text(recipe.duration ?? ''),
                      ),
                    ),
                  );
                },
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
