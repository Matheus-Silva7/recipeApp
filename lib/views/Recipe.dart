import 'package:flutter/material.dart';
import 'package:recipeapp/models/model_allrecipes.dart';

class RecipeScreen extends StatelessWidget {
  final Data recipeData;

  const RecipeScreen({Key? key, required this.recipeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeData.title ?? 'Detalhes da Receita'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recipeData.title ?? 'Nome da Receita Indisponível',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "Ingredientes:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Exibir os ingredientes
            if (recipeData.ingredients != null && recipeData.ingredients!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recipeData.ingredients!.map((ingredient) {
                  return Text(
                    ingredient,
                    style: TextStyle(fontSize: 18),
                  );
                }).toList(),
              ),
            SizedBox(height: 16),
            Text(
              "Modo de Preparo:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Exibir as etapas
            if (recipeData.recipe != null && recipeData.recipe!.steps != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recipeData.recipe!.steps!.map((step) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (step.image != null)
                        Image.network(
                          step.image!,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      Text(
                        step.text ?? '',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 16),
                    ],
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
